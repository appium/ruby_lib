module Appium
  module Ios
    module Xcuitest
      # Instance method have `xcuitest_` prefix to prevent conflicts for core commands.
      module Source
        # @param [String|Symbol] format :xml or :json. :xml is by default.
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
