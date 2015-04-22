module Appium
  module Ios
    class << self
      # @!method uiautomation_find
      #   find_element/s can be used with a [UIAutomation command](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Reference/UIAWindowClassReference/UIAWindow/UIAWindow.html#//apple_ref/doc/uid/TP40009930).
      #
      #   ```ruby
      #    find_elements :uiautomation, 'elements()
      #   ```
      def extended(_mod)
        Selenium::WebDriver::SearchContext.class_eval do
          Selenium::WebDriver::SearchContext::FINDERS[:uiautomation] = '-ios uiautomation'
        end
      end
    end # class << self
  end # module Ios
end # module Appium
