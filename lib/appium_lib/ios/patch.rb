# encoding: utf-8
module Appium::Ios
  # Implement useful features for element.
  class Selenium::WebDriver::Element
    # Cross platform way of entering text into a textfield
    def type text
      # enter text then tap window to hide the keyboard.
      js = %Q(
      au.getElement('#{self.ref}').setValue('#{text}');
      au.lookup('window')[0].tap()
    )
      @driver.execute_script js
    end
  end
end