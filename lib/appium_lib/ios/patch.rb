# encoding: utf-8
module Appium::Ios
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

      # returns if the element is visible
      # true: 1 = visible,
      # false: 0 = not visible, null = unknown
      #
      # http://developer.apple.com/library/ios/#documentation/ToolsLanguages/Reference/UIAElementClassReference/UIAElement/UIAElement.html#//apple_ref/doc/uid/TP40009903
      def visible
        js = <<-JS
          au.getElement('#{self.ref}').isVisible();
        JS
        result = @driver.execute_script js
        result == 1 ? true : false
      end
    end
  end
end