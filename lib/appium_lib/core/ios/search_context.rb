module Appium
  module Core
    module Ios
      module SearchContext
        # @!method uiautomation_find
        #   find_element/s can be used with a [UIAutomation command](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Reference/UIAWindowClassReference/UIAWindow/UIAWindow.html#//apple_ref/doc/uid/TP40009930).
        #
        #   ```ruby
        #    find_elements :uiautomation, 'elements()
        #   ```
        #
        # @!method ios_predicate_string_find
        #   find_element/s can be used with a [Predicates](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html)
        #
        #   ```ruby
        #    find_elements :predicate, "isWDVisible == 1"
        #    find_elements :predicate, 'wdName == "Buttons"'
        #    find_elements :predicate, 'wdValue == "SearchBar" AND isWDDivisible == 1'
        #   ```
        def self.extend
          ::Appium::Core::SearchContext.add_finders(uiautomation: '-ios uiautomation')
          ::Appium::Core::SearchContext.add_finders(predicate: '-ios predicate string')
        end
      end # class << self
    end # module Ios
  end # module Core
end # module Appium
