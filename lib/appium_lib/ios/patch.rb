module Appium
  module Ios
    # @private
    # class_eval inside a method because class Selenium::WebDriver::Element
    # will trigger as soon as the file is required. in contrast a method
    # will trigger only when invoked.
    def patch_webdriver_element
      Selenium::WebDriver::Element.class_eval do
        # Enable access to iOS accessibility label
        # accessibility identifier is supported as 'name'
        def label
          self.attribute('label')
        end

        # Cross platform way of entering text into a textfield
        def type text
          # enter text then tap window to hide the keyboard.
=begin
Find the top left corner of the keyboard and move up 10 pixels (origin.y - 10)
now swipe down until the end of the window - 10 pixels.
-10 to ensure we're not going outside the window bounds.

Swiping inside the keyboard will not dismiss it.

var startY = au.mainApp().keyboard().rect().origin.y - 10;
var endY = au.mainWindow().rect().size.height - 10;
au.flickApp(0, startY, 0, endY);

The above logic has been accepted as part of appium's au.hideKeyboard
https://github.com/appium/appium-uiauto/blob/dbeb4eedbdea2104751a0d547ac9b2894e0dc567/uiauto/appium/app.js#L902

If the 'Done' key exists then that should be pressed to dismiss the keyboard
because swiping to dismiss works only if such key doesn't exist.
=end
          # type
          $driver.execute_script %(au.getElement('#{self.ref}').setValue('#{text}');)
          $driver.hide_ios_keyboard
        end # def type
      end # Selenium::WebDriver::Element.class_eval
    end # def patch_webdriver_element
  end # module Ios
end # module Appium