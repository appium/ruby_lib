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
  REQUIRED_VERSION_XCUITEST = '1.6.0'.freeze

  class Driver
    # attr readers are promoted to global scope. To avoid clobbering, they're
    # made available via the driver_attributes method
    #
    # attr_accessor is repeated for each one so YARD documents them properly.

    # The amount to sleep in seconds before every webdriver http call.
    attr_accessor :global_webdriver_http_sleep
    # Selenium webdriver capabilities
    attr_reader :caps
    # Custom URL for the selenium server
    attr_reader :custom_url
    # Export session id to textfile in /tmp for 3rd party tools
    attr_reader :export_session
    # Default wait time for elements to appear
    # Returns the default client side wait.
    # This value is independent of what the server is using
    # @return [Integer]
    attr_reader :default_wait
    # Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
    attr_reader :sauce_username
    # Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
    attr_reader :sauce_access_key
    # Override the Sauce Appium endpoint to allow e.g. TestObject tests
    attr_reader :sauce_endpoint
    # Appium's server port
    attr_reader :appium_port
    # Device type to request from the appium server
    attr_reader :appium_device
    # Automation name sent to appium server or received from server
    # If automation_name is nil, it is not set both client side and server side.
    attr_reader :automation_name
    # Appium's server version
    attr_reader :appium_server_status
    # Boolean debug mode for the Appium Ruby bindings
    attr_reader :appium_debug
    # instance of AbstractEventListener for logging support
    attr_reader :listener
    # Returns the driver
    # @return [Driver] the driver
    attr_reader :driver
    # Return http client called in start_driver()
    # @return [Selenium::WebDriver::Remote::Http::Default] the http client
    attr_reader :http_client
    # Return a time wait timeout
    # Wait time for ::Appium::Common.wait or ::Appium::Common.wait_true.
    # Provide Appium::Drive like { appium_lib: { wait_timeout: 20 } }
    # @return [Integer]
    attr_reader :appium_wait_timeout
    # Return a time wait timeout
    # Wait interval time for ::Appium::Common.wait or ::Appium::Common.wait_true.
    # Provide Appium::Drive like { appium_lib: { wait_interval: 20 } }
    # @return [Integer]
    attr_reader :appium_wait_interval

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
    #     Appium::Driver.new(opts, true).start_driver
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
    #     Appium::Driver.new(opts, true).start_driver
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

      opts = Appium.symbolize_keys opts

      @caps = get_caps(opts)

      appium_lib_opts = get_appium_lib_opts(opts)
      set_appium_lib_specific_values(appium_lib_opts)
      # enable debug patch
      @appium_debug = appium_lib_opts.fetch :debug, !!defined?(Pry)

      # with caps
      set_app_path(opts)
      set_appium_device
      set_automation_name

      # load common methods
      extend Appium::Common
      extend Appium::Device

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
      patch_remote_driver_commands

      if @appium_debug
        Appium::Logger.ap_debug opts unless opts.empty?
        Appium::Logger.debug "Debug is: #{@appium_debug}"
        Appium::Logger.debug "Device is: #{@appium_device}"
        patch_webdriver_bridge
      end

      # Save global reference to last created Appium driver for top level methods.
      $driver = self if global_driver

      self # return newly created driver
    end

    private

    # @private
    def get_caps(opts)
      Capabilities.init_caps_for_appium(opts[:caps] || {})
    end

    # @private
    def get_appium_lib_opts(opts)
      opts[:appium_lib] || {}
    end

    # @private
    # Path to the .apk, .app or .app.zip.
    # The path can be local or remote for Sauce.
    def set_app_path(opts)
      return unless @caps && @caps[:app] && !@caps[:app].empty?

      @caps[:app] = self.class.absolute_app_path opts
    end

    # @private
    def set_appium_device
      # https://code.google.com/p/selenium/source/browse/spec-draft.md?repo=mobile
      @appium_device = @caps[:platformName]
      @appium_device = @appium_device.is_a?(Symbol) ? @appium_device : @appium_device.downcase.strip.intern if @appium_device
    end

    # @private
    def set_automation_name
      @automation_name = @caps[:automationName] if @caps[:automationName]
      @automation_name = if @automation_name
                           @automation_name.is_a?(Symbol) ? @automation_name : @automation_name.downcase.strip.intern
                         end
    end

    def set_appium_lib_specific_values(appium_lib_opts)
      @custom_url       = appium_lib_opts.fetch :server_url, false
      @export_session   = appium_lib_opts.fetch :export_session, false
      @default_wait     = appium_lib_opts.fetch :wait, 0

      @sauce_username   = appium_lib_opts.fetch :sauce_username, ENV['SAUCE_USERNAME']
      @sauce_username   = nil if !@sauce_username || (@sauce_username.is_a?(String) && @sauce_username.empty?)
      @sauce_access_key = appium_lib_opts.fetch :sauce_access_key, ENV['SAUCE_ACCESS_KEY']
      @sauce_access_key = nil if !@sauce_access_key || (@sauce_access_key.is_a?(String) && @sauce_access_key.empty?)
      @sauce_endpoint   = appium_lib_opts.fetch :sauce_endpoint, ENV['SAUCE_ENDPOINT']
      @sauce_endpoint   = 'ondemand.saucelabs.com:443/wd/hub' if
          !@sauce_endpoint || (@sauce_endpoint.is_a?(String) && @sauce_endpoint.empty?)

      @appium_port      = appium_lib_opts.fetch :port, 4723
      # timeout and interval used in ::Appium::Comm.wait/wait_true
      @appium_wait_timeout  = appium_lib_opts.fetch :wait_timeout, 30
      @appium_wait_interval = appium_lib_opts.fetch :wait_interval, 0.5

      # to pass it in Selenium.new.
      # `listener = opts.delete(:listener)` is called in Selenium::Driver.new
      @listener = appium_lib_opts.fetch :listener, nil
    end

    public

    # Returns a hash of the driver attributes
    def driver_attributes
      {
          caps:             @caps,
          automation_name:  @automation_name,
          custom_url:       @custom_url,
          export_session:   @export_session,
          default_wait:     @default_wait,
          sauce_username:   @sauce_username,
          sauce_access_key: @sauce_access_key,
          sauce_endpoint:   @sauce_endpoint,
          port:             @appium_port,
          device:           @appium_device,
          debug:            @appium_debug,
          listener:         @listener,
          wait_timeout:     @appium_wait_timeout,
          wait_interval:    @appium_wait_interval
      }
    end

    def device_is_android?
      @appium_device == :android
    end

    def device_is_ios?
      @appium_device == :ios
    end

    # Return true if automationName is 'XCUITest'
    # @return [Boolean]
    def automation_name_is_xcuitest?
      !@automation_name.nil? && @automation_name == :xcuitest
    end

    # Return true if automationName is 'uiautomator2'
    # @return [Boolean]
    def automation_name_is_uiautomator2?
      !@automation_name.nil? && @automation_name == :uiautomator2
    end

    # Return true if automationName is 'Espresso'
    # @return [Boolean]
    def automation_name_is_espresso?
      !@automation_name.nil? && @automation_name == :espresso
    end

    # Return true if the target Appium server is over REQUIRED_VERSION_XCUITEST.
    # If the Appium server is under REQUIRED_VERSION_XCUITEST, then error is raised.
    # @return [Boolean]
    def check_server_version_xcuitest
      if automation_name_is_xcuitest? &&
          !@appium_server_status.empty? &&
          (@appium_server_status['build']['version'] < REQUIRED_VERSION_XCUITEST)
        raise Appium::Error::NotSupportedAppiumServer, "XCUITest requires Appium version >= #{REQUIRED_VERSION_XCUITEST}"
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
    # Returns blank hash for Selenium Grid since `remote_status` gets 500 error
    #
    # ```ruby
    # {}
    # ```
    #
    # @return [Hash]
    def appium_server_version
      driver.remote_status
    rescue Selenium::WebDriver::Error::WebDriverError => ex
      raise ::Appium::Error::ServerError unless ex.message.include?('content-type=""')
      # server (TestObject for instance) does not respond to status call
      {}
    rescue Selenium::WebDriver::Error::ServerError => e
      raise ::Appium::Error::ServerError unless e.message.include?('status code 500')
      # driver.remote_status returns 500 error for using selenium grid
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
      return @custom_url if @custom_url
      if !@sauce_username.nil? && !@sauce_access_key.nil?
        "https://#{@sauce_username}:#{@sauce_access_key}@#{@sauce_endpoint}"
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
      @driver.quit
    rescue
      nil
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
      # open_timeout and read_timeout are explicit wait.
      open_timeout = http_client_ops.delete(:open_timeout)
      read_timeout = http_client_ops.delete(:read_timeout)

      http_client = http_client_ops.delete(:http_client)
      @http_client ||= http_client ? http_client : Selenium::WebDriver::Remote::Http::Default.new

      @http_client.open_timeout = open_timeout if open_timeout
      @http_client.read_timeout = read_timeout if read_timeout

      begin
        driver_quit
        @driver =  Selenium::WebDriver.for(:remote,
                                           http_client: @http_client,
                                           desired_capabilities: @caps,
                                           url: server_url,
                                           listener: @listener)

        # Load touch methods.
        @driver.extend Selenium::WebDriver::DriverExtensions::HasTouchScreen
        @driver.extend Selenium::WebDriver::DriverExtensions::HasLocation

        # export session
        write_session_id(@driver.session_id) if @export_session
      rescue Errno::ECONNREFUSED
        raise "ERROR: Unable to connect to Appium. Is the server running on #{server_url}?"
      end

      @appium_server_status = appium_server_version

      check_server_version_xcuitest
      set_automation_name_if_nil

      set_implicit_wait(@default_wait)

      @driver
    end

    # To ignore error for Espresso Driver
    def set_implicit_wait(wait)
      @driver.manage.timeouts.implicit_wait = wait
    rescue Selenium::WebDriver::Error::UnknownError => e
      unless e.message.include?('The operation requested is not yet implemented by Espresso driver')
        raise ::Appium::Error::ServerError
      end
      {}
    end

    # Set implicit wait to zero.
    def no_wait
      @driver.manage.timeouts.implicit_wait = 0
    end

    # Set implicit wait. Default to @default_wait.
    #
    # ```ruby
    # set_wait 2
    # set_wait # @default_wait
    #
    # ```
    #
    # @param timeout [Integer] the timeout in seconds
    # @return [void]
    def set_wait(timeout = nil)
      timeout = @default_wait if timeout.nil?
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
    def exists(pre_check = 0, post_check = @default_wait)
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
    # @driver = Appium::Driver.new(opts, false)
    # @driver.find_elements :predicate, yyy
    # ```
    #
    # If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.
    #
    # ```
    # @driver = Appium::Driver.new(opts, false)
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
    # @driver = Appium::Driver.new(opts, false)
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

    def write_session_id(session_id)
      File.open('/tmp/appium_lib_session', 'w') { |f| f.puts session_id }
    rescue IOError => e
      ::Appium::Logger.warn e
      nil
    end

    # If "automationName" is set only server side, this method set "automationName" attribute into @automation_name.
    # Since @automation_name is set only client side before start_driver is called.
    def set_automation_name_if_nil
      return unless @automation_name.nil?
      @automation_name = @driver.capabilities['automationName']
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
