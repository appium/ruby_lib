require 'base64'

module Appium
  module Device
    extend Forwardable

    NoArgMethods = {
      post: {
        open_notifications:   'session/:session_id/appium/device/open_notifications',
        shake:                'session/:session_id/appium/device/shake',
        launch_app:           'session/:session_id/appium/app/launch',
        close_app:            'session/:session_id/appium/app/close',
        reset:                'session/:session_id/appium/app/reset',
        toggle_airplane_mode: 'session/:session_id/appium/device/toggle_airplane_mode',
        device_locked?:       'session/:session_id/appium/device/is_locked'
      },
      get:  {
        current_activity:       'session/:session_id/appium/device/current_activity',
        current_context:        'session/:session_id/context',
        get_network_connection: 'session/:session_id/network_connection'
      }
    }

    # @!method app_strings
    #   Return the hash of all localization strings.
    #   ```ruby
    #   app_strings #=> "TransitionsTitle"=>"Transitions", "WebTitle"=>"Web"
    #   ```

    # @!method background_app
    #  Backgrounds the app for a set number of seconds.
    #  This is a blocking application
    # @param seconds (int) How many seconds to background the app for.

    # @!method current_activity

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
    #   @param close_key (String) the name of the key which closes the keyboard.
    #     Defaults to 'Done'.
    #  ```ruby
    #  hide_keyboard # Close a keyboard with the 'Done' button
    #  hide_keyboard('Finished') # Close a keyboard with the 'Finished' button
    #  ```

    # @!method press_keycode
    # Press keycode on the device.
    # http://developer.android.com/reference/android/view/KeyEvent.html
    # @param key (integer) The key to press.
    # @param metastate (String) The state the metakeys should be in when pressing the key.

    # @!method long_press_keycode
    # Long press keycode on the device.
    # http://developer.android.com/reference/android/view/KeyEvent.html
    # @param key (integer) The key to long press.
    # @param metastate (String) The state the metakeys should be in when long pressing the key.

    # @!method push_file
    #   Place a file in a specific location on the device.
    #   @param path (String) The absolute path on the device to store data at.
    #   @param data (String) Raw file data to be sent to the device.

    # @!method pull_file
    #   Retrieve a file from the device.  This can retrieve an absolute path or
    #   a path relative to the installed app (iOS only).
    #   @param path (String) Either an absolute path OR, for iOS devices, a path relative to the app, as described.
    #
    #   ```ruby
    #   pull_file '/local/data/some/path' #=> Get the file at that path
    #   pull_file 'Shenanigans.app/some/file' #=> Get 'some/file' from the install location of Shenanigans.app
    #   ```

    # @!method pull_folder
    #   Retrieve a folder from the device.
    #   @param path (String) absolute path to the folder
    #
    #   ```ruby
    #   pull_folder '/data/local/tmp' #=> Get the folder at that path
    #   ```

    # @!method end_coverage
    #   Android only;  Ends the test coverage and writes the results to the given path on device.
    #   @param path (String) Path on the device to write too.
    #   @param intent (String) Intent to broadcast when ending coverage.

    # @!method get_settings
    #   Get appium Settings for current test session

    # @!method update_settings
    #   Update appium Settings for current test session
    #   @param settings (hash) Settings to update, keys are settings, values to value to set each setting to
    class << self
      def extended(_mod)
        extend_webdriver_with_forwardable

        NoArgMethods.each_pair do |verb, pair|
          pair.each_pair { |command, path| add_endpoint_method command, path, verb }
        end

        add_endpoint_method(:available_contexts, 'session/:session_id/contexts', :get) do
          def available_contexts
            # return empty array instead of nil on failure
            execute(:available_contexts, {}) || []
          end
        end

        add_endpoint_method(:app_strings, 'session/:session_id/appium/app/strings') do
          def app_strings(language = nil)
            opts = language ? { language: language } : {}
            execute :app_strings, {}, opts
          end
        end

        add_endpoint_method(:lock, 'session/:session_id/appium/device/lock') do
          def lock(duration)
            execute :lock, {}, seconds: duration
          end
        end

        add_endpoint_method(:install_app, 'session/:session_id/appium/device/install_app') do
          def install_app(path)
            execute :install_app, {}, appPath: path
          end
        end

        add_endpoint_method(:remove_app, 'session/:session_id/appium/device/remove_app') do
          def remove_app(id)
            execute :remove_app, {}, appId: id
          end
        end

        add_endpoint_method(:app_installed?, 'session/:session_id/appium/device/app_installed') do
          def app_installed?(app_id)
            execute :app_installed?, {}, bundleId: app_id
          end
        end

        add_endpoint_method(:background_app, 'session/:session_id/appium/app/background') do
          def background_app(duration)
            execute :background_app, {}, seconds: duration
          end
        end

        # @!method start_activity
        #   Start a new activity within the current app or launch a new app and start the target activity.
        #
        #   Android only.
        #   @param [String] The package owning the activity [required]
        #   @param [String] The target activity [required]
        #   @param [String] The package to start before the target package [optional]
        #   @param [String] The activity to start before the target activity [optional]
        #
        #   ```ruby
        #   start_activity app_package: 'io.appium.android.apis',
        #     app_activity: '.accessibility.AccessibilityNodeProviderActivity'
        #   ```
        add_endpoint_method(:start_activity, 'session/:session_id/appium/device/start_activity') do
          def start_activity(opts)
            fail 'opts must be a hash' unless opts.is_a? Hash
            app_package = opts[:app_package]
            fail 'app_package is required' unless app_package
            app_activity = opts[:app_activity]
            fail 'app_activity is required' unless opts[:app_activity]
            app_wait_package  = opts.fetch(:app_wait_package, '')
            app_wait_activity = opts.fetch(:app_wait_activity, '')

            unknown_opts = opts.keys - [:app_package, :app_activity, :app_wait_package, :app_wait_activity]
            fail "Unknown options #{unknown_opts}" unless unknown_opts.empty?

            execute :start_activity, {}, appPackage: app_package,
                                         appActivity: app_activity,
                                         appWaitPackage: app_wait_package,
                                         appWaitActivity: app_wait_activity
          end
        end

        add_endpoint_method(:set_context, 'session/:session_id/context') do
          def set_context(context = null)
            execute :set_context, {}, name: context
          end
        end

        add_endpoint_method(:hide_keyboard, 'session/:session_id/appium/device/hide_keyboard') do
          def hide_keyboard(close_key = nil)
            # Android can only tapOutside.
            if $driver.device_is_android?
              return execute :hide_keyboard, {}, strategy: :tapOutside
            end

            close_key ||= 'Done' # default to Done key.
            $driver.hide_ios_keyboard close_key
          end
        end

        add_endpoint_method(:press_keycode, 'session/:session_id/appium/device/press_keycode') do
          def press_keycode(key, metastate = nil)
            args             = { keycode: key }
            args[:metastate] = metastate if metastate
            execute :press_keycode, {}, args
          end
        end

        add_endpoint_method(:long_press_keycode, 'session/:session_id/appium/device/long_press_keycode') do
          def long_press_keycode(key, metastate = nil)
            args             = { keycode: key }
            args[:metastate] = metastate if metastate
            execute :long_press_keycode, {}, args
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:set_immediate_value, 'session/:session_id/appium/element/:id/value') do
          def set_immediate_value(element, value)
            execute :set_immediate_value, { id: element.ref }, value: value
          end
        end

        add_endpoint_method(:push_file, 'session/:session_id/appium/device/push_file') do
          def push_file(path, filedata)
            encoded_data = Base64.encode64 filedata
            execute :push_file, {}, path: path, data: encoded_data
          end
        end

        add_endpoint_method(:pull_file, 'session/:session_id/appium/device/pull_file') do
          def pull_file(path)
            data = execute :pull_file, {}, path: path
            Base64.decode64 data
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:pull_folder, 'session/:session_id/appium/device/pull_folder') do
          def pull_folder(path)
            data = execute :pull_folder, {}, path: path
            Base64.decode64 data
          end
        end

        # TODO: TEST ME
        add_endpoint_method(:end_coverage, 'session/:session_id/appium/app/end_test_coverage') do
          def end_coverage(path, intent)
            execute :end_coverage, {}, path: path, intent: intent
          end
        end

        add_endpoint_method(:get_settings, 'session/:session_id/appium/settings', :get) do
          def get_settings
            execute :get_settings, {}
          end
        end

        add_endpoint_method(:update_settings, 'session/:session_id/appium/settings') do
          def update_settings(settings)
            execute :update_settings, {}, settings: settings
          end
        end

        # @!method get_network_connection
        #   Get the device network connection current status
        #   See set_network_connection method for return value

        # @!method set_network_connection
        #   Set the device network connection mode
        #   @param path (String) Bit mask that represent the network mode
        #   Value (Alias)      | Data | Wifi | Airplane Mode
        #   -------------------------------------------------
        #   1 (Airplane Mode)  | 0    | 0    | 1
        #   6 (All network on) | 1    | 1    | 0
        #   4 (Data only)      | 1    | 0    | 0
        #   2 (Wifi only)      | 0    | 1    | 0
        #   0 (None)           | 0    | 0    | 0
        #
        add_endpoint_method(:set_network_connection, 'session/:session_id/network_connection') do
          def set_network_connection(mode)
            execute :set_network_connection, {}, type: mode
          end
        end

        add_touch_actions
        extend_search_contexts
      end

      # def extended

      # @private
      def add_endpoint_method(method, path, verb = :post)
        if block_given?
          # &Proc.new with no args passes the passed_in block
          # Because creating Procs from blocks is slow
          create_bridge_command method, verb, path, &Proc.new
        else
          create_bridge_command method, verb, path
        end

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
      def create_bridge_command(method, verb, path)
        Selenium::WebDriver::Remote::Bridge.class_eval do
          command method, verb, path
          if block_given?
            class_eval(&Proc.new)
          else
            define_method(method) { execute method }
          end
        end
      end

      # @!method accessiblity_id_find
      #   find_element/s with their accessibility_id
      #
      #   ```ruby
      #    find_elements :accessibility_id, 'Animation'
      #   ```
      def extend_search_contexts
        Selenium::WebDriver::SearchContext.class_eval do
          Selenium::WebDriver::SearchContext::FINDERS[:accessibility_id] = 'accessibility id'
        end
      end

      def add_touch_actions
        add_endpoint_method(:touch_actions, 'session/:session_id/touch/perform') do
          def touch_actions(actions)
            actions = { actions: [actions].flatten }
            execute :touch_actions, {}, actions
          end
        end

        add_endpoint_method(:multi_touch, 'session/:session_id/touch/multi/perform') do
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
    # @return [Array<String>] All usable contexts, as an array of strings.

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
