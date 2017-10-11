module Appium
  module Ios
    module Xcuitest
      module Source
        # @param [String|Symbol] format :xml or :json. :xml is by default.
        # @option opts [Element] :element Element to swipe on
        #
        #   ```ruby
        #   xcuitest_source format: :json
        #   ```
        def xcuitest_source(format: :xml)
          format = format.to_s if format.is_a? Symbol
          args = { format: format }

          @driver.execute_script 'mobile: source', args
        end
      end # module Gesture
    end # module Xcuitest
  end # module Ios
end # module Appium
