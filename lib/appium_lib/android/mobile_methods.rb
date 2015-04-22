module Appium
  module Android
    class << self
      # @!method uiautomator_find
      #   find_element/s can be used with a [UISelector](http://developer.android.com/tools/help/uiautomator/UiSelector.html).
      #
      #   ```ruby
      #    find_elements :uiautomator, 'new UiSelector().clickable(true)'
      #   ```
      def extended(_mod)
        Selenium::WebDriver::SearchContext.class_eval do
          Selenium::WebDriver::SearchContext::FINDERS[:uiautomator] = '-android uiautomator'
        end
      end
    end # class << self
  end # module Android
end # module Appium
