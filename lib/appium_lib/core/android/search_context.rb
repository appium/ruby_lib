module Appium
  module Core
    module Android
      module SearchContext
        class << self
          # @!method uiautomator_find
          #   find_element/s can be used with a [UISelector](http://developer.android.com/tools/help/uiautomator/UiSelector.html).
          #
          #   ```ruby
          #    find_elements :uiautomator, 'new UiSelector().clickable(true)'
          #   ```
          def extended(_mod)
            ::Appium::Core::SearchContext::FINDERS[:uiautomator] = '-android uiautomator'
          end
        end
      end # class << self
    end # module Ios
  end # module Core
end # module Appium
