module Appium
  module Core
    class Driver
      # Selenium webdriver capabilities
      # @return [Core::Base::Capabilities]
      attr_reader :caps

      # Return http client called in start_driver()
      # @return [Appium::Core::Base::Http::Default] the http client
      attr_reader :http_client

      # Device type to request from the appium server
      attr_reader :device

      # Automation name sent to appium server or received from server
      # If automation_name is nil, it is not set both client side and server side.
      # @return [Hash]
      attr_reader :automation_name

      # Custom URL for the selenium server. If set this attribute, ruby_lib try to handshake to the custom url.
      # @return [String]
      attr_reader :custom_url

      # Export session id to textfile in /tmp for 3rd party tools
      # @return [Boolean]
      attr_reader :export_session

      # Default wait time for elements to appear
      # Returns the default client side wait.
      # This value is independent of what the server is using
      # Provide Appium::Drive like { appium_lib: { wait: 20 } }
      # @return [Integer]
      attr_reader :default_wait

      # Appium's server port
      # Provide Appium::Drive like { appium_lib: { port: 8080 } }
      # @return [Integer]
      attr_reader :port

      # Return a time wait timeout
      # Wait time for ::Appium::Common.wait or ::Appium::Common.wait_true.
      # Provide Appium::Drive like { appium_lib: { wait_timeout: 20 } }
      # @return [Integer]
      attr_reader :wait_timeout

      # Return a time wait timeout
      # Wait interval time for ::Appium::Common.wait or ::Appium::Common.wait_true.
      # Provide Appium::Drive like { appium_lib: { wait_interval: 20 } }
      # @return [Integer]
      attr_reader :wait_interval

      # instance of AbstractEventListener for logging support
      attr_reader :listener

      private

      # @return [Appium::Core::Base::Driver]
      attr_reader :driver

      public

      # @private
      # @see Appium::Core.for
      #
      # @return [Driver]
      #
      def self.for(target, opts = {})
        new(target, opts)
      end

      # @private
      def initialize(target, opts = {})
        opts = Appium.symbolize_keys opts
        @caps = get_caps(opts)

        set_appium_lib_specific_values(get_appium_lib_opts(opts))
        set_app_path
        set_appium_device
        set_automation_name

        extend_for(device: @device, automation_name: @automation_name, target: target)

        self
      end

      # Creates a new global driver and quits the old one if it exists.
      # You can customise http_client as the following
      #
      # @param [String] server_url Custom server url to send to requests. Default is "http://127.0.0.1:4723/wd/hub".
      # @option http_client_ops [Hash] :http_client Custom HTTP Client
      # @option http_client_ops [Hash] :open_timeout Custom open timeout for http client.
      # @option http_client_ops [Hash] :read_timeout Custom read timeout for http client.
      # @return [Selenium::WebDriver] the new global driver
      #
      # @example
      #
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
      #                server_url: "http://custom-host:8080/wd/hub.com",
      #                export_session: false,
      #                port: 8080,
      #                wait: 0,
      #                wait_timeout: 20,
      #                wait_interval: 0.3,
      #                listener: nil,
      #              }
      #            }
      #     @driver = Appium::Driver.new(opts).start_driver
      #
      def start_driver(server_url: nil,
                       http_client_ops: { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })
        server_url = server_url ? server_url : "http://127.0.0.1:#{@port}/wd/hub"

        # open_timeout and read_timeout are explicit wait.
        open_timeout = http_client_ops.delete(:open_timeout)
        read_timeout = http_client_ops.delete(:read_timeout)

        http_client = http_client_ops.delete(:http_client)
        @http_client ||= http_client ? http_client : Appium::Core::Base::Http::Default.new

        @http_client.open_timeout = open_timeout if open_timeout
        @http_client.read_timeout = read_timeout if read_timeout

        begin
          # included https://github.com/SeleniumHQ/selenium/blob/43f8b3f66e7e01124eff6a5805269ee441f65707/rb/lib/selenium/webdriver/remote/driver.rb#L29
          @driver = ::Appium::Core::Base::Driver.new(http_client: @http_client,
                                                     desired_capabilities: @caps,
                                                     url: server_url,
                                                     listener: @listener)

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

      # Quits the driver
      # @return [void]
      def quit_driver
        @driver.quit
      rescue
        nil
      end

      # Returns the server's version info
      # @return [Hash]
      #
      # @example
      #
      #   @driver.appium_server_version
      #     {
      #         "build" => {
      #             "version" => "0.18.1",
      #             "revision" => "d242ebcfd92046a974347ccc3a28f0e898595198"
      #         }
      #     }
      #
      # Returns blank hash for Selenium Grid since `remote_status` gets 500 error
      #
      # @example
      #
      #   @driver.appium_server_version #=> {}
      #
      def appium_server_version
        @driver.remote_status
      rescue Selenium::WebDriver::Error::ServerError => e
        raise ::Appium::Core::Error::ServerError unless e.message.include?('status code 500')
        # driver.remote_status returns 500 error for using selenium grid
        {}
      end

      # Return the platform version as an array of integers
      # @return [Array<Integer>]
      #
      # @example
      #
      #     @driver.platform_version #=> [10.1.1]
      #
      def platform_version
        p_version = @driver.capabilities['platformVersion']
        p_version.split('.').map(&:to_i)
      end

      # Takes a png screenshot and saves to the target path.
      #
      # @param png_save_path [String] the full path to save the png
      # @return [nil]
      #
      # @example
      #
      #   @driver.screenshot '/tmp/hi.png' #=> nil
      #
      def screenshot(png_save_path)
        @driver.save_screenshot png_save_path
        nil
      end

      private

      # @private
      def extend_for(device:, automation_name:, target:)
        target.extend Appium::Core
        target.extend Appium::Core::Device

        case device
        when :android
          case automation_name
          when :uiautomator2
            ::Appium::Core::Android::Uiautomator2::Bridge.for(self)
          else # default and UiAutomator
            ::Appium::Core::Android::Uiautomator1::Bridge.for(self)
          end
        when :ios
          case automation_name
          when :xcuitest
            ::Appium::Core::Ios::Xcuitest::Bridge.for(self)
          else # default and UIAutomation
            ::Appium::Core::Ios::Uiautomation::Bridge.for(self)
          end
        when :mac
          # no Mac specific extentions
          Appium::Logger.debug('mac')
        when :windows
          # no windows specific extentions
          Appium::Logger.debug('windows')
        else
          Appium::Logger.warn('no device matched')
        end

        target
      end

      # @private
      def get_caps(opts)
        Core::Base::Capabilities.create_capabilities(opts[:caps] || {})
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

        @port      = appium_lib_opts.fetch :port, 4723

        # timeout and interval used in ::Appium::Comm.wait/wait_true
        @wait_timeout  = appium_lib_opts.fetch :wait_timeout, 30
        @wait_interval = appium_lib_opts.fetch :wait_interval, 0.5

        # to pass it in Selenium.new.
        # `listener = opts.delete(:listener)` is called in Selenium::Driver.new
        @listener = appium_lib_opts.fetch :listener, nil
      end

      # @private
      def set_appium_device
        # https://code.google.com/p/selenium/source/browse/spec-draft.md?repo=mobile
        @device = @caps[:platformName]
        return @device unless @device

        @device = @device.is_a?(Symbol) ? @device : @device.downcase.strip.intern
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
