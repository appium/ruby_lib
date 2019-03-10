# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'rubygems'
require 'selenium-webdriver'
require 'nokogiri'

require 'appium_lib_core'

# base
require_relative 'driver'
require_relative 'sauce_labs'

# common
require_relative 'common/wait'
require_relative 'common/log'
require_relative 'common/helper'
require_relative 'common/multi_touch'
require_relative 'common/touch_actions'
require_relative 'common/http_client'
require_relative 'common/device'
require_relative 'common/command'

# ios
require_relative 'ios/ios'

# android
require_relative 'android/android'

module Appium
  class << self
    # Load arbitrary text ([toml format](https://github.com/toml-lang/toml))
    # The toml is parsed by https://github.com/fbernier/tomlrb .
    #
    # ```
    # [caps]
    # app = "path/to/app"
    #
    # [appium_lib]
    # port = 8080
    # ```
    #
    # :app is expanded
    # :require is expanded
    # all keys are converted to symbols
    #
    # @param opts [Hash] file: '/path/to/appium.txt', verbose: true
    # @return [hash] the symbolized hash with updated :app and :require keys
    def load_settings(opts = {})
      raise 'opts must be a hash' unless opts.is_a? Hash
      raise 'opts must not be empty' if opts.empty?

      toml = opts[:file]
      raise 'Must pass a capability file which has [caps] and [appium_lib]' unless toml

      verbose = opts.fetch :verbose, false

      Appium::Logger.info "appium settings path: #{toml}" if verbose

      toml_exists = File.exist? toml
      Appium::Logger.info "Exists? #{toml_exists}" if verbose

      raise "toml doesn't exist #{toml}" unless toml_exists

      require 'tomlrb'
      Appium::Logger.info "Loading #{toml}" if verbose

      data = Tomlrb.load_file(toml, symbolize_keys: true)
      if verbose
        Appium::Logger.info data unless data.empty?
      end

      if data && data[:caps] && data[:caps][:app] && !data[:caps][:app].empty?
        data[:caps][:app] = Appium::Driver.absolute_app_path data
      end

      if data && data[:appium_lib] && data[:appium_lib][:require]
        parent_dir = File.dirname toml
        data[:appium_lib][:require] = expand_required_files(parent_dir, data[:appium_lib][:require])
      end

      data
    end
    # @see load_settings
    alias load_appium_txt load_settings

    # @param [String] base_dir parent directory of loaded appium.txt (toml)
    # @param [String] file_paths
    # @return [Array] list of require files as an array, nil if require doesn't exist
    def expand_required_files(base_dir, file_paths)
      # ensure files are absolute
      Array(file_paths).map! do |f|
        file = File.exist?(f) ? f : File.join(base_dir, f)
        file = File.expand_path file

        File.exist?(file) ? file : nil
      end
      file_paths.compact! # remove nils

      files = []

      # now expand dirs
      file_paths.each do |item|
        unless File.directory? item
          # save file
          files << item
          next # only look inside folders
        end
        Dir.glob(File.expand_path(File.join(item, '**', '*.rb'))) do |f|
          # do not add folders to the file list
          files << File.expand_path(f) unless File.directory? f
        end
      end

      files
    end

    # This method is intended to work with page objects that share
    # a common module. For example, Page::HomePage, Page::SignIn
    # those could be promoted on with Appium.promote_singleton_appium_methods Page
    #
    # If you are promoting on an individual class then you should use
    # Appium.promote_appium_methods instead. The singleton method is intended
    # only for the shared module use case.
    #
    # if modules is a module instead of an array, then the constants of
    # that module are promoted on.
    # otherwise, the array of modules will be used as the promotion target.
    #
    # @param [Array<Module>] modules An array of modules
    # @param [Driver] driver A driver to extend for
    def promote_singleton_appium_methods(modules, driver = $driver)
      raise 'Global $driver is nil' if driver.nil?

      target_modules = []

      if modules.is_a? Module
        modules.constants.each do |sub_module|
          target_modules << modules.const_get(sub_module)
        end
      else
        raise 'modules must be a module or an array' unless modules.is_a? Array

        target_modules = modules
      end

      target_modules.each do |const|
        # noinspection RubyResolve
        # rubocop:disable Style/MultilineIfModifier
        driver.public_methods(false).each do |m|
          const.send(:define_singleton_method, m) do |*args, &block|
            begin
              super(*args, &block) # promote.rb
            rescue NoMethodError, ArgumentError
              driver.send m, *args, &block if driver.respond_to?(m)
            end
            # override unless there's an existing method with matching arity
          end unless const.respond_to?(m) && const.method(m).arity == driver.method(m).arity
        end
        # rubocop:enable Style/MultilineIfModifier
      end
    end

    ##
    # Promote appium methods to class instance methods
    #
    # @param [Array<Class>] class_array An array of classes
    # @param [Driver] driver A driver to extend for
    #
    # To promote methods to all classes:
    #
    # @example
    #
    #   Appium.promote_appium_methods Object
    #
    # It's better to promote on specific classes instead of Object
    #
    # @example
    #
    #   # promote on rspec
    #   Appium.promote_appium_methods RSpec::Core::ExampleGroup
    #
    # @example
    #
    #   # promote on minispec
    #   Appium.promote_appium_methods Minitest::Spec
    #
    def promote_appium_methods(class_array, driver = $driver)
      raise 'Driver is nil' if driver.nil?

      # Wrap single class into an array
      class_array = [class_array] unless class_array.class == Array
      # Promote Appium driver methods to class instance methods.
      class_array.each do |klass|
        driver.public_methods(false).each do |m|
          klass.class_eval do
            define_method m do |*args, &block|
              begin
                # Prefer existing method.
                # super will invoke method missing on driver
                super(*args, &block)

                # minitest also defines a name method,
                # so rescue argument error
                # and call the name method on $driver
              rescue NoMethodError, ArgumentError
                driver.send m, *args, &block if driver.respond_to?(m)
              end
            end
          end
        end
      end
      nil # return nil
    end
  end # class << self
end # module Appium
