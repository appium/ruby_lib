require 'base64'

module Appium
  module Ios
    module Xcuitest
      module Device
        extend Forwardable

        # @!method hide_keyboard
        #   Hide the onscreen keyboard
        #   @param [String] close_key The name of the key which closes the keyboard.
        #   @param [Symbol] strategy The symbol of the strategy which closes the keyboard.
        #     XCUITest ignore this argument.
        #     Default for iOS is `:pressKey`. Default for Android is `:tapOutside`.
        #  ```ruby
        #  hide_keyboard # Close a keyboard with the 'Done' button
        #  hide_keyboard('Finished') # Close a keyboard with the 'Finished' button
        #  ```

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

        class << self
          def extended(_mod)
            ::Appium::Device.extend_webdriver_with_forwardable

            ::Appium::Device.add_endpoint_method(:hide_keyboard) do
              def hide_keyboard(close_key = nil, strategy = nil)
                option = {}

                option[:key] = close_key if close_key
                option[:strategy] = strategy if strategy

                execute :hide_keyboard, {}, option
              end
            end

            ::Appium::Device.add_endpoint_method(:background_app) do
              def background_app(duration = 0)
                # https://github.com/appium/ruby_lib/issues/500, https://github.com/appium/appium/issues/7741
                # `execute :background_app, {}, seconds: { timeout: duration_milli_sec }` works over Appium 1.6.4
                duration_milli_sec = duration.nil? ? nil : duration * 1000
                execute :background_app, {}, seconds: { timeout: duration_milli_sec }
              end
            end
          end
        end # class << self
      end # module Device
    end # module Xcuitest
  end # module Ios
end # module Appium
