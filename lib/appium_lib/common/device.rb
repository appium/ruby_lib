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
          ::Appium::Core::Device.delegate_from_appium_driver(method, Appium::TouchAction)
        end

        # To keep compatibility
        # pinch and zoom are defined in Appium::MultiTouch.
        ::Appium::Core::Device.delegate_from_appium_driver(:pinch, Appium::MultiTouch)
        ::Appium::Core::Device.delegate_from_appium_driver(:zoom, Appium::MultiTouch)
      end
    end # class << self
  end # module Device
end # module Appium
