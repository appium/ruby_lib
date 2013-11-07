# encoding: utf-8
=begin
Based on simple_test.rb
https://github.com/appium/appium/blob/82995f47408530c80c3376f4e07a1f649d96ba22/sample-code/examples/ruby/simple_test.rb
https://github.com/appium/appium/blob/c58eeb66f2d6fa3b9a89d188a2e657cca7cb300f/LICENSE
=end

require 'rubygems'
require 'ap'

# Support OpenStruct in Awesome Print
# /awesome_print/lib/awesome_print/formatter.rb
# upstream issue: https://github.com/michaeldv/awesome_print/pull/36
class AwesomePrint::Formatter
    remove_const :CORE if defined?(CORE)
    CORE = [ :array, :hash, :class, :file, :dir, :bigdecimal, :rational, :struct, :openstruct, :method, :unboundmethod ]

  def awesome_openstruct target
    awesome_hash target.marshal_dump
  end
end


# Load appium.txt (toml format) into system ENV
# the basedir of this file + appium.txt is what's used
# @param opts [Hash] file: '/path/to/appium.txt', verbose: true
# @return [Array<String>] the require files. nil if require doesn't exist
def load_appium_txt opts
  raise 'opts must be a hash' unless opts.kind_of? Hash
  opts.each_pair { |k,v| opts[k.to_s.downcase.strip.intern] = v }
  opts = {} if opts.nil?
  file = opts.fetch :file, nil
  raise 'Must pass file' unless file
  verbose = opts.fetch :verbose, false
  # Check for env vars in .txt
  parent_dir = File.dirname file
  toml = File.expand_path File.join parent_dir, 'appium.txt'
  puts "appium.txt path: #{toml}" if verbose
  # @private
  def update data, *args
    args.each do |name|
      var = data[name]
      ENV[name] = var if var
    end
  end

  toml_exists = File.exists? toml
  puts "Exists? #{toml_exists}" if verbose
  data = nil

  if toml_exists
    require 'toml'
    puts "Loading #{toml}" if verbose

    # bash requires A="OK"
    # toml requires A = "OK"
    #
    # A="OK" => A = "OK"
    data = File.read toml

    data = data.split("\n").map do |line|
      line.sub /([^\s])\=/, "\\1 = "
    end.join "\n"

    data = TOML::Parser.new(data).parsed
    ap data unless data.empty? if verbose

    update data, 'APP_PATH', 'APP_APK', 'APP_PACKAGE',
           'APP_ACTIVITY', 'APP_WAIT_ACTIVITY',
           'DEVICE'

    # Ensure app path is absolute
    ENV['APP_PATH'] = File.expand_path ENV['APP_PATH'] if ENV['APP_PATH'] &&
        !ENV['APP_PATH'].empty?

    # device is not case sensitive
    ENV['DEVICE'] = ENV['DEVICE'].strip.downcase if !ENV['DEVICE'].nil?
    if ! %w(ios android selendroid).include? ENV['DEVICE']
      raise %(DEVICE="#{ENV['DEVICE']}" must be ios, android,
or selendroid.)
    end
  end

  # return list of require files as an array
  # nil if require doesn't exist
  if data && data['require']
    r = data['require']
    r = r.kind_of?(Array) ? r : [ r ]
    # ensure files are absolute
    r.map! do |file|
      file = file.include?(File::Separator) ? file :
             File.join(parent_dir, file)
      file = File.expand_path file

      File.exists?(file) ? file : nil
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
      Dir.glob(File.join(item, '**/*.rb')) do |file|
        # do not add folders to the file list
        files << File.expand_path(file) unless File.directory? file
      end
    end

    files
  end
end

# Fix uninitialized constant Minitest (NameError)
module Minitest
  # Fix superclass mismatch for class Spec
  class Runnable; end
  class Test < Runnable; end
  class Spec < Test; end
end

