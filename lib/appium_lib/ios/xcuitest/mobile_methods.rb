module Appium
  module Ios
    module Xcuitest
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
        #   ```
        def extended(_mod)
          ::Appium::Driver::SearchContext::FINDERS[:class_chain] = '-ios class chain'
        end
      end

      module Method
        # @param [string] content The content of the pasteboard. The previous content is going to be overridden. The parameter is mandatory
        # @option opts [string] :encoding Encoding of the given content. UTF-8 by default.
        #
        #   ```ruby
        #   set_pasteboard content: "sample content"
        #   ```
        def set_pasteboard(content:, encoding: nil)
          args = { content: content }
          args[:encoding] = encoding if encoding

          @driver.execute_script 'mobile: setPasteboard', args
        end

        # @option opts [string] :encoding Encoding of the received pasteboard content. UTF-8 by default.
        #
        #   ```ruby
        #   get_pasteboard encoding: "shift-jis"
        #   ```
        def get_pasteboard(encoding: nil)
          args = {}
          args[:encoding] = encoding if encoding

          @driver.execute_script 'mobile: getPasteboard', args
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
