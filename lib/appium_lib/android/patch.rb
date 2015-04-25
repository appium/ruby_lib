module Appium
  module Android
    # @private
    # class_eval inside a method because class Selenium::WebDriver::Element
    # will trigger as soon as the file is required. in contrast a method
    # will trigger only when invoked.
    def patch_webdriver_element
      Selenium::WebDriver::Element.class_eval do
        # Cross platform way of entering text into a textfield
        def type(text)
          send_keys text
        end
      end
    end
  end # Android
end # Appium
