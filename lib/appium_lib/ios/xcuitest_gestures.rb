module Appium
  module Ios
    # @param x [float] X tap coordinate of type float. Mandatory parameter
    # @param y [float] Y tap coordinate of type float. Mandatory parameter
    # @option opts [Element] :element Element id to long tap on.
    def tap(x:, y:, element: nil)
      return unless automation_name_is_xcuitest?

      args = element ? {x: x, y: y, element: element} : {x: x, y: y}
      execute_script('mobile: tap', args)
    end
  end # module Ios
end # module Appium
