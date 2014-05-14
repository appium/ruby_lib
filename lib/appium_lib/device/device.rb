require 'base64'

module Appium
  module Device
    extend Forwardable

    NoArgMethods = {
      post: {
        shake:                'session/:session_id/appium/device/shake',
        launch:               'session/:session_id/appium/app/launch',
        close_app:            'session/:session_id/appium/app/close',
        reset:                'session/:session_id/appium/app/reset',
        toggle_airplane_mode: 'session/:session_id/appium/device/toggle_airplane_mode',
      },
      get:  {
        current_activity:   'session/:session_id/appium/device/current_activity',
        current_context:    'session/:session_id/context',
        available_contexts: 'session/:session_id/contexts',
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

    # @!method launch
    #   Start the simulator and applicaton configured with desired capabilities  

    # @!method reset
    #   Reset the device, relaunching the application.

    # @!method shake
    #   Cause the device to shake

    # @!method toggle_flight_mode
    #   toggle flight mode on or off

    #@!method complex_find
    #  Find an element by a complex array of criteria.  Available criteria
    #  are listed in [link here].  Criteria are formed by creating an array
    #  of arrays, each containing a selector and that selector's value.
    #
    #  ```ruby
    #  complex_find [[[2, 'Sau'], [14, true]]] # => Find a clickable element
    #                                          #    whose names starts with 'Sau'
    #  ```
    #  @param mod (Symbol) If present, will be the 0th element in the selector array.
    #  @param selectors (Array<Object>) The selectors to find elements with.

    # @!method hide_keyboard
    #   Hide the onscreen keyboard
    #   @param close_key (String) the name of the key which closes the keyboard.
    #     Defaults to 'Done'.
    #  ```ruby
    #  hide_keyboard # Close a keyboard with the 'Done' button
    #  hide_keyboard('Finished') # Close a keyboard with the 'Finished' button
    #  ```

    # @!method key_event
    # Send a key event to the device.
    # @param key (integer) The key to send.
    # @param metastate (String) The state the metakeys should be in when sending the key.

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

    # @!method end_coverage
    #   Android only;  Ends the test coverage and writes the results to the given path on device.
    #   @param path (String) Path on the device to write too.
    #   @param intent (String) Intent to broadcast when ending coverage.
    class << self
      def extended(mod)
        extend_webdriver_with_forwardable

        NoArgMethods.each_pair do |verb, pair|
          pair.each_pair { |command, path| add_endpoint_method command, path, verb }
        end

        add_endpoint_method(:app_strings, 'session/:session_id/appium/app/strings') do
          def app_strings language=nil
            opts = language ? { language: language } : {}
            execute :app_strings, {}, opts
          end
        end

        add_endpoint_method(:lock, 'session/:session_id/appium/device/lock') do
          def lock(duration)
            execute :lock, {}, :seconds => duration
          end
        end

        add_endpoint_method(:install, 'session/:session_id/appium/device/install_app') do
          def install(path)
            execute :install, {}, :appPath => path
          end
        end

        add_endpoint_method(:remove, 'session/:session_id/appium/device/remove_app') do
          def remove(id)
            execute :remove, {}, :appId => id
          end
        end

        add_endpoint_method(:is_installed?, 'session/:session_id/appium/device/app_installed') do
          def is_installed?(app_id)
            execute :is_installed?, {}, :bundleId => app_id
          end
        end

        add_endpoint_method(:background_app, 'session/:session_id/appium/app/background') do
          def background_app(duration)
            execute :background_app, {}, :seconds => duration
          end
        end

        add_endpoint_method(:set_context, 'session/:session_id/context') do
          def set_context(context=null)
            execute :set_context, {}, :name => context
          end
        end

        add_endpoint_method(:hide_keyboard, 'session/:session_id/appium/device/hide_keyboard') do
          def hide_keyboard(close_key='Done')
            execute :hide_keyboard, {}, keyName: close_key
          end
        end

        add_endpoint_method(:key_event, 'session/:session_id/appium/device/keyevent') do
          def key_event(key, metastate=nil)
            args             = { keycode: key }
            args[:metastate] = metastate if metastate
            execute :key_event, {}, args
          end
        end

        # TODO TEST ME
        add_endpoint_method(:set_immediate_value, 'session/:session_id/appium/element/:id/value') do
          def set_immediate_value(element, value)
            execute :set_immediate_value, { :id => element.ref }, value
          end
        end

        add_endpoint_method(:complex_find, 'session/:session_id/appium/app/complex_find') do
          def complex_find(opts)
            mode      = opts.fetch :mode, false
            selectors = opts.fetch :selectors, false
            raise 'Complex find must have selectors' unless selectors
            selectors.insert(0, mode) if mode

            ids = execute :complex_find, {}, selectors

            if mode == 'all' && ids.length > 1
              return ids.map { |id| Selenium::WebDriver::Element.new self, element_id_from(id) }
            else
              return Selenium::WebDriver::Element.new self, element_id_from(ids)
            end
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

        # TODO TEST ME
        add_endpoint_method(:end_coverage, 'session/:session_id/appium/app/end_test_coverage') do
          def end_coverage(path, intent)
            execute :end_coverage, {}, path: path, intent: intent
          end
        end

        add_touch_actions
        extend_search_contexts
      end

      # def extended

      # @private
      def add_endpoint_method(method, path, verb=:post)
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
        return if Selenium::WebDriver::Driver.kind_of? Forwardable
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
      def delegate_from_appium_driver(method, delegation_target=:driver)
        def_delegator delegation_target, method
      end

      # @private
      def create_bridge_command(method, verb, path)
        # Don't clobber methods that are moved into Selenium
        if selenium_has method
          log_reimplemented_warning(method, path)
          return
        end

        Selenium::WebDriver::Remote::Bridge.class_eval do
          command method, verb, path
          if block_given?
            class_eval &Proc.new
          else
            define_method(method) { execute method }
          end
        end
      end

      # @private
      def selenium_has(method)
        Selenium::WebDriver::Remote::Bridge.method_defined? method
      end

      # @private
      def log_reimplemented_warning(method, path)
        msg = "Selenium::WebDriver has now implemented the `#{method}` method."
        if Selenium::WebDriver::Remote::COMMANDS[method][1] == path
          msg << " It may no longer function as expected"
        else
          msg << " It no longer uses the same endpoint,"
          msg << " so it probably won't do what you expect anymore."
        end
        msg << " Raise an issue at http://www.github.com/appium/ruby_lib if so."
        Appium::Logger.warn msg
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
            actions = [actions].flatten
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
