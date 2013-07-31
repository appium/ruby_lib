# encoding: utf-8
module Appium::Ios
  # @private
  # class_eval inside a method because class Selenium::WebDriver::Element
  # will trigger as soon as the file is required. in contrast a method
  # will trigger only when invoked.
  def patch_webdriver_element
    Selenium::WebDriver::Element.class_eval do
      # Cross platform way of entering text into a textfield
      def type text
        # enter text then tap window to hide the keyboard.
=begin
Find the top left corner of the keyboard and move up 10 pixels (origin.y - 10)
now swipe down until the end of the window - 10 pixels.
-10 to ensure we're not going outside the window bounds.

Swiping inside the keyboard will not dismiss it.
=end
        # type
        $driver.execute_script %(au.getElement('#{self.ref}').setValue('#{text}');)

        # wait for keyboard
        $driver.wait_true { $driver.execute_script %(au.mainApp.keyboard().type
() !== 'UIAElementNil') }

        # dismiss keyboard
        js = <<-JS
          if (au.mainApp.keyboard().type() !== "UIAElementNil") {
            var startY = au.mainApp.keyboard().rect().origin.y - 10;
            var endY = au.mainWindow.rect().size.height - 10;
            au.flickApp(0, startY, 0, endY);
          }
        JS

        $driver.execute_script js
      end
    end
  end
end