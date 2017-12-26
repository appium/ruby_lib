module Appium
  module Ios
    module Xcuitest
      module PasteBoard
        # @param [string] content The content of the pasteboard. The previous content is going to be overridden.
        #                         The parameter is mandatory
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
