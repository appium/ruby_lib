module Appium
  class Driver
    module SearchContext
      # @!method uiautomator_find
      #   For Android
      #   find_element/s can be used with a [UISelector](http://developer.android.com/tools/help/uiautomator/UiSelector.html).
      #
      #   ```ruby
      #    find_elements :uiautomator, 'new UiSelector().clickable(true)'
      #   ```

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
      #
      # @!method ios_class_chain_find
      #   Only for XCUITest(WebDriverAgent)
      #   find_element/s can be used with a [class chain]( https://github.com/facebook/WebDriverAgent/wiki/Queries)
      #
      #   ```ruby
      #    # select the third child button of the first child window element
      #    find_elements :class_chain, 'XCUIElementTypeWindow/XCUIElementTypeButton[3]'
      #    # select all the children windows
      #    find_elements :class_chain, 'XCUIElementTypeWindow'
      #    # select the second last child of the second child window
      #    find_elements :class_chain, 'XCUIElementTypeWindow[2]/XCUIElementTypeAny[-2]'
      #   ```
      FINDERS = {
        accessibility_id: 'accessibility id',

        uiautomator:      '-android uiautomator',

        uiautomation:     '-ios uiautomation',
        predicate:        '-ios predicate string',
        class_chain:      '-ios class chain'
      }.freeze
    end
  end
end
