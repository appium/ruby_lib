# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Appium
  # MultiTouch actions allow for multiple touches to happen at the same time,
  # for instance, to simulate multiple finger swipes.
  #
  # Create a series of touch actions by themselves (without a `prepare()`), then
  # add to a new MultiTouch action.  When ready, call `prepare()` and all
  # actions will be executed simultaneously.
  #
  # @example
  #
  #   action_1 = TouchAction.new.press(x: 45, y: 100).wait(5).release
  #   action_2 = TouchAction.new.tap(element: el, x: 50, y:5, count: 3)
  #
  #   multi_touch_action = MultiTouch.new
  #   multi_touch_action.add action_1
  #   multi_touch_action.add action_2
  #   multi_touch_action.perform
  #
  #   # with an arbitrary driver
  #   driver = Appium::Driver.new(opts, false).start_driver # return an Appium::Core::Base::Driver instance
  #   multi_touch_action = MultiTouch.new(driver)
  #   multi_touch_action.add action_1
  #   multi_touch_action.add action_2
  #   multi_touch_action.perform
  #
  class MultiTouch < Core::MultiTouch
    class << self
      # Convenience method for pinching the screen.
      # Places two fingers at the edges of the screen and brings them together.
      # @param percentage (int) The percent size by which to shrink the screen when pinched.
      # @param auto_perform (boolean) Whether to perform the action immediately (default true)
      # @param driver (Driver) Set a driver to conduct the action. DEfault is global driver($driver)
      #
      # @example
      #
      #   pinch 75 #=> Pinch the screen from the top right and bottom left corners
      #
      # Without auto_perform
      #
      # @example
      #
      #   action = pinch 75, false #=> Pinch the screen from the top right and bottom left corners
      #   action.perform    #=> to 25% of its size.
      #
      # With driver
      #
      # @example
      #   driver =  Appium::Driver.new(opts, false).start_driver
      #   pinch 75, true, driver #=> Pinch the screen from the top right and bottom left corners
      #
      def pinch(percentage = 25, auto_perform = true, driver = $driver)
        raise ArgumentError("Can't pinch to greater than screen size.") if percentage > 100

        rate = Float(percentage) / 100
        pinch = MultiTouch.new(driver)

        if driver.device_is_android?
          top, bottom = pinch_android(rate, pinch.driver)
        else
          top, bottom = pinch_ios(rate, pinch.driver)
        end

        pinch.add top
        pinch.add bottom
        return pinch unless auto_perform

        pinch.perform
      end

      # Convenience method for zooming the screen.
      # Places two fingers at the edges of the screen and brings them together.
      # @param percentage (int) The percent size by which to shrink the screen when pinched.
      # @param auto_perform (boolean) Whether to perform the action immediately (default true)
      # @param driver (Driver) Set a driver to conduct the action. DEfault is global driver($driver)
      #
      # @example
      #
      #   action = zoom 200 #=> Zoom in the screen from the center until it doubles in size.
      #
      # Without auto_perform
      #
      # @example
      #
      #   action = zoom 200, false #=> Zoom in the screen from the center until it doubles in size.
      #   action.perform    #=> to 25% of its size.
      #
      # With driver
      #
      # @example
      #
      #   driver =  Appium::Driver.new(opts, false).start_driver
      #   pinch 200, true, driver #=> Zoom in the screen from the center until it doubles in size.
      #
      def zoom(percentage = 200, auto_perform = true, driver = $driver)
        raise ArgumentError("Can't zoom to smaller then screen size.") if percentage < 100

        rate = 100 / Float(percentage)
        zoom = MultiTouch.new(driver)

        if driver.device_is_android?
          top, bottom = zoom_android(rate, zoom.driver)
        else
          top, bottom = zoom_ios(rate, zoom.driver)
        end

        zoom.add top
        zoom.add bottom
        return zoom unless auto_perform

        zoom.perform
      end

      private

      # @private
      def pinch_android(rate, driver)
        height = 100
        offset = 100

        top = ::Appium::Core::TouchAction.new(driver)
        top.swipe start_x: offset, start_y: 1.0 * height + offset,
                  end_x: 0.0, end_y: (rate - 1) * height, duration: 1_000

        bottom = ::Appium::Core::TouchAction.new(driver)
        bottom.swipe start_x: offset, start_y: 0.0 + offset,
                     end_x: 0.0, end_y: (1 - rate) * height, duration: 1_000

        [top, bottom]
      end

      # @private
      def pinch_ios(rate, driver)
        height = 100
        offset = 100

        top = ::Appium::Core::TouchAction.new(driver)
        top.swipe start_x: 0.5, start_y: 0.0 + offset,
                  end_x: 0.0, end_y: (1 - rate) * height, duration: 1_000

        bottom = ::Appium::Core::TouchAction.new(driver)
        bottom.swipe start_x: 0.5, start_y: 1.0 + offset,
                     end_x: 0.0, end_y: rate * height, duration: 1_000

        [top, bottom]
      end

      # @private
      def zoom_android(rate, driver)
        height = 100
        offset = 100

        top = ::Appium::Core::TouchAction.new(driver)
        top.swipe start_x: offset, start_y: (1.0 - rate) * height + offset,
                  end_x: 0.0, end_y: (rate - 1.0) * height, duration: 1_000

        bottom = ::Appium::Core::TouchAction.new(driver)
        bottom.swipe start_x: offset, start_y: rate * height + offset,
                     end_x: 0.0, end_y: (1.0 - rate) * height, duration: 1_000

        [top, bottom]
      end

      # @private
      def zoom_ios(rate, driver)
        height = 100
        offset = 100

        top = ::Appium::Core::TouchAction.new(driver)
        top.swipe start_x: 0.5, start_y: (1 - rate) * height + offset,
                  end_x: 0.0, end_y: - (1 - rate) * height, duration: 1_000

        bottom = ::Appium::Core::TouchAction.new(driver)
        bottom.swipe start_x: 0.5, start_y: rate * height + offset,
                     end_x: 0.0, end_y: (1 - rate) * height, duration: 1_000

        [top, bottom]
      end
    end # self

    def initialize(driver = $driver)
      super(driver)
    end
  end # class MultiTouch
end # module Appium
