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
  module Core
    class Driver
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
      # Appium's server port
      attr_reader :appium_port
      # Device type to request from the appium server
      attr_reader :appium_device
      # Automation name sent to appium server or received from server
      # If automation_name is nil, it is not set both client side and server side.
      attr_reader :automation_name
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
      # Return http client called in start_driver()
      # @return [Selenium::WebDriver::Remote::Http::Default] the http client
      attr_reader :http_client
      # instance of AbstractEventListener for logging support
      attr_reader :listener

      def initialize(opts = {})
        opts = Appium.symbolize_keys opts
        @caps = get_caps(opts)

        set_appium_lib_specific_values(get_appium_lib_opts(opts))
        set_app_path
        set_appium_device
        set_automation_name
      end

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
      def start_driver(server_url:,
                       http_client_ops: { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })

        # open_timeout and read_timeout are explicit wait.
        open_timeout = http_client_ops.delete(:open_timeout)
        read_timeout = http_client_ops.delete(:read_timeout)

        http_client = http_client_ops.delete(:http_client)
        @http_client ||= http_client ? http_client : Selenium::WebDriver::Remote::Http::Default.new

        @http_client.open_timeout = open_timeout if open_timeout
        @http_client.read_timeout = read_timeout if read_timeout

        begin
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

        # If "automationName" is set only server side, this method set "automationName" attribute into @automation_name.
        # Since @automation_name is set only client side before start_driver is called.
        set_automation_name_if_nil

        @driver
      end

      private

      # @private
      def get_caps(opts)
        Core::Driver::Capabilities.init_caps_for_appium(opts[:caps] || {})
      end

      # @private
      def get_appium_lib_opts(opts)
        opts[:appium_lib] || {}
      end

      # @private
      # Path to the .apk, .app or .app.zip.
      # The path can be local or remote for Sauce.
      def set_app_path
        return unless @caps && @caps[:app] && !@caps[:app].empty?
        @caps[:app] = File.expand_path(@caps[:app])
      end

      # @private
      def set_appium_lib_specific_values(appium_lib_opts)
        @custom_url       = appium_lib_opts.fetch :server_url, false
        @export_session   = appium_lib_opts.fetch :export_session, false
        @default_wait     = appium_lib_opts.fetch :wait, 0

        @appium_port      = appium_lib_opts.fetch :port, 4723

        # timeout and interval used in ::Appium::Comm.wait/wait_true
        @appium_wait_timeout  = appium_lib_opts.fetch :wait_timeout, 30
        @appium_wait_interval = appium_lib_opts.fetch :wait_interval, 0.5

        # to pass it in Selenium.new.
        # `listener = opts.delete(:listener)` is called in Selenium::Driver.new
        @listener = appium_lib_opts.fetch :listener, nil
      end

      # @private
      def set_appium_device
        # https://code.google.com/p/selenium/source/browse/spec-draft.md?repo=mobile
        @appium_device = @caps[:platformName]
        return @appium_device unless @appium_device

        @appium_device = @appium_device.is_a?(Symbol) ? @appium_device : @appium_device.downcase.strip.intern
      end

      # @private
      def set_automation_name
        @automation_name = @caps[:automationName] if @caps[:automationName]
        @automation_name = if @automation_name
                             @automation_name.is_a?(Symbol) ? @automation_name : @automation_name.downcase.strip.intern
                           end
      end

      # @private
      def set_automation_name_if_nil
        return unless @automation_name.nil?
        @automation_name = @driver.capabilities['automationName']
      end
    end
  end
end # module Appium
