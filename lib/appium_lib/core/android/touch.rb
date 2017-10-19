module Appium
  module Core
    module Android
      module Touch
        def self.extend_touch_actions
          ::Appium::Core::TouchAction.class_eval do
            def swipe_coordinates(start_x: nil, start_y: nil, offset_x: nil, offset_y: nil)
              start_x  ||= 0
              start_y  ||= 0
              offset_x ||= 0
              offset_y ||= 0

              { offset_x: (start_x + offset_x), offset_y: (start_y + offset_y) }
            end
          end
        end

        def self.extend_multi_touch
          ::Appium::Core::MultiTouch.class_eval do
            def self.pinch(percentage: 25, auto_perform: true, driver:)
              raise ArgumentError("Can't pinch to greater than screen size.") if percentage > 100

              rate = Float(percentage) / 100
              pinch = MultiTouch.new(driver)

              top, bottom = pinch_android(rate, pinch.driver)

              pinch.add top
              pinch.add bottom
              return pinch unless auto_perform
              pinch.perform
            end

            def self.zoom(percentage: 200, auto_perform: true, driver:)
              raise ArgumentError("Can't zoom to smaller then screen size.") if percentage < 100

              rate = 100 / Float(percentage)
              zoom = MultiTouch.new(driver)

              top, bottom = zoom_android(rate, zoom.driver)

              zoom.add top
              zoom.add bottom
              return zoom unless auto_perform
              zoom.perform
            end

            # @private
            def self.pinch_android(rate, driver)
              height = 100
              offset = 100

              top = ::Appium::Core::TouchAction.new(driver)
              top.swipe start_x: offset, start_y: 1.0 * height + offset,
                        offset_x: 0.0, offset_y: (rate - 1) * height, duration: 1_000

              bottom = ::Appium::Core::TouchAction.new(driver)
              bottom.swipe start_x: offset, start_y: 0.0 + offset,
                           offset_x: 0.0, offset_y: (1 - rate) * height, duration: 1_000

              [top, bottom]
            end

            # @private
            def self.zoom_android(rate, driver)
              height = 100
              offset = 100

              top = ::Appium::Core::TouchAction.new(driver)
              top.swipe start_x: offset, start_y: (1.0 - rate) * height + offset,
                        offset_x: 0.0, offset_y: (rate - 1.0) * height, duration: 1_000

              bottom = ::Appium::Core::TouchAction.new(driver)
              bottom.swipe start_x: offset, start_y: rate * height + offset,
                           offset_x: 0.0, offset_y: (1.0 - rate) * height, duration: 1_000

              [top, bottom]
            end
          end
        end
      end
    end
  end
end
