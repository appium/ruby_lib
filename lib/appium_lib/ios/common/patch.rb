module Appium
  module Ios
    # @private
    # class_eval inside a method because class Selenium::WebDriver::Element
    # will trigger as soon as the file is required. in contrast a method
    # will trigger only when invoked.
    def patch_webdriver_element
      Selenium::WebDriver::Element.class_eval do
        # Cross platform way of entering text into a textfield
        def type(text, driver = $driver)
          driver.execute_script %(au.getElement('#{ref}').setValue('#{text}');)
        end # def type
      end # Selenium::WebDriver::Element.class_eval
    end # def patch_webdriver_element
  end # module Ios
end # module Appium
