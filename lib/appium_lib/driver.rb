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

require_relative 'core/core'

module Appium
  REQUIRED_VERSION_XCUITEST = '1.6.0'.freeze

  class Driver
    # attr readers are promoted to global scope. To avoid clobbering, they're
    # made available via the driver_attributes method
    #
    # attr_accessor is repeated for each one so YARD documents them properly.

    # The amount to sleep in seconds before every webdriver http call.
    attr_accessor :global_webdriver_http_sleep

    # SauceLab's settings
    attr_reader :sauce
    # Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
    # same as @sauce.username
    attr_reader :sauce_username
    # Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
    # same as @sauce.access_key
    attr_reader :sauce_access_key
    # Override the Sauce Appium endpoint to allow e.g. TestObject tests
    # same as @sauce.endpoint
    attr_reader :sauce_endpoint

    # from Core
    attr_reader :caps
    attr_reader :custom_url
    attr_reader :export_session
    attr_reader :default_wait
    attr_reader :appium_port
    attr_reader :appium_device
    attr_reader :automation_name
    attr_reader :listener
    attr_reader :http_client
    attr_reader :appium_wait_timeout
    attr_reader :appium_wait_interval

    # Appium's server version
    attr_reader :appium_server_status
    # Boolean debug mode for the Appium Ruby bindings
    attr_reader :appium_debug
    # Returns the driver
    # @return [Driver] the driver
    attr_reader :driver
    # Instance of Appium::Core::Driver
    attr_reader :core

    # Creates a new driver. The driver is defined as global scope by default.
    # We can avoid defining global driver.
    #
    # @example
    #
    #     ```ruby
    #     require 'rubygems'
    #     require 'appium_lib'
    #
    #     # platformName takes a string or a symbol.
    #
    #     # Start iOS driver with global scope
    #     opts = {
    #              caps: {
    #                platformName: :ios,
    #                app: '/path/to/MyiOS.app'
    #              },
    #              appium_lib: {
    #                wait_timeout: 30
    #              }
    #            }
    #     Appium::Driver.new(opts).start_driver
    #
    #     # Start Android driver with global scope
    #     opts = {
    #              caps: {
    #                platformName: :android,
    #                app: '/path/to/my.apk'
    #              },
    #              appium_lib: {
    #                wait_timeout: 30,
    #                wait_interval: 1
    #              }
    #            }
    #     Appium::Driver.new(opts).start_driver
    #
    #     # Start iOS driver without global scope
    #     opts = {
    #              caps: {
    #                platformName: :ios,
    #                app: '/path/to/MyiOS.app'
    #              },
    #              appium_lib: {
    #                wait_timeout: 30
    #              }
    #            }
    #     Appium::Driver.new(opts, false).start_driver
    #     ```
    #
    # @param opts [Object] A hash containing various options.
    # @param global_driver [Bool] A bool require global driver before initialize.
    # @return [Driver]
    def initialize(opts = {}, global_driver = nil)
      if global_driver.nil?
        warn '[DEPRECATION] Appium::Driver.new(opts) will not generate global driver by default.' \
                 'If you would like to generate the global driver dy default, ' \
                 'please initialise driver with Appium::Driver.new(opts, true)'
        global_driver = true # if global_driver is nil, then global_driver must be default value.
      end

      if global_driver
        $driver.driver_quit if $driver
      end
      raise 'opts must be a hash' unless opts.is_a? Hash

      @core = Appium::Core::Driver.new(opts)

      opts = Appium.symbolize_keys opts
      appium_lib_opts = opts[:appium_lib] || {}

      @caps = @core.caps
      @custom_url = @core.custom_url
      @export_session = @core.export_session
      @default_wait = @core.default_wait
      @appium_port = @core.port
      @appium_wait_timeout = @core.wait_timeout
      @appium_wait_interval = @core.wait_interval
      @listener = @core.listener
      @appium_device = @core.device
      @automation_name = @core.automation_name

      # override opts[:app] if sauce labs
      set_app_path(opts)

      # enable debug patch
      @appium_debug = appium_lib_opts.fetch :debug, !!defined?(Pry)
      set_sauce_related_values(appium_lib_opts)

      extend Appium::Core
      extend Appium::Core::Device
      extend Appium::Common

      if device_is_android?
        extend Appium::Android
        extend Appium::Android::SearchContext
        extend Appium::Android::Device
        if automation_name_is_uiautomator2?
          extend Appium::Android::Uiautomator2
          extend Appium::Android::Uiautomator2::Helper
          extend Appium::Android::Uiautomator2::Element
        end
      else
        extend Appium::Ios
        extend Appium::Ios::SearchContext
        extend Appium::Ios::Device
        if automation_name_is_xcuitest?
          extend Appium::Ios::Xcuitest
          extend Appium::Ios::Xcuitest::SearchContext
          extend Appium::Ios::Xcuitest::Command
          extend Appium::Ios::Xcuitest::Helper
          extend Appium::Ios::Xcuitest::Gesture
          extend Appium::Ios::Xcuitest::Device
          extend Appium::Ios::Xcuitest::Element
        end
      end

      # apply os specific patches
      patch_webdriver_element

      # for command
      patch_remote_driver_core_commands(bridge: :oss)
      patch_remote_driver_core_commands(bridge: :w3c)
      patch_remote_driver_commands(bridge: :oss) # override
      patch_remote_driver_commands(bridge: :w3c) # override

      if @appium_debug
        Appium::Logger.ap_debug opts unless opts.empty?
        Appium::Logger.debug "Debug is: #{@appium_debug}"
        Appium::Logger.debug "Device is: #{@core.device}"
        patch_webdriver_bridge
      end

      # Save global reference to last created Appium driver for top level methods.
      $driver = self if global_driver

      self # return newly created driver
    end

    private

    # @private
    def set_app_path(opts)
      return unless @core.caps && @core.caps[:app] && !@core.caps[:app].empty?

      @core.caps[:app] = self.class.absolute_app_path opts
    end

    # @private
    def set_sauce_related_values(appium_lib_opts)
      @sauce = Appium::SauceLabs.new(appium_lib_opts)
      @sauce_username   = @sauce.username
      @sauce_access_key = @sauce.access_key
      @sauce_endpoint   = @sauce.endpoint
    end

    public

    # Returns a hash of the driver attributes
    def driver_attributes
      {
          caps:             @core.caps,
          automation_name:  @core.automation_name,
          custom_url:       @core.custom_url,
          export_session:   @core.export_session,
          default_wait:     @core.default_wait,
          sauce_username:   @sauce.username,
          sauce_access_key: @sauce.access_key,
          sauce_endpoint:   @sauce.endpoint,
          port:             @core.port,
          device:           @core.device,
          debug:            @appium_debug,
          listener:         @listener,
          wait_timeout:     @core.wait_timeout,
          wait_interval:    @core.wait_interval
      }
    end

    def device_is_android?
      @core.device == :android
    end

    def device_is_ios?
      @core.device == :ios
    end

    # Return true if automationName is 'XCUITest'
    # @return [Boolean]
    def automation_name_is_xcuitest?
      !@core.automation_name.nil? && @core.automation_name == :xcuitest
    end

    # Return true if automationName is 'uiautomator2'
    # @return [Boolean]
    def automation_name_is_uiautomator2?
      !@core.automation_name.nil? && @core.automation_name == :uiautomator2
    end

    # Return true if automationName is 'Espresso'
    # @return [Boolean]
    def automation_name_is_espresso?
      !@core.automation_name.nil? && @core.automation_name == :espresso
    end

    # Return true if the target Appium server is over REQUIRED_VERSION_XCUITEST.
    # If the Appium server is under REQUIRED_VERSION_XCUITEST, then error is raised.
    # @return [Boolean]
    def check_server_version_xcuitest
      if automation_name_is_xcuitest? &&
          !@appium_server_status.empty? &&
          (@appium_server_status['build']['version'] < REQUIRED_VERSION_XCUITEST)
        raise(Appium::Core::Error::NotSupportedAppiumServer,
              "XCUITest requires Appium version >= #{REQUIRED_VERSION_XCUITEST}")
      end
      true
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
      @core.appium_server_version
    rescue Selenium::WebDriver::Error::WebDriverError => ex
      raise ::Appium::Core::Error::ServerError unless ex.message.include?('content-type=""')
      # server (TestObject for instance) does not respond to status call
      {}
    end

    # Returns the client's version info
    #
    # ```ruby
    # {
    #     "version" => "9.1.1"
    # }
    # ```
    #
    # @return [Hash]
    def appium_client_version
      { version: ::Appium::VERSION }
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
      raise 'opts must be a hash' unless opts.is_a? Hash
      caps            = opts[:caps] || {}
      appium_lib_opts = opts[:appium_lib] || {}
      server_url      = appium_lib_opts.fetch :server_url, false

      app_path        = caps[:app]
      raise 'absolute_app_path invoked and app is not set!' if app_path.nil? || app_path.empty?
      # may be absolute path to file on remote server.
      # if the file is on the remote server then we can't check if it exists
      return app_path if server_url
      # Sauce storage API. http://saucelabs.com/docs/rest#storage
      return app_path if app_path.start_with? 'sauce-storage:'
      return app_path if app_path =~ /^http/ # public URL for Sauce
      if app_path =~ /^(\/|[a-zA-Z]:)/ # absolute file path
        app_path = File.expand_path app_path unless File.exist? app_path
        raise "App doesn't exist. #{app_path}" unless File.exist? app_path
        return app_path
      end

      # if it doesn't contain a slash then it's a bundle id
      return app_path unless app_path =~ /[\/\\]/

      # relative path that must be expanded.
      # absolute_app_path is called from load_settings
      # and the txt file path is the base of the app path in that case.
      app_path = File.expand_path app_path
      raise "App doesn't exist #{app_path}" unless File.exist? app_path
      app_path
    end

    # Get the server url
    # @return [String] the server url
    def server_url
      return @core.custom_url if @core.custom_url
      return @sauce.server_url if @sauce.sauce_server_url?
      "http://127.0.0.1:#{@core.port}/wd/hub"
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
      @core.quit_driver
    end

    # Alias for driver_quit
    alias quit_driver driver_quit

    # Creates a new global driver and quits the old one if it exists.
    # You can customise http_client as the following
    #
    # @example
    #     ```ruby
    #     require 'rubygems'
    #     require 'appium_lib'
    #
    #     # platformName takes a string or a symbol.
    #
    #     # Start iOS driver
    #     opts = {
    #              caps: {
    #                platformName: :ios,
    #                app: '/path/to/MyiOS.app'
    #              },
    #              appium_lib: {
    #                wait_timeout: 30
    #              }
    #            }
    #     Appium::Driver.new(opts).start_driver
    #
    # @option http_client_ops [Hash] :http_client Custom HTTP Client
    # @option http_client_ops [Hash] :open_timeout Custom open timeout for http client.
    # @option http_client_ops [Hash] :read_timeout Custom read timeout for http client.
    # @return [Selenium::WebDriver] the new global driver
    def start_driver(http_client_ops = { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })
      driver_quit

      @driver = @core.start_driver(server_url: server_url, http_client_ops: http_client_ops)
      @http_client = @core.http_client

      @appium_server_status = appium_server_version
      check_server_version_xcuitest

      set_implicit_wait(@core.default_wait)

      @driver
    end

    # To ignore error for Espresso Driver
    def set_implicit_wait(wait)
      @driver.manage.timeouts.implicit_wait = wait
    rescue Selenium::WebDriver::Error::UnknownError => e
      unless e.message.include?('The operation requested is not yet implemented by Espresso driver')
        raise ::Appium::Core::Error::ServerError
      end
      {}
    end

    # Set implicit wait to zero.
    def no_wait
      @driver.manage.timeouts.implicit_wait = 0
    end

    # Set implicit wait. Default to @core.default_wait.
    #
    # ```ruby
    # set_wait 2
    # set_wait # @core.default_wait
    #
    # ```
    #
    # @param timeout [Integer] the timeout in seconds
    # @return [void]
    def set_wait(timeout = nil)
      timeout = @core.default_wait if timeout.nil?
      @driver.manage.timeouts.implicit_wait = timeout
    end

    # Returns existence of element.
    #
    # Example:
    #
    # exists { button('sign in') } ? puts('true') : puts('false')
    #
    # @param [Integer] pre_check The amount in seconds to set the
    #                             wait to before checking existence
    # @param [Integer] post_check The amount in seconds to set the
    #                             wait to after checking existence
    # @yield The block to call
    # @return [Boolean]
    def exists(pre_check = 0, post_check = @core.default_wait)
      # do not uset set_wait here.
      # it will cause problems with other methods reading the default_wait of 0
      # which then gets converted to a 1 second wait.
      @driver.manage.timeouts.implicit_wait = pre_check
      # the element exists unless an error is raised.
      exists                                = true

      begin
        yield # search for element
      rescue
        exists = false # error means it's not there
      end

      # restore wait
      @driver.manage.timeouts.implicit_wait = post_check if post_check != pre_check

      exists
    end

    # The same as @driver.execute_script
    # @param [String] script The script to execute
    # @param [*args] args The args to pass to the script
    # @return [Object]
    def execute_script(script, *args)
      @driver.execute_script script, *args
    end

    # Calls @driver.find_elements_with_appium
    #
    # ```
    # @driver = Appium::Driver.new()
    # @driver.find_elements :predicate, yyy
    # ```
    #
    # If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.
    #
    # ```
    # @driver = Appium::Driver.new()
    # @driver.find_elements :predicate, yyy
    # ```
    #
    # If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.
    #
    # @param [*args] args The args to use
    # @return [Array<Element>] Array is empty when no elements are found.
    def find_elements(*args)
      @driver.find_elements(*args)
    end

    # Calls @driver.find_element
    #
    # ```
    # @driver = Appium::Driver.new()
    # @driver.find_element :accessibility_id, zzz
    # ```
    #
    # If you call `Appium.promote_appium_methods`, you can call `find_element` directly.
    #
    # @param [*args] args The args to use
    # @return [Element]
    def find_element(*args)
      @driver.find_element(*args)
    end

    # Calls @driver.set_location
    #
    # @note This method does not work on real devices.
    #
    # @param  [Hash] opts consisting of:
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

    private

    # @private
    def write_session_id(session_id)
      File.open('/tmp/appium_lib_session', 'w') { |f| f.puts session_id }
    rescue IOError => e
      ::Appium::Logger.warn e
      nil
    end
  end # class Driver
end # module Appium

# Paging in Pry is annoying :q required to exit.
# With pager disabled, the output is similar to IRB
# Only set if Pry is defined and there is no `.pryrc` files.
if defined?(Pry) && !(File.exist?(Pry::HOME_RC_FILE) || File.exist?(Pry::LOCAL_RC_FILE))
  Appium::Logger.debug 'Pry.config.pager = false is set.'
  Pry.config.pager = false
end
