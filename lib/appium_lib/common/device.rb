module Appium
  module Device
    extend Forwardable

    class << self
      def extended(_mod)
        add_touch_actions
      end

      private

      def add_touch_actions
        actions = Appium::TouchAction::COMPLEX_ACTIONS
        actions.each do |method|
          delegate_from_appium_driver(method, Appium::TouchAction)
        end

        # To keep compatibility
        # pinch and zoom are defined in Appium::MultiTouch.
        delegate_from_appium_driver(:pinch, Appium::MultiTouch)
        delegate_from_appium_driver(:zoom, Appium::MultiTouch)
      end

      def delegate_from_appium_driver(method, delegation_target)
        def_delegator delegation_target, method
      end
    end # class << self
  end # module Device
end # module Appium
