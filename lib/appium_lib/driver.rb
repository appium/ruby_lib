require 'rubygems'
require 'ap'
require 'selenium-webdriver'
require 'selenium/client/errors' # used in helper.rb for CommandError
require 'nokogiri'

# common
require_relative 'common/helper'
require_relative 'common/wait'
require_relative 'common/patch'
require_relative 'common/version'
require_relative 'common/element/window'

# ios
require_relative 'ios/helper'
require_relative 'ios/patch'

require_relative 'ios/element/alert'
require_relative 'ios/element/button'
require_relative 'ios/element/generic'
require_relative 'ios/element/textfield'
require_relative 'ios/element/text'
require_relative 'ios/mobile_methods'

# android
require_relative 'android/helper'
require_relative 'android/patch'
require_relative 'android/client_xpath'
require_relative 'android/element/alert'
require_relative 'android/element/button'
require_relative 'android/element/generic'
require_relative 'android/element/textfield'
require_relative 'android/element/text'
require_relative 'android/mobile_methods'

# device methods
require_relative 'device/device'
require_relative 'device/touch_actions'
require_relative 'device/multi_touch'

# Fix uninitialized constant Minitest (NameError)
module Minitest
  # Fix superclass mismatch for class Spec
  class Runnable
  end
  class Test < Runnable
  end
  class Spec < Test
  end
end

