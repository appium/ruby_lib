require 'base64'

module Appium
  module Device
    extend Forwardable

    # @!method app_strings
    #   Return the hash of all localization strings.
    #   ```ruby
    #   app_strings #=> "TransitionsTitle"=>"Transitions", "WebTitle"=>"Web"
    #   ```

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

    # @!method current_activity

    # @!method get_system_bars
    #   Get system bar's information
    #   @return [String] System bar
    #
    #   ```ruby
    #   get_system_bars
    #   ```

    # @!method get_display_density
    #   Get connected device's density.
    #   @return [Integer] The size of density
    #
    #   ```ruby
    #   get_display_density # 320
    #   ```

    # @!method is_keyboard_shown
    #   Get whether keyboard is displayed or not.
    #   @return [Bool] Return true if keyboard is shown. Return false if keyboard is hidden.
    #
    #   ```ruby
    #   is_keyboard_shown # false
    #   ```

    # @!method launch_app
    #   Start the simulator and application configured with desired capabilities

    # @!method reset
    #   Reset the device, relaunching the application.

    # @!method shake
    #   Cause the device to shake

    # @!method toggle_flight_mode
    #   Toggle flight mode on or off

    # @!method device_locked?

    # @!method hide_keyboard
    #   Hide the onscreen keyboard
    #   @param [String] close_key The name of the key which closes the keyboard.
    #     Defaults to 'Done'.
    #  ```ruby
    #  hide_keyboard # Close a keyboard with the 'Done' button
    #  hide_keyboard('Finished') # Close a keyboard with the 'Finished' button
    #  ```

    # @!method press_keycode
    # Press keycode on the device.
    # http://developer.android.com/reference/android/view/KeyEvent.html
    # @param [integer] key The key to press.
    # @param [String] metastate The state the metakeys should be in when pressing the key.

    # @!method long_press_keycode
    # Long press keycode on the device.
    # http://developer.android.com/reference/android/view/KeyEvent.html
    # @param [integer] key The key to long press.
    # @param [String] metastate The state the metakeys should be in when long pressing the key.

    # @!method push_file
    #   Place a file in a specific location on the device.
    #   @param [String] path The absolute path on the device to store data at.
    #   @param [String] data Raw file data to be sent to the device.

    # @!method pull_file
    #   Retrieve a file from the device.  This can retrieve an absolute path or
    #   a path relative to the installed app (iOS only).
    #   @param [String] path Either an absolute path OR, for iOS devices, a path relative to the app, as described.
    #
    #   ```ruby
    #   pull_file '/local/data/some/path' #=> Get the file at that path
    #   pull_file 'Shenanigans.app/some/file' #=> Get 'some/file' from the install location of Shenanigans.app
    #   ```

    # @!method pull_folder
    #   Retrieve a folder from the device.
    #   @param [String] path absolute path to the folder
    #
    #   ```ruby
    #   pull_folder '/data/local/tmp' #=> Get the folder at that path
    #   ```

    # @!method touch_id
    #   iOS only;  Simulate Touch ID with either valid (match == true) or invalid (match == false) fingerprint.
    #   @param [Boolean] match fingerprint validity
    #     Defaults to true.
    #   ```ruby
    #   touch_id true #=> Simulate valid fingerprint
    #   touch_id false #=> Simulate invalid fingerprint
    #   ```

    # @!method toggle_touch_id_enrollment
    #   iOS Simulator only:  Toggle touch id enrollment on an iOS Simulator.

    # @!method end_coverage
    #   Android only;  Ends the test coverage and writes the results to the given path on device.
    #   @param [String] path Path on the device to write too.
    #   @param [String] intent Intent to broadcast when ending coverage.

    # @!method get_settings
    #   Get appium Settings for current test session

    # @!method update_settings
    #   Update appium Settings for current test session
    #   @param [Hash] settings Settings to update, keys are settings, values to value to set each setting to

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

    # @!method get_network_connection
    #   Get the device network connection current status
    #   See set_network_connection method for return value

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

    # @!method set_immediate_value
    #   Set the value to element directly
    #   for iOS; setValue is called in XCUITest instead because XCUITest doesn't provide set value directly.
    #   https://github.com/appium/appium-xcuitest-driver/blob/793cdc7d5e84bd553e375076e1c6dc7e242c9cde/lib/commands/element.js#L123
    #
    #   ```ruby
    #   set_immediate_value element, 'hello'
    #   ```

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
        extend_webdriver_with_forwardable

        ::Appium::Driver::Commands::COMMAND_NO_ARG.each_key do |method|
          add_endpoint_method method
        end

        add_endpoint_method(:available_contexts) do
          def available_contexts
            # return empty array instead of nil on failure
            execute(:available_contexts, {}) || []
          end
        end

        add_endpoint_method(:app_strings) do
          def app_strings(language = nil)
            opts = language ? { language: language } : {}
            execute :app_strings, {}, opts
          end
        end

        add_endpoint_method(:lock) do
          def lock(duration)
            execute :lock, {}, seconds: duration
          end
        end

        add_endpoint_method(:install_app) do
          def install_app(path)
            execute :install_app, {}, appPath: path
          end
        end

        add_endpoint_method(:remove_app) do
          def remove_app(id)
            execute :remove_app, {}, appId: id
          end
        end

        add_endpoint_method(:app_installed?) do
          def app_installed?(app_id)
            execute :app_installed?, {}, bundleId: app_id
          end
        end

        add_endpoint_method(:background_app) do
          def background_app(duration = 0)
            # https://github.com/appium/ruby_lib/issues/500, https://github.com/appium/appium/issues/7741
            if $driver.automation_name_is_xcuitest? && $driver.appium_server_status['build']['version'] >= '1.6.4'
              duration_milli_sec = duration.nil? ? nil : duration * 1000
              execute :background_app, {}, seconds: { timeout: duration_milli_sec }
            else
              execute :background_app, {}, seconds: duration
            end
          end
        end

        add_endpoint_method(:start_activity) do
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

        add_endpoint_method(:set_context) do
          def set_context(context = null)
            execute :set_context, {}, name: context
          end
        end

        add_endpoint_method(:hide_keyboard) do
          def hide_keyboard(close_key = nil)
            # Android can only tapOutside.
            if $driver.device_is_android?
              return execute :hide_keyboard, {}, strategy: :tapOutside
            end

            close_key ||= 'Done' # default to Done key.
            if $driver.automation_name_is_xcuitest?
              # strategy is not implemented in the following
              # https://github.com/appium/appium-xcuitest-driver/blob/v2.2.0/lib/commands/general.js#L51
              execute :hide_keyboard, {}, strategy: :grouped, key: close_key
            else
              $driver.hide_ios_keyboard close_key
            end
          end
        end

        add_endpoint_method(:press_keycode) do
          def press_keycode(key, metastate = nil)
            args             = { keycode: key }
            args[:metastate] = metastate if metastate
            execute :press_keycode, {}, args
          end
        end

        add_endpoint_method(:long_press_keycode) do
          def long_press_keycode(key, metastate = nil)
            args             = { keycode: key }
            args[:metastate] = metastate if metastate
            execute :long_press_keycode, {}, args
          end
        end

        add_endpoint_method(:set_immediate_value) do
          def set_immediate_value(element, *value)
            keys = ::Selenium::WebDriver::Keys.encode(value)
            execute :set_immediate_value, { id: element.ref }, value: Array(keys)
          end
        end

        add_endpoint_method(:push_file) do
          def push_file(path, filedata)
            encoded_data = Base64.encode64 filedata
            execute :push_file, {}, path: path, data: encoded_data
          end
        end

        add_endpoint_method(:pull_file) do
          def pull_file(path)
            data = execute :pull_file, {}, path: path
            Base64.decode64 data
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:pull_folder) do
          def pull_folder(path)
            data = execute :pull_folder, {}, path: path
            Base64.decode64 data
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:touch_id) do
          def touch_id(match = true)
            execute :touch_id, {}, match: match
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:toggle_touch_id_enrollment) do
          def toggle_touch_id_enrollment
            execute :toggle_touch_id_enrollment, {}
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:end_coverage) do
          def end_coverage(path, intent)
            execute :end_coverage, {}, path: path, intent: intent
          end
        end

        add_endpoint_method(:get_settings) do
          def get_settings
            execute :get_settings, {}
          end
        end

        add_endpoint_method(:update_settings) do
          def update_settings(settings)
            execute :update_settings, {}, settings: settings
          end
        end

        add_endpoint_method(:set_network_connection) do
          def set_network_connection(mode)
            execute :set_network_connection, {}, type: mode
          end
        end

        add_endpoint_method(:get_performance_data) do
          def get_performance_data(package_name:, data_type:, data_read_timeout: 1000)
            execute :get_performance_data, {}, packageName: package_name,
                                               dataType: data_type,
                                               dataReadTimeout: data_read_timeout
          end
        end

        add_touch_actions
        add_ime_actions
        extend_search_contexts
      end

      # def extended

      # @private
      def add_endpoint_method(method)
        block_given? ? create_bridge_command(method, &Proc.new) : create_bridge_command(method)

        delegate_driver_method method
        delegate_from_appium_driver method
      end

      # @private
      def extend_webdriver_with_forwardable
        return if Selenium::WebDriver::Driver.is_a? Forwardable
        Selenium::WebDriver::Driver.class_eval do
          extend Forwardable
        end
      end

      # @private
      def delegate_driver_method(method)
        return if Selenium::WebDriver::Driver.method_defined? method
        Selenium::WebDriver::Driver.class_eval { def_delegator :@bridge, method }
      end

      # @private
      def delegate_from_appium_driver(method, delegation_target = :driver)
        def_delegator delegation_target, method
      end

      # @private
      def create_bridge_command(method)
        Selenium::WebDriver::Remote::Bridge.class_eval do
          block_given? ? class_eval(&Proc.new) : define_method(method) { execute method }
        end
      end

      # @!method find_element
      # @!method find_elements
      #
      #   find_element/s with their accessibility_id
      #
      #   ```ruby
      #    find_elements :accessibility_id, 'Animation'
      #   ```
      def extend_search_contexts
        Selenium::WebDriver::SearchContext.class_eval do
          def find_element(*args)
            how, what = extract_args(args)
            by = _set_by_from_finders(how)
            begin
              bridge.find_element_by by, what.to_s, ref
            rescue Selenium::WebDriver::Error::TimeOutError
              raise Selenium::WebDriver::Error::NoSuchElementError
            end
          end

          def find_elements(*args)
            how, what = extract_args(args)
            by = _set_by_from_finders(how)
            begin
              bridge.find_elements_by by, what.to_s, ref
            rescue Selenium::WebDriver::Error::TimeOutError
              raise Selenium::WebDriver::Error::NoSuchElementError
            end
          end

          def _set_by_from_finders(how)
            finders = ::Selenium::WebDriver::SearchContext::FINDERS.merge ::Appium::Driver::SearchContext::FINDERS
            by = finders[how.to_sym]
            raise ArgumentError, "cannot find element by #{how.inspect}" unless by
            by
          end
        end
      end

      def add_touch_actions
        add_endpoint_method(:touch_actions) do
          def touch_actions(actions)
            actions = { actions: [actions].flatten }
            execute :touch_actions, {}, actions
          end
        end

        add_endpoint_method(:multi_touch) do
          def multi_touch(actions)
            execute :multi_touch, {}, actions: actions
          end
        end

        actions = Appium::TouchAction::COMPLEX_ACTIONS
        actions.each do |method|
          delegate_from_appium_driver(method, Appium::TouchAction)
        end

        delegate_from_appium_driver(:pinch, Appium::MultiTouch)
        delegate_from_appium_driver(:zoom, Appium::MultiTouch)
      end

      def add_ime_actions
        # Commands for IME are defined in the following commands.rb, but the driver have no bridge.
        # So, appium_lib define just bridge here.
        # https://github.com/SeleniumHQ/selenium/blob/selenium-3.0.1/rb/lib/selenium/webdriver/remote/commands.rb#L184-L192

        # @!method ime_activate
        #   Make an engine that is available active.
        #
        #   Android only.
        #   @param [String] The IME owning the activity [required]
        #
        #   ```ruby
        #   ime_activate engine: 'com.android.inputmethod.latin/.LatinIME'
        #   ```
        add_endpoint_method(:ime_activate) do
          def ime_activate(ime_name)
            execute :imeActivateEngine, {}, engine: ime_name
          end
        end

        # @!method ime_available_engines
        #   List all available input engines on the machine.
        #   Android only.
        #
        #   ```ruby
        #   ime_available_engines #=> Get the list of IME installed in the target device
        #   ```
        add_endpoint_method(:ime_available_engines) do
          def ime_available_engines
            execute :imeGetAvailableEngines
          end
        end

        # @!method ime_active_engine
        #   Get the name of the active IME engine.
        #   Android only.
        #
        #   ```ruby
        #   ime_active_engine #=> Get the current active IME such as 'com.android.inputmethod.latin/.LatinIME'
        #   ```
        add_endpoint_method(:ime_active_engine) do
          def ime_active_engine
            execute :imeGetActiveEngine
          end
        end

        # @!method ime_activated
        #   Indicates whether IME input is active at the moment (not if it is available).
        #   Android only.
        #
        #   ```ruby
        #   ime_activated #=> True if IME is activated
        #   ```
        add_endpoint_method(:ime_activated) do
          def ime_activated
            execute :imeIsActivated
          end
        end

        # @!method ime_deactivate
        #   De-activates the currently-active IME engine.
        #
        #   Android only.
        #
        #   ```ruby
        #   ime_deactivate #=> Deactivate current IME engine
        #   ```
        add_endpoint_method(:ime_deactivate) do
          def ime_deactivate
            execute :imeDeactivate, {}
          end
        end
      end
    end # class << self

    # @!method set_context
    #   Change the context to the given context.
    #   @param [String] The context to change to
    #
    #   ```ruby
    #   set_context "NATIVE_APP"
    #   ```

    # @!method current_context
    #   @return [String] The context currently being used.

    # @!method available_contexts
    #   @return [Array<String>] All usable contexts, as an array of strings.

    # Perform a block within the given context, then switch back to the starting context.
    # @param context (String) The context to switch to for the duration of the block.
    #
    # ```ruby
    # within_context('NATIVE_APP') do
    #   find_element [:tag, "button"]
    # ```
    def within_context(context)
      existing_context = current_context
      set_context context
      yield if block_given?
      set_context existing_context
    end

    # Change to the default context.  This is equivalent to `set_context nil`.
    def switch_to_default_context
      set_context nil
    end
  end # module Device
end # module Appium
