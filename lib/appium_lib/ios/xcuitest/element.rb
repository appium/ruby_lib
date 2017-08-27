require_relative 'element/text'
require_relative 'element/textfield'
require_relative 'element/generic'
require_relative 'element/button'

module Appium
  module Ios
    module Xcuitest
      module Element
        # @private
        # class_eval inside a method because class Selenium::WebDriver::Element
        # will trigger as soon as the file is required. in contrast a method
        # will trigger only when invoked.
        def patch_webdriver_element
          Selenium::WebDriver::Element.class_eval do
            # Enable access to iOS accessibility label
            # accessibility identifier is supported as 'name'
            def label
              attribute('label')
            end

            # Cross platform way of entering text into a textfield
            def type(text)
              send_keys text
            end # def type
          end # Selenium::WebDriver::Element.class_eval
        end # def patch_webdriver_element
      end # module Element
    end # module Xcuitest
  end # module Ios
end # module Appium
