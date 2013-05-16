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
        js = <<-JS
          au.getElement('#{self.ref}').setValue('#{text}');
          au.lookup('window')[0].tap();
        JS
        @driver.execute_script js
      end
    end
  end
end