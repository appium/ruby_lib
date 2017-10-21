module Appium
  module Core
    module Ios
      module Touch
        def self.extend_touch_actions
          ::Appium::Core::TouchAction.class_eval do
            def swipe_coordinates(start_x: 0, start_y: 0, offset_x: 0, offset_y: 0)
              { offset_x: offset_x, offset_y: offset_y }
            end
          end
        end
      end
    end
  end
end
