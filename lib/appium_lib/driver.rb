# encoding: utf-8
=begin
Based on simple_test.rb
https://github.com/appium/appium/blob/82995f47408530c80c3376f4e07a1f649d96ba22/sample-code/examples/ruby/simple_test.rb
https://github.com/appium/appium/blob/c58eeb66f2d6fa3b9a89d188a2e657cca7cb300f/LICENSE
=end
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
  require 'android/helper'
  require 'android/patch'
  require 'android/element/alert'
  require 'android/element/generic'
  require 'android/element/textfield'

  class Driver
    @@loaded = false

    attr_reader :app_path, :app_name, :app_package, :app_activity,
                :app_wait_activity, :sauce_username, :sauce_access_key,
                :port, :os, :ios_js
    def initialize opts={}
      opts = {} if opts.nil?
      # Path to the .apk, .app or .app.zip.
      # The path can be local or remote for Sauce.
      @app_path = opts.fetch 'APP_PATH', ENV['APP_PATH']
      raise 'APP_PATH must be set.' if @app_path.nil?

      # The name to use for the test run on Sauce.
      @app_name = opts.fetch 'APP_NAME', ENV['APP_NAME']

      # Android app package
      @app_package = opts.fetch 'APP_PACKAGE', ENV['APP_PACKAGE']

      # Android app starting activity.
      @app_activity = opts.fetch 'APP_ACTIVITY', ENV['APP_ACTIVITY']

      # Android app waiting activity
      @app_wait_activity = opts.fetch 'APP_WAIT_ACTIVITY', ENV['APP_WAIT_ACTIVITY']

      # Sauce Username
      @sauce_username = opts.fetch'SAUCE_USERNAME', ENV['SAUCE_USERNAME']

      # Sauce Key
      @sauce_access_key = opts.fetch 'SAUCE_ACCESS_KEY', ENV['SAUCE_ACCESS_KEY']

      @port = opts.fetch 'PORT', ENV['PORT'] || 4723

      @os = :ios
      @os = :android if @app_path.end_with?('.apk') || @app_path.end_with?('.apk.zip')
      puts "OS is: #{@os}" if defined?(Pry)

      # load common methods
      extend Appium::Common
      if @os == :android
        raise 'APP_ACTIVITY must be set.' if @app_activity.nil?

        # load Android specific methods
        extend Appium::Android
      else
        @ios_js = [] # used to keep track of loaded JavaScript on iOS
        # load iOS specific methods
        extend Appium::Ios
      end

      # Save global reference to last created Appium driver for top level methods.
      $last_driver = self

      # Promote exactly once the first time the driver is created.
      # Subsequent drivers do not trigger promotion.
      unless @@loaded
        @@loaded = true
        # Promote Appium driver methods to Object instance methods.
        $last_driver.public_methods(false).each do | m |
          Object.class_eval do
            define_method m do | *args, &block |
              $last_driver.send m, *args, &block
            end
          end
        end
      end
    end # def initialize

    # WebDriver capabilities. Must be valid for Sauce to work.
    # https://github.com/jlipps/appium/blob/master/app/android.js
    def android_capabilities
      {
        browserName: 'Android',
        platform: 'LINUX',
        version: '4.1',
        device: 'Android',
        name: @app_name || 'Ruby Console Android Appium',
        app: absolute_app_path,
        :'app-package' => @app_package,
        :'app-activity' => @app_activity,
        :'app-wait-activity' => @app_wait_activity || @app_activity
      }
    end

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

    def capabilities
      @os == :ios ? ios_capabilities : android_capabilities
    end

    # Converts environment variable APP_PATH to an absolute path.
    # @return [String] APP_PATH as an absolute path
    def absolute_app_path
        raise 'APP_PATH environment variable not set!' if @app_path.nil? || @app_path.empty?
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
    def restart
      driver_quit
      start_driver
    end

    # return driver
    def driver
      @driver
    end

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
    # @return [Selenium::WebDriver] the new global driver
    def start_driver wait=30
      @client = @client || Selenium::WebDriver::Remote::Http::Default.new
      @client.timeout = 999999

      @default_wait = wait

      begin
        @driver = Selenium::WebDriver.for :remote, http_client: @client, desired_capabilities: capabilities, url: server_url
      rescue Errno::ECONNREFUSED
        raise 'ERROR: Unable to connect to Appium. Is the server running?'
      end

      # Set timeout to a large number so that Appium doesn't quit
      # when no commands are entered after 60 seconds.
      mobile :setCommandTimeout, timeout: 9999

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
    def get_wait
      @default_wait
    end

    # Returns existence of element.
    #
    # Example:
    #
    # exists { button('sign in') } ? puts('true') : puts('false')
    #
    # @return [Boolean]
    def exists &search_block
      pre_check = 0
      post_check = @default_wait

      set_wait pre_check # set wait to zero

      # the element exists unless an error is raised.
      exists = true

      begin
        search_block.call # search for element
      rescue
        exists = false # error means it's not there
      end

      # restore wait
      set_wait post_check

      exists
    end

    # The same as @driver.execute_script
    # @return [Object] the object returned by execute_script
    def execute_script script, *args
      @driver.execute_script script, *args
    end

    # Helper method for mobile gestures
    #
    # https://github.com/appium/appium/wiki/Automating-mobile-gestures
    #
    # @driver.execute_script 'mobile: swipe', endX: 100, endY: 100, duration: 0.01
    #
    # becomes
    #
    # mobile :swipe, endX: 100, endY: 100, duration: 0.01
    def mobile method, *args
      raise 'Method must not be nil' if method.nil?
      raise 'Method must have .to_s' unless method.respond_to? :to_s

      if method.to_s.strip.downcase == 'reset'
        # reset will undefine custom iOS JavaScript
        # mark js as unloaded so it'll reload next use.
        @ios_js = [] if @ios_js
      end

      @driver.execute_script "mobile: #{method.to_s}", *args
    end

    # Calls @driver.find_elements
    def find_elements *args
      @driver.find_elements *args
    end

    # Calls @driver.find_elements
    def find_element *args
      @driver.find_element *args
    end

    # Quit the driver and Pry.
    # quit and exit are reserved by Pry.
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