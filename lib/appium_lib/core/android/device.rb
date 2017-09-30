module Appium
  module Android
    module Device
      extend Forwardable

      # @!method background_app
      #  Backgrounds the app for a set number of seconds.
      #  This is a blocking application
      # @param [Integer] seconds How many seconds to background the app for.
      #
      #   ```ruby
      #   background_app
      #   background_app(5)
      #   background_app(-1) #=> the app never come back. https://github.com/appium/appium/issues/7741
      #   ```

      # @!method hide_keyboard
      #   Hide the onscreen keyboard
      #   @param [String] close_key The name of the key which closes the keyboard.
      #     Defaults to 'Done' for iOS(except for XCUITest).
      #   @param [Symbol] strategy The symbol of the strategy which closes the keyboard.
      #     XCUITest ignore this argument.
      #     Default for iOS is `:pressKey`. Default for Android is `:tapOutside`.
      #  ```ruby
      #  hide_keyboard # Close a keyboard with the 'Done' button
      #  hide_keyboard('Finished') # Close a keyboard with the 'Finished' button
      #  hide_keyboard(nil, :tapOutside) # Close a keyboard with tapping out side of keyboard
      #  ```

      # @!method end_coverage
      #   Android only;  Ends the test coverage and writes the results to the given path on device.
      #   @param [String] path Path on the device to write too.
      #   @param [String] intent Intent to broadcast when ending coverage.

      # @!method start_activity
      #   Start a new activity within the current app or launch a new app and start the target activity.
      #
      #   Android only.
      #   @option [String] The package owning the activity [required]
      #   @option [String] The target activity [required]
      #   @option opts [String] The package to start before the target package [optional]
      #   @option opts [String] The activity to start before the target activity [optional]
      #
      #   ```ruby
      #   start_activity app_package: 'io.appium.android.apis',
      #     app_activity: '.accessibility.AccessibilityNodeProviderActivity'
      #   ```

      # @!method set_network_connection
      #   Set the device network connection mode
      #   @param [String] path Bit mask that represent the network mode
      #
      #   Value (Alias)      | Data | Wifi | Airplane Mode
      #   -------------------------------------------------
      #   1 (Airplane Mode)  | 0    | 0    | 1
      #   6 (All network on) | 1    | 1    | 0
      #   4 (Data only)      | 1    | 0    | 0
      #   2 (Wifi only)      | 0    | 1    | 0
      #   0 (None)           | 0    | 0    | 0
      #

      # @!method get_performance_data_types
      #   Get the information type of the system state which is supported to read such as
      #   cpu, memory, network, battery via adb commands.
      #   https://github.com/appium/appium-base-driver/blob/be29aec2318316d12b5c3295e924a5ba8f09b0fb/lib/mjsonwp/routes.js#L300
      #
      #   ```ruby
      #   get_performance_data_types #=> ["cpuinfo", "batteryinfo", "networkinfo", "memoryinfo"]
      #   ```

      # @!method get_performance_data
      #   Get the resource usage information of the application.
      #   https://github.com/appium/appium-base-driver/blob/be29aec2318316d12b5c3295e924a5ba8f09b0fb/lib/mjsonwp/routes.js#L303
      #   @param [String] package_name Package name
      #   @param [String] data_type Data type get with `get_performance_data_types`
      #   @param [String] data_read_timeout Command timeout. Default is 2.
      #
      #   ```ruby
      #   get_performance_data package_name: package_name, data_type: data_type, data_read_timeout: 2
      #   ```
      class << self
        def extended(_mod)
          Appium::Core::Device.extend_webdriver_with_forwardable

          # Android
          Appium::Core::Device.add_endpoint_method(:start_activity) do
            def start_activity(opts)
              raise 'opts must be a hash' unless opts.is_a? Hash
              app_package = opts[:app_package]
              raise 'app_package is required' unless app_package
              app_activity = opts[:app_activity]
              raise 'app_activity is required' unless app_activity
              app_wait_package  = opts.fetch(:app_wait_package, '')
              app_wait_activity = opts.fetch(:app_wait_activity, '')

              unknown_opts = opts.keys - [:app_package, :app_activity, :app_wait_package, :app_wait_activity]
              raise "Unknown options #{unknown_opts}" unless unknown_opts.empty?

              execute :start_activity, {}, appPackage: app_package,
                                           appActivity: app_activity,
                                           appWaitPackage: app_wait_package,
                                           appWaitActivity: app_wait_activity
            end
          end

          # Android, Override
          Appium::Core::Device.add_endpoint_method(:hide_keyboard) do
            def hide_keyboard(close_key = nil, strategy = nil)
              option = {}

              option[:key] = close_key if close_key
              option[:strategy] = strategy || :tapOutside # default to pressKey

              execute :hide_keyboard, {}, option
            end
          end

          # TODO: TEST ME
          Appium::Core::Device.add_endpoint_method(:end_coverage) do
            def end_coverage(path, intent)
              execute :end_coverage, {}, path: path, intent: intent
            end
          end

          Appium::Core::Device.add_endpoint_method(:set_network_connection) do
            def set_network_connection(mode)
              execute :set_network_connection, {}, type: mode
            end
          end

          Appium::Core::Device.add_endpoint_method(:get_performance_data) do
            def get_performance_data(package_name:, data_type:, data_read_timeout: 1000)
              execute :get_performance_data, {}, packageName: package_name,
                                                 dataType: data_type,
                                                 dataReadTimeout: data_read_timeout
            end
          end
        end
      end
    end # module Device
  end # module Android
end # module Appium
