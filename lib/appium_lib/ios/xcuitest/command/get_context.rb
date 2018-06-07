module Appium
  module Ios
    module Xcuitest
      # Get the contexts available, with information about the url and title of each webview
      module GetContext
        #
        # Get contexts
        #
        # @example
        #
        #     xcuitest_get_contexts #=> [{ 'id' => 'NATIVE_APP' },
        #                       # { 'id' => 'WEBVIEW_41467.1', 'title' => 'Apple', 'url' => 'https://www.apple.com/' }]
        #
        def xcuitest_get_contexts
          @driver.execute_script 'mobile: getContexts', {}
        end
      end # module GetContext
    end # module Xcuitest
  end # module Ios
end # module Appium
