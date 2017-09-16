module Appium
  module Ios
    module Xcuitest
      module SearchContext
        class << self
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
          #    # matching predicate. <code>`</code> is the mark.
          #    find_elements :class_chain, 'XCUIElementTypeWindow[`visible = 1][`name = \"bla\"`]'
          #    # containing predicate. `$` is the mark.
          #    find_elements :class_chain, 'XCUIElementTypeWindow[$name = \"bla$$$bla\"$]'
          #   ```
          def extended(_mod)
            ::Appium::Driver::SearchContext::FINDERS[:class_chain] = '-ios class chain'
          end
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
