require 'base64'

module Appium
  module Android
    module Device
      extend Forwardable

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

      class << self
        def extended(_mod)
          ::Appium::Device.extend_webdriver_with_forwardable

          ::Appium::Device.add_endpoint_method(:hide_keyboard) do
            def hide_keyboard(close_key = nil, strategy = nil)
              option = {}

              option[:key] = close_key if close_key
              option[:strategy] = strategy || :tapOutside # default to pressKey

              execute :hide_keyboard, {}, option
            end
          end
        end
      end # class << self
    end # module Device
  end # module Android
end # module Appium
