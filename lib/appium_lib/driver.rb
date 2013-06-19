# encoding: utf-8
=begin
Based on simple_test.rb
https://github.com/appium/appium/blob/82995f47408530c80c3376f4e07a1f649d96ba22/sample-code/examples/ruby/simple_test.rb
https://github.com/appium/appium/blob/c58eeb66f2d6fa3b9a89d188a2e657cca7cb300f/LICENSE
=end

# Load appium.txt (toml format) into system ENV
# the basedir of this file + appium.txt is what's used
# @param opts [Hash] file: '/path/to/appium.txt', verbose: true
# @return [nil]
def load_appium_txt opts
  raise 'opts must be a hash' unless opts.kind_of? Hash
  opts.each_pair { |k,v| opts[k.to_s.downcase.strip.intern] = v }
  opts = {} if opts.nil?
  file = opts.fetch :file, nil
  raise 'Must pass file' unless file
  verbose = opts.fetch :verbose, false
  # Check for env vars in .txt
  toml = File.expand_path File.join File.dirname(file), 'appium.txt'
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

  if toml_exists
    require 'toml'
    require 'ap'
    puts "Loading #{toml}" if verbose

    # bash requires A="OK"
    # toml requires A = "OK"
    #
    # A="OK" => A = "OK"
    data = File.read(toml).gsub /([^\s])\=(")/, "\\1 = \\2"
    data = TOML::Parser.new(data).parsed
    ap data unless data.empty?

    update data, 'APP_PATH', 'APP_APK', 'APP_PACKAGE',
           'APP_ACTIVITY', 'APP_WAIT_ACTIVITY',
           'SELENDROID'

    # Ensure app path is absolute
    ENV['APP_PATH'] = File.expand_path ENV['APP_PATH'] if ENV['APP_PATH']
  end
  nil
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

  class Driver
    @@loaded = false

    attr_reader :default_wait, :app_path, :app_name, :selendroid,
                :app_package, :app_activity, :app_wait_activity,
                :sauce_username, :sauce_access_key, :port, :os, :debug
    # Creates a new driver.
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
    # app = { app_path: '/path/to/MyiOS.app'}
    # Appium::Driver.new(app).start_driver
    #
    # # Start Android driver
    # apk = { app_path: '/path/to/the.apk',
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

      @default_wait = opts.fetch :wait, 30

      # Path to the .apk, .app or .app.zip.
      # The path can be local or remote for Sauce.
      @app_path = opts.fetch :app_path, ENV['APP_PATH']
      raise 'APP_PATH must be set.' if @app_path.nil?

      # The name to use for the test run on Sauce.
      @app_name = opts.fetch :app_name, ENV['APP_NAME']

      # If Android, this will toggle selendroid as a device
      @selendroid = opts.fetch :selendroid, ENV['SELENDROID']
      @selendroid = 'selendroid' if @selendroid

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

      @os = :ios
      @os = :android if @app_path.match /\.apk/i

      # load common methods
      extend Appium::Common
      if @os == :android
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
        puts "OS is: #{@os}"
        patch_webdriver_bridge
      end

      # Save global reference to last created Appium driver for top level methods.
      $driver = self

      # Promote exactly once the first time the driver is created.
      # Subsequent drivers do not trigger promotion.
      unless @@loaded
        @@loaded = true
        # Promote Appium driver methods to Object instance methods.
        $driver.public_methods(false).each do | m |
          Object.class_eval do
            define_method m do | *args, &block |
                if defined?(super) # check if method is defined on super
                  # puts "[Object.class_eval] Calling super for #{m}"
                  # prefer existing method.
                  super(*args, &block)
                else
                  # puts '[Object.class_eval] not on super, calling driver.'
                  $driver.send m, *args, &block
                end
            end
          end
        end
      end

      self # return newly created driver
    end # def initialize

    # Returns the status payload
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
        browserName: 'Android',
        platform: 'LINUX',
        version: '4.2',
        device: @selendroid || 'Android',
        name: @app_name || 'Ruby Console Android Appium',
        app: absolute_app_path,
        :'app-package' => @app_package,
        :'app-activity' => @app_activity,
        :'app-wait-activity' => @app_wait_activity || @app_activity
      }
    end

    # @private
    # WebDriver capabilities. Must be valid for Sauce to work.
    def ios_capabilities
      {
        browserName: 'iOS 6.0',
        platform: 'Mac 10.8',
        version: '6.0',
        device: 'iPhone Simulator',
        name: @app_name || 'Ruby Console iOS Appium',
        app: absolute_app_path
      }
    end

    # @private
    def capabilities
      @os == :ios ? ios_capabilities : android_capabilities
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
      file = File.join(File.dirname(__FILE__), @app_path)
      raise "App doesn't exist #{file}" unless File.exist? file
      file
    end

    # Get the server url for sauce or local based on env vars.
    # @return [String] the server url
    def server_url
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
    # @return [void]
    def screenshot png_save_path
      @driver.save_screenshot png_save_path
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
      rescue Errno::ECONNREFUSED
        raise 'ERROR: Unable to connect to Appium. Is the server running?'
      end

      # Set timeout to a large number so that Appium doesn't quit
      # when no commands are entered after 60 seconds.
      # broken on selendroid: https://github.com/appium/appium/issues/513
      mobile :setCommandTimeout, timeout: 9999 unless @selendroid

      # Set implicit wait by default unless we're using Pry.
      @driver.manage.timeouts.implicit_wait = @default_wait unless defined? Pry

      @driver
    end

    # Set implicit wait to zero.
    def no_wait
      @driver.manage.timeouts.implicit_wait = 0
    end

    # Set implicit wait to timeout, defaults to 30.
    # @param timeout [Integer] the timeout in seconds
    # @return [void]
    def set_wait timeout=@default_wait
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
