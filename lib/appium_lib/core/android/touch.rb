module Appium
  module Core
    module Android
      module Touch
        def self.extend_touch_actions
          ::Appium::Core::TouchAction.class_eval do
            # Visible for testing
            # @private
            def swipe_coordinates(end_x: nil, end_y: nil, offset_x: nil, offset_y: nil)
              puts 'end_x and end_y are used for Android. Not offset_x and offset_y.' if end_x.nil? || end_y.nil?
              end_x ||= 0
              end_y ||= 0
              { offset_x: end_x, offset_y: end_y }
            end
          end
        end

        def self.extend_multi_touch
          ::Appium::Core::MultiTouch.class_eval do
            def pinch(percentage: 25, auto_perform: true, driver:)
              raise ArgumentError("Can't pinch to greater than screen size.") if percentage > 100

              rate = Float(percentage) / 100
              pinch = MultiTouch.new(driver)

              top, bottom = pinch_android(rate, pinch.driver)

              pinch.add top
              pinch.add bottom
              return pinch unless auto_perform
              pinch.perform
            end

            def zoom(percentage: 200, auto_perform: true, driver:)
              raise ArgumentError("Can't zoom to smaller then screen size.") if percentage < 100

              rate = 100 / Float(percentage)
              zoom = MultiTouch.new(driver)

              top, bottom = zoom_android(rate, zoom.driver)

              zoom.add top
              zoom.add bottom
              return zoom unless auto_perform
              zoom.perform
            end

            private

            def pinch_android(rate, driver)
              height = 100

              top = ::Appium::Core::TouchAction.new(driver)
              top.swipe start_x: 0.5, start_y: 1.0 * height,
                        end_x: 0.5, end_y: rate * height, duration: 1_000

              bottom = ::Appium::Core::TouchAction.new(driver)
              bottom.swipe start_x: 0.5, start_y: 0.0,
                           end_x: 0.5, end_y: (1 - rate) * height, duration: 1_000

              [top, bottom]
            end

            def zoom_android(rate, driver)
              height = 100

              top = ::Appium::Core::TouchAction.new(driver)
              top.swipe start_x: 0.5, start_y: (1.0 - rate) * height,
                        end_x: 0.5, end_y: 0.0, duration: 1_000

              bottom = ::Appium::Core::TouchAction.new(driver)
              bottom.swipe start_x: 0.5, start_y: rate * height,
                           end_x: 0.5, end_y: 1.0 * height, duration: 1_000

              [top, bottom]
            end
          end
        end
      end
    end
  end
end