module Appium
  # Load appium.txt (toml format)
  # the basedir of this file + appium.txt is what's used
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
  def self.load_appium_txt(opts = {})
    fail 'opts must be a hash' unless opts.is_a? Hash
    fail 'opts must not be empty' if opts.empty?

    file = opts[:file]
    fail 'Must pass file' unless file
    verbose = opts.fetch :verbose, false

    parent_dir = File.dirname file
    toml       = File.expand_path File.join parent_dir, 'appium.txt'
    Appium::Logger.info "appium.txt path: #{toml}" if verbose

    toml_exists = File.exist? toml
    Appium::Logger.info "Exists? #{toml_exists}" if verbose

    fail "toml doesn't exist #{toml}" unless toml_exists
    require 'toml'
    Appium::Logger.info "Loading #{toml}" if verbose

    data = File.read toml
    data = TOML::Parser.new(data).parsed
    # TOML creates string keys. must symbolize
    data = Appium.symbolize_keys data
    Appium::Logger.ap_info data unless data.empty? if verbose

    if data && data[:caps] && data[:caps][:app] && !data[:caps][:app].empty?
      data[:caps][:app] = Appium::Driver.absolute_app_path data
    end

    # return list of require files as an array
    # nil if require doesn't exist
    if data && data[:appium_lib] && data[:appium_lib][:require]
      r = data[:appium_lib][:require]
      r = r.is_a?(Array) ? r : [r]
      # ensure files are absolute
      r.map! do |f|
        file = File.exist?(f) ? f : File.join(parent_dir, f)
        file = File.expand_path file

        File.exist?(file) ? file : nil
      end
      r.compact! # remove nils

      files = []

      # now expand dirs
      r.each do |item|
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

      # Must not sort files. File order is specified in appium.txt
      data[:appium_lib][:require] = files
    end

    data
  end

  # convert all keys (including nested) to symbols
  #
  # based on deep_symbolize_keys & deep_transform_keys from rails
  # https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84
  def self.symbolize_keys(hash)
    fail 'symbolize_keys requires a hash' unless hash.is_a? Hash
    result = {}
    hash.each do |key, value|
      key = key.to_sym rescue key # rubocop:disable Style/RescueModifier
      result[key] = value.is_a?(Hash) ? symbolize_keys(value) : value
    end
    result
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
  def self.promote_singleton_appium_methods(modules)
    fail 'Driver is nil' if $driver.nil?

    target_modules = []

    if modules.is_a? Module
      modules.constants.each do |sub_module|
        target_modules << modules.const_get(sub_module)
      end
    else
      fail 'modules must be a module or an array' unless modules.is_a? Array
      target_modules = modules
    end

    target_modules.each do |const|
      # noinspection RubyResolve
      $driver.public_methods(false).each do |m|
        const.send(:define_singleton_method, m) do |*args, &block|
          begin
            super(*args, &block) # promote.rb
          rescue NoMethodError, ArgumentError
            $driver.send m, *args, &block if $driver.respond_to?(m)
          end
          # override unless there's an existing method with matching arity
        end unless const.respond_to?(m) && const.method(m).arity == $driver.method(m).arity
      end
    end
  end

  ##
  # Promote appium methods to class instance methods
  #
  # @param class_array [Array<Class>] An array of classes
  #
  # To promote methods to all classes:
  #
  # ```ruby
  # Appium.promote_appium_methods Object
  # ```
  #
  # It's better to promote on specific classes instead of Object
  #
  # ```ruby
  # # promote on rspec
  # Appium.promote_appium_methods RSpec::Core::ExampleGroup
  # ```
  #
  # ```ruby
  # # promote on minispec
  # Appium.promote_appium_methods Minitest::Spec
  # ```
  def self.promote_appium_methods(class_array)
    fail 'Driver is nil' if $driver.nil?
    # Wrap single class into an array
    class_array = [class_array] unless class_array.class == Array
    # Promote Appium driver methods to class instance methods.
    class_array.each do |klass|
      $driver.public_methods(false).each do |m|
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
              $driver.send m, *args, &block if $driver.respond_to?(m)
            end
          end
        end
      end
    end
    nil # return nil
  end

  class Driver
    # attr readers are promoted to global scope. To avoid clobbering, they're
    # made available via the driver_attributes method
    #
    # attr_accessor is repeated for each one so YARD documents them properly.

    # The amount to sleep in seconds before every webdriver http call.
    attr_accessor :global_webdriver_http_sleep
    # Selenium webdriver capabilities
    attr_accessor :caps
    # Custom URL for the selenium server
    attr_accessor :custom_url
    # Export session id to textfile in /tmp for 3rd party tools
    attr_accessor :export_session
    # Default wait time for elements to appear
    # Returns the default client side wait.
    # This value is independent of what the server is using
    # @return [Integer]
    attr_accessor :default_wait
    # Array of previous wait time values
    attr_accessor :last_waits
    # Username for use on Sauce Labs
    attr_accessor :sauce_username
    # Access Key for use on Sauce Labs
    attr_accessor :sauce_access_key
    # Appium's server port
    attr_accessor :appium_port
    # Device type to request from the appium server
    attr_accessor :appium_device
    # Boolean debug mode for the Appium Ruby bindings
    attr_accessor :appium_debug

    # Returns the driver
    # @return [Driver] the driver
    attr_reader :driver

    # Creates a new driver
    #
    # ```ruby
    # require 'rubygems'
    # require 'appium_lib'
    #
    # # platformName takes a string or a symbol.
    #
    # # Start iOS driver
    # opts = { caps: { platformName: :ios, app: '/path/to/MyiOS.app' } }
    # Appium::Driver.new(opts).start_driver
    #
    # # Start Android driver
    # opts = { caps: { platformName: :android, app: '/path/to/my.apk' } }
    # Appium::Driver.new(opts).start_driver
    # ```
    #
    # @param opts [Object] A hash containing various options.
    # @return [Driver]
    def initialize(opts = {})
      # quit last driver
      $driver.driver_quit if $driver
      fail 'opts must be a hash' unless opts.is_a? Hash

      opts              = Appium.symbolize_keys opts

      # default to {} to prevent nil.fetch and other nil errors
      @caps             = opts[:caps] || {}
      appium_lib_opts   = opts[:appium_lib] || {}

      # appium_lib specific values
      @custom_url       = appium_lib_opts.fetch :server_url, false
      @export_session   = appium_lib_opts.fetch :export_session, false
      @default_wait     = appium_lib_opts.fetch :wait, 0
      @last_waits       = [@default_wait]
      @sauce_username   = appium_lib_opts.fetch :sauce_username, ENV['SAUCE_USERNAME']
      @sauce_username   = nil if !@sauce_username || (@sauce_username.is_a?(String) && @sauce_username.empty?)
      @sauce_access_key = appium_lib_opts.fetch :sauce_access_key, ENV['SAUCE_ACCESS_KEY']
      @sauce_access_key = nil if !@sauce_access_key || (@sauce_access_key.is_a?(String) && @sauce_access_key.empty?)
      @appium_port      = appium_lib_opts.fetch :port, 4723

      # Path to the .apk, .app or .app.zip.
      # The path can be local or remote for Sauce.
      if @caps && @caps[:app] && ! @caps[:app].empty?
        @caps[:app] = self.class.absolute_app_path opts
      end

      # https://code.google.com/p/selenium/source/browse/spec-draft.md?repo=mobile
      @appium_device = @caps[:platformName]
      @appium_device = @appium_device.is_a?(Symbol) ? @appium_device : @appium_device.downcase.strip.intern if @appium_device
      fail "platformName must be set. Not found in options: #{opts}" unless @appium_device
      fail 'platformName must be Android or iOS' unless [:android, :ios].include?(@appium_device)

      # load common methods
      extend Appium::Common
      extend Appium::Device
      if device_is_android?
        # load Android specific methods
        extend Appium::Android
      else
        # load iOS specific methods
        extend Appium::Ios
      end

      # apply os specific patches
      patch_webdriver_element

      # enable debug patch
      # !!'constant' == true
      @appium_debug = appium_lib_opts.fetch :debug, !!defined?(Pry)

      if @appium_debug
        Appium::Logger.ap_debug opts unless opts.empty?
        Appium::Logger.debug "Debug is: #{@appium_debug}"
        Appium::Logger.debug "Device is: #{@appium_device}"
        patch_webdriver_bridge
      end

      # Save global reference to last created Appium driver for top level methods.
      $driver = self

      self # return newly created driver
    end

    # Returns a hash of the driver attributes
    def driver_attributes
      attributes = { caps:             @caps,
                     custom_url:       @custom_url,
                     export_session:   @export_session,
                     default_wait:     @default_wait,
                     last_waits:       @last_waits,
                     sauce_username:   @sauce_username,
                     sauce_access_key: @sauce_access_key,
                     port:             @appium_port,
                     device:           @appium_device,
                     debug:            @appium_debug
      }

      # Return duplicates so attributes are immutable
      attributes.each do |key, value|
        attributes[key] = value.duplicable? ? value.dup : value
      end
      attributes
    end

    def device_is_android?
      @appium_device == :android
    end

    # Returns the server's version info
    #
    # ```ruby
    # {
    #     "build" => {
    #         "version" => "0.18.1",
    #         "revision" => "d242ebcfd92046a974347ccc3a28f0e898595198"
    #     }
    # }
    # ```
    #
    # @return [Hash]
    def appium_server_version
      driver.remote_status
    end

    # Converts app_path to an absolute path.
    #
    # opts is the full options hash (caps and appium_lib). If server_url is set
    # then the app path is used as is.
    #
    # if app isn't set then an error is raised.
    #
    # @return [String] APP_PATH as an absolute path
    def self.absolute_app_path(opts)
      fail 'opts must be a hash' unless opts.is_a? Hash
      caps            = opts[:caps] || {}
      appium_lib_opts = opts[:appium_lib] || {}
      server_url      = appium_lib_opts.fetch :server_url, false

      app_path        = caps[:app]
      fail 'absolute_app_path invoked and app is not set!' if app_path.nil? || app_path.empty?
      # may be absolute path to file on remote server.
      # if the file is on the remote server then we can't check if it exists
      return app_path if server_url
      # Sauce storage API. http://saucelabs.com/docs/rest#storage
      return app_path if app_path.start_with? 'sauce-storage:'
      return app_path if app_path.match(/^http/) # public URL for Sauce
      if app_path.match(/^(\/|[a-zA-Z]:)/) # absolute file path
        app_path = File.expand_path app_path unless File.exist? app_path
        fail "App doesn't exist. #{app_path}" unless File.exist? app_path
        return app_path
      end

      # if it doesn't contain a slash then it's a bundle id
      return app_path unless app_path.match(/[\/\\]/)

      # relative path that must be expanded.
      # absolute_app_path is called from load_appium_txt
      # and the txt file path is the base of the app path in that case.
      app_path = File.expand_path app_path
      fail "App doesn't exist #{app_path}" unless File.exist? app_path
      app_path
    end

    # Get the server url
    # @return [String] the server url
    def server_url
      return @custom_url if @custom_url
      if !@sauce_username.nil? && !@sauce_access_key.nil?
        "http://#{@sauce_username}:#{@sauce_access_key}@ondemand.saucelabs.com:80/wd/hub"
      else
        "http://127.0.0.1:#{@appium_port}/wd/hub"
      end
    end

    # Restarts the driver
    # @return [Driver] the driver
    def restart
      driver_quit
      start_driver
    end

    # Takes a png screenshot and saves to the target path.
    #
    # Example: screenshot '/tmp/hi.png'
    #
    # @param png_save_path [String] the full path to save the png
    # @return [nil]
    def screenshot(png_save_path)
      @driver.save_screenshot png_save_path
      nil
    end

    # Quits the driver
    # @return [void]
    def driver_quit
      # rescue NoSuchDriverError or nil driver
      # rubocop:disable Style/RescueModifier
      @driver.quit rescue nil
    end

    # Creates a new global driver and quits the old one if it exists.
    #
    # @return [Selenium::WebDriver] the new global driver
    def start_driver
      @client ||= Selenium::WebDriver::Remote::Http::Default.new
      @client.timeout = 999_999

      begin
        driver_quit
        @driver = Selenium::WebDriver.for :remote, http_client: @client, desired_capabilities: @caps, url: server_url
        # Load touch methods.
        @driver.extend Selenium::WebDriver::DriverExtensions::HasTouchScreen
        @driver.extend Selenium::WebDriver::DriverExtensions::HasLocation

        # export session
        if @export_session
          # rubocop:disable Style/RescueModifier
          File.open('/tmp/appium_lib_session', 'w') do |f|
            f.puts @driver.session_id
          end rescue nil
        end
      rescue Errno::ECONNREFUSED
        raise 'ERROR: Unable to connect to Appium. Is the server running?'
      end

      @driver.manage.timeouts.implicit_wait = @default_wait

      @driver
    end

    # Set implicit wait and default_wait to zero.
    def no_wait
      @last_waits                           = [@default_wait, 0]
      @default_wait                         = 0
      @driver.manage.timeouts.implicit_wait = 0
    end

    # Set implicit wait and default_wait to timeout, defaults to 30.
    # if set_wait is called without a param then the second to last
    # wait will be used.
    #
    # ```ruby`
    # set_wait 2
    # set_wait 3
    # set_wait # 2
    #
    # ````
    #
    # @param timeout [Integer] the timeout in seconds
    # @return [void]
    def set_wait(timeout = nil)
      if timeout.nil?
        # Appium::Logger.info "timeout = @default_wait = @last_wait"
        # Appium::Logger.info "timeout = @default_wait = #{@last_waits}"
        timeout = @default_wait = @last_waits.first
      else
        @default_wait = timeout
        # Appium::Logger.info "last waits before: #{@last_waits}"
        @last_waits   = [@last_waits.last, @default_wait]
        # Appium::Logger.info "last waits after: #{@last_waits}"
      end

      @driver.manage.timeouts.implicit_wait = timeout
    end

    # Returns existence of element.
    #
    # Example:
    #
    # exists { button('sign in') } ? puts('true') : puts('false')
    #
    # @param pre_check [Integer]  the amount in seconds to set the
    #                             wait to before checking existance
    # @param post_check [Integer] the amount in seconds to set the
    #                             wait to after checking existance
    # @param search_block [Block] the block to call
    # @return [Boolean]
    def exists(pre_check = 0, post_check = @default_wait, &search_block)
      # do not uset set_wait here.
      # it will cause problems with other methods reading the default_wait of 0
      # which then gets converted to a 1 second wait.
      @driver.manage.timeouts.implicit_wait = pre_check
      # the element exists unless an error is raised.
      exists                                = true

      begin
        search_block.call # search for element
      rescue
        exists = false # error means it's not there
      end

      # restore wait
      @driver.manage.timeouts.implicit_wait = post_check if post_check != pre_check

      exists
    end

    # The same as @driver.execute_script
    # @param script [String] the script to execute
    # @param args [*args] the args to pass to the script
    # @return [Object]
    def execute_script(script, *args)
      @driver.execute_script script, *args
    end

    # Calls @driver.find_elements
    #
    # @param args [*args] the args to use
    # @return [Array<Element>] Array is empty when no elements are found.
    def find_elements(*args)
      @driver.find_elements(*args)
    end

    # Calls @driver.find_elements
    #
    # @param args [*args] the args to use
    # @return [Element]
    def find_element(*args)
      @driver.find_element(*args)
    end

    # Calls @driver.set_location
    #
    # @note This method does not work on real devices.
    #
    # @param [Hash] opts consisting of:
    # @option opts [Float] :latitude the latitude in degrees (required)
    # @option opts [Float] :longitude the longitude in degees (required)
    # @option opts [Float] :altitude the altitude, defaulting to 75
    # @return [Selenium::WebDriver::Location] the location constructed by the selenium webdriver
    def set_location(opts = {})
      latitude = opts.fetch(:latitude)
      longitude = opts.fetch(:longitude)
      altitude = opts.fetch(:altitude, 75)
      @driver.set_location(latitude, longitude, altitude)
    end

    # Quit the driver and Pry.
    # quit and exit are reserved by Pry.
    # @return [void]
    def x
      driver_quit
      exit # exit pry
    end
  end # class Driver
end # module Appium

# Paging in Pry is annoying :q required to exit.
# With pager disabled, the output is similar to IRB
# Only set if Pry is defined.
Pry.config.pager = false if defined?(Pry)
