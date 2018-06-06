module Appium
  module Ios
    module Xcuitest
      # Get the contexts available, with information about the url and title of each webview
      module GetContext
        #
        # @example
        #
        #     xcuitest_get_contexts
        #
        def xcuitest_get_contexts
          @driver.execute_script 'mobile: mobileGetContexts', {}
        end
      end # module GetContext
    end # module Xcuitest
  end # module Ios
end # module Appium