module Appium
  add_to_path __FILE__

  require 'selenium-webdriver'

  # common
  require 'common/helper'
  require 'common/patch'
  require 'common/version'
  require 'common/element/button'
  require 'common/element/text'
  require 'common/element/window'

  # ios
  require 'ios/helper'
  require 'ios/patch'
  require 'ios/element/alert'
  require 'ios/element/generic'
  require 'ios/element/textfield'

  # android
  require 'android/dynamic'
  require 'android/helper'
  require 'android/patch'
  require 'android/element/alert'
  require 'android/element/generic'
  require 'android/element/textfield'

  def self.promote_singleton_appium_methods main_module
    raise 'Driver is nil' if $driver.nil?
    main_module.constants.each do |sub_module|
      #noinspection RubyResolve
      $driver.public_methods(false).each do |m|
        const = Woven.const_get(sub_module)
        const.send(:define_singleton_method, m) do |*args, &block|
          begin
            super(*args, &block) # promote.rb
          rescue NoMethodError, ArgumentError
            $driver.send m, *args, &block if $driver.respond_to?(m)
          end
          # override unless there's an existing method with matching arity
        end unless const.respond_to?(m) &&
            const.method(m).arity == $driver.method(m).arity
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

  def self.promote_appium_methods class_array
    raise 'Driver is nil' if $driver.nil?
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
    @@loaded = false

    attr_reader :default_wait, :app_path, :app_name, :device,
                :app_package, :app_activity, :app_wait_activity,
                :sauce_username, :sauce_access_key, :port, :debug,
                :export_session, :device_cap, :compress_xml, :custom_url

    # The amount to sleep in seconds before every webdriver http call.
    attr_accessor :global_webdriver_http_sleep
    # Creates a new driver.
    # :device is :android, :ios, or :selendroid
    #
    # ```ruby
    # # Options include:
    # :app_path, :app_name, :app_package, :app_activity,
    # :app_wait_activity, :sauce_username, :sauce_access_key,
    # :port, :os, :debug
    #
    # require 'rubygems'
    # require 'appium_lib'
    #
    # # Start iOS driver
    # app = { device: :ios, app_path: '/path/to/MyiOS.app'}
    # Appium::Driver.new(app).start_driver
    #
    # # Start Android driver
    # apk = { device: :android
    #         app_path: '/path/to/the.apk',
    #         app_package: 'com.example.pkg',
    #         app_activity: 'act.Start',
    #         app_wait_activity: 'act.Start'
    # }
    #
    # Appium::Driver.new(apk).start_driver
    # ```
    #
    # @param opts [Object] A hash containing various options.
    # @return [Driver]
    def initialize opts={}
      # quit last driver
      $driver.driver_quit if $driver
      opts = {} if opts.nil?
      # convert to downcased symbols
      opts.each_pair { |k,v| opts[k.to_s.downcase.strip.intern] = v }

      @custom_url = opts.fetch :server_url, false

      @compress_xml = opts[:compress_xml] ? true : false

      @export_session = opts.fetch :export_session, false

      @default_wait = opts.fetch :wait, 30

      # Path to the .apk, .app or .app.zip.
      # The path can be local or remote for Sauce.
      @app_path = opts.fetch :app_path, ENV['APP_PATH']
      raise 'APP_PATH must be set.' if @app_path.nil?

      # The name to use for the test run on Sauce.
      @app_name = opts.fetch :app_name, ENV['APP_NAME']

      # Android app package
      @app_package = opts.fetch :app_package, ENV['APP_PACKAGE']

      # Android app starting activity.
      @app_activity = opts.fetch :app_activity, ENV['APP_ACTIVITY']

      # Android app waiting activity
      @app_wait_activity = opts.fetch :app_wait_activity, ENV['APP_WAIT_ACTIVITY']

      # Sauce Username
      @sauce_username = opts.fetch :sauce_username, ENV['SAUCE_USERNAME']

      # Sauce Key
      @sauce_access_key = opts.fetch :sauce_access_key, ENV['SAUCE_ACCESS_KEY']

      @port = opts.fetch :port, ENV['PORT'] || 4723

      # device as used in device capabilities.
      # iOS only.
      #
      # Android is always Android or Selendroid so there's no
      # override required.
      @device_cap = opts.fetch :device_cap, false

      # :ios, :android, :selendroid
      @device = opts.fetch :device, ENV['DEVICE'] || :ios
      @device = @device.intern # device must be a symbol

      # load common methods
      extend Appium::Common
      if @device == :android
        raise 'APP_ACTIVITY must be set.' if @app_activity.nil?

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
      @debug = opts.fetch :debug, !!defined?(Pry)
      puts "Debug is: #{@debug}"
      if @debug
        ap opts unless opts.empty?
        puts "Device is: #{@device}"
        patch_webdriver_bridge
      end

      # Save global reference to last created Appium driver for top level methods.
      $driver = self

      # Promote exactly once the first time the driver is created.
      # Subsequent drivers do not trigger promotion.
      unless @@loaded
        @@loaded = true
        # Promote only on Minitest::Spec (minitest 5) by default
        Appium.promote_appium_methods ::Minitest::Spec
      end

      self # return newly created driver
    end # def initialize

    # Returns the status payload
    #
    # ```ruby
    # {"status"=>0,
    #  "value"=>
    #   {"build"=>
    #     {"version"=>"0.8.2",
    #      "revision"=>"f2a2bc3782e4b0370d97a097d7e04913cf008995"}},
    #  "sessionId"=>"8f4b34a7-a9a9-4ac5-b125-36258143446a"}
    # ```
    #
    #  Discover the Appium rev running on the server.
    #
    # `status["value"]["build"]["revision"]`
    # `f2a2bc3782e4b0370d97a097d7e04913cf008995`
    #
    # @return [JSON]
    def status
      driver.status.payload
    end

    # Returns the server's version string
    # @return [String]
    def server_version
      status['value']['build']['version']
    end

    # @private
    # WebDriver capabilities. Must be valid for Sauce to work.
    # https://github.com/jlipps/appium/blob/master/app/android.js
    def android_capabilities
      {
        compressXml: @compress_xml,
        platform: 'LINUX',
        version: '4.2',
        device: @device == :android ? 'Android' : 'selendroid',
        name: @app_name || 'Ruby Console Android Appium',
        :'app-package' => @app_package,
        :'app-activity' => @app_activity,
        :'app-wait-activity' => @app_wait_activity || @app_activity
      }
    end

    # @private
    # WebDriver capabilities. Must be valid for Sauce to work.
    def ios_capabilities
      {
        platform: 'Mac 10.8',
        version: '6.1',
        device: @device_cap || 'iPhone Simulator',
        name: @app_name || 'Ruby Console iOS Appium'
      }
    end

    # @private
    def capabilities
      caps = @device == :ios ? ios_capabilities : android_capabilities
      caps[:app] = absolute_app_path unless @app_path.nil? || @app_path.empty?
      caps
    end

    # Converts environment variable APP_PATH to an absolute path.
    # @return [String] APP_PATH as an absolute path
    def absolute_app_path
      raise 'APP_PATH not set!' if @app_path.nil? || @app_path.empty?
      # Sauce storage API. http://saucelabs.com/docs/rest#storage
      return @app_path if @app_path.start_with? 'sauce-storage:'
      return @app_path if @app_path.match(/^http/) # public URL for Sauce
      if @app_path.match(/^\//) # absolute file path
        raise "App doesn't exist. #{@app_path}" unless File.exist? @app_path
        return @app_path
      end

      # if it doesn't contain a slash then it's a bundle id
      return @app_path unless @app_path.match(/[\/\\]/)

      file = File.join(File.dirname(__FILE__), @app_path)
      raise "App doesn't exist #{file}" unless File.exist? file
      file
    end

    # Get the server url for sauce or local based on env vars.
    # @return [String] the server url
    def server_url
      return @custom_url if @custom_url
      if !@sauce_username.nil? && !@sauce_access_key.nil?
        "http://#{@sauce_username}:#{@sauce_access_key}@ondemand.saucelabs.com:80/wd/hub"
      else
        "http://127.0.0.1:#{@port}/wd/hub"
      end
    end

    # Restarts the driver
    # @return [Driver] the driver
    def restart
      driver_quit
      start_driver
    end

    # Returns the driver
    # @return [Driver] the driver
    def driver
      @driver
    end

    # Takes a png screenshot and saves to the target path.
    #
    # Example: screenshot '/tmp/hi.png'
    #
    # @param png_save_path [String] the full path to save the png
    # @return [nil]
    def screenshot png_save_path
      @driver.save_screenshot png_save_path
      nil
    end

    # Quits the driver
    # @return [void]
    def driver_quit
      # rescue NoSuchDriverError
      begin; @driver.quit unless @driver.nil?; rescue; end
    end

    # Creates a new global driver and quits the old one if it exists.
    #
    # @return [Selenium::WebDriver] the new global driver
    def start_driver
      @client = @client || Selenium::WebDriver::Remote::Http::Default.new
      @client.timeout = 999999

      begin
        @driver = Selenium::WebDriver.for :remote, http_client: @client, desired_capabilities: capabilities, url: server_url
        # Load touch methods. Required for Selendroid.
        @driver.extend Selenium::WebDriver::DriverExtensions::HasTouchScreen

        # export session
        if @export_session
          begin
            File.open('/tmp/appium_lib_session', 'w') do |f|
              f.puts @driver.session_id
            end
          rescue
          end
        end
      rescue Errno::ECONNREFUSED
        raise 'ERROR: Unable to connect to Appium. Is the server running?'
      end

      # Set timeout to a large number so that Appium doesn't quit
      # when no commands are entered after 60 seconds.
      # broken on selendroid: https://github.com/appium/appium/issues/513
      mobile :setCommandTimeout, timeout: 9999 unless @device == :selendroid

      # Set implicit wait by default unless we're using Pry.
      @driver.manage.timeouts.implicit_wait = @default_wait unless defined? Pry

      @driver
    end

    # Set implicit wait and default_wait to zero.
    def no_wait
      @default_wait = 0
      @driver.manage.timeouts.implicit_wait = 0
    end

    # Set implicit wait and default_wait to timeout, defaults to 30.
    # @param timeout [Integer] the timeout in seconds
    # @return [void]
    def set_wait timeout=@default_wait
      @default_wait = timeout
      @driver.manage.timeouts.implicit_wait = timeout
    end

    # Returns the default client side wait.
    # This value is independent of what the server is using
    # @return [Integer]
    def default_wait
      @default_wait
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
    def exists pre_check=0, post_check=@default_wait, &search_block
      set_wait pre_check # set wait to zero

      # the element exists unless an error is raised.
      exists = true

      begin
        search_block.call # search for element
      rescue
        exists = false # error means it's not there
      end

      # restore wait
      set_wait post_check if post_check != pre_check

      exists
    end

    # The same as @driver.execute_script
    # @param script [String] the script to execute
    # @param args [*args] the args to pass to the script
    # @return [Object]
    def execute_script script, *args
      @driver.execute_script script, *args
    end

    # Helper method for mobile gestures
    #
    # https://github.com/appium/appium/wiki/Automating-mobile-gestures
    #
    # driver.execute_script 'mobile: swipe', endX: 100, endY: 100, duration: 0.01
    #
    # becomes
    #
    # mobile :swipe, endX: 100, endY: 100, duration: 0.01
    # @param method [String, Symbol] the method to execute
    # @param args [*args] the args to pass to the method
    # @return [Object]
    def mobile method, *args
      raise 'Method must not be nil' if method.nil?
      raise 'Method must have .to_s' unless method.respond_to? :to_s

      @driver.execute_script "mobile: #{method.to_s}", *args
    end

    # Calls @driver.find_elements
    #
    # @param args [*args] the args to use
    # @return [Array<Element>] Array is empty when no elements are found.
    def find_elements *args
      @driver.find_elements *args
    end

    # Calls @driver.find_elements
    #
    # @param args [*args] the args to use
    # @return [Element]
    def find_element *args
      @driver.find_element *args
    end

    # Quit the driver and Pry.
    # quit and exit are reserved by Pry.
    # @return [void]
    def x
      driver_quit
      exit # exit pry
    end
  end # end class Driver
end # end module Appium

# Paging in Pry is annoying :q required to exit.
# With pager disabled, the output is similar to IRB
# Only set if Pry is defined.
Pry.config.pager = false if defined?(Pry)