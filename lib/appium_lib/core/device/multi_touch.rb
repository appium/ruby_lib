module Appium
  module Core
    # MultiTouch actions allow for multiple touches to happen at the same time,
    # for instance, to simulate multiple finger swipes.
    #
    # Create a series of touch actions by themselves (without a `prepare()`), then
    # add to a new MultiTouch action.  When ready, call `prepare()` and all
    # actions will be executed simultaneously.
    #
    # ```ruby
    # action_1 = TouchAction.new.press(x: 45, y: 100).wait(5).release
    # action_2 = TouchAction.new.tap(element: el, x: 50, y:5, count: 3)
    #
    # driver =  Appium::Driver.new(opts, false).start_driver
    # multi_touch_action = MultiTouch.new(driver)
    # multi_touch_action.add action_1
    # multi_touch_action.add action_2
    # multi_touch_action.perform
    # ```

    class MultiTouch
      class << self
        # Convenience method for pinching the screen.
        # Places two fingers at the edges of the screen and brings them together.
        # @param percentage (int) The percent size by which to shrink the screen when pinched.
        # @param auto_perform (boolean) Whether to perform the action immediately (default true)
        # @param driver (Driver) Set a driver to conduct the action. DEfault is global driver($driver)
        #
        # ```ruby
        # driver =  Appium::Driver.new(opts, false).start_driver
        # pinch percentage: 75, driver: driver #=> Pinch the screen from the top right and bottom left corners
        # ```
        #
        # Without auto_perform
        #
        # ```ruby
        # driver =  Appium::Driver.new(opts, false).start_driver
        # action = pinch percentage: 75, auto_perform: false, driver: driver
        #   #=> Pinch the screen from the top right and bottom left corners
        # action.perform    #=> to 25% of its size.
        # ```
        def pinch(percentage: 25, auto_perform: true, driver:)
          raise ArgumentError("Can't pinch to greater than screen size.") if percentage > 100

          rate = Float(percentage) / 100
          pinch = MultiTouch.new(driver)

          # TODO: Don't use driver automation handler here.
          if pinch.driver.automation_name_is_xcuitest?
            top, bottom = pinch_for_xcuitest(rate, pinch.driver)
          elsif pinch.driver.device_is_android?
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
        # ```ruby
        # driver =  Appium::Driver.new(opts, false).start_driver
        # action = zoom percentage: 200, driver: driver #=> Zoom in the screen from the center until it doubles in size.
        # ```
        #
        # Without auto_perform
        #
        # ```ruby
        # driver =  Appium::Driver.new(opts, false).start_driver
        # action = zoom percentage: 200, auto_perform: false, driver: driver
        #   #=> Zoom in the screen from the center until it doubles in size.
        # action.perform    #=> to 25% of its size.
        # ```
        def zoom(percentage: 200, auto_perform: true, driver:)
          raise ArgumentError("Can't zoom to smaller then screen size.") if percentage < 100

          rate = 100 / Float(percentage)
          zoom = MultiTouch.new(driver)

          # TODO: Don't use driver automation handler here.
          if zoom.driver.automation_name_is_xcuitest?
            top, bottom = zoom_for_xcuitest(rate, zoom.driver)
          elsif zoom.driver.device_is_android?
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

        def pinch_for_xcuitest(rate, driver)
          height = 100

          ele = driver.find_element :class, 'XCUIElementTypeApplication'
          top = ::Appium::Core::TouchAction.new(driver)
          top.swipe({ start_x: 0.5, start_y: 0.0,
                      offset_x: 0.0, offset_y: (1 - rate) * height }, ele)

          bottom = ::Appium::Core::TouchAction.new(driver)
          bottom.swipe({ start_x: 0.5, start_y: 1.0,
                         offset_x: 0.0, offset_y: rate * height }, ele)

          [top, bottom]
        end

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

        def pinch_ios(rate, driver)
          height = 100

          top = ::Appium::Core::TouchAction.new(driver)
          top.swipe start_x: 0.5, start_y: 0.0,
                    offset_x: 0.0, offset_y: (1 - rate) * height, duration: 1_000

          bottom = ::Appium::Core::TouchAction.new(driver)
          bottom.swipe start_x: 0.5, start_y: 1.0,
                       offset_x: 0.0, offset_y: rate * height, duration: 1_000

          [top, bottom]
        end

        def zoom_for_xcuitest(rate, driver)
          height = 100

          ele = driver.find_element :class, 'XCUIElementTypeApplication'
          top = ::Appium::Core::TouchAction.new(driver)
          top.swipe({ start_x: 0.5, start_y: (1 - rate) * height,
                      offset_x: 0.0, offset_y: - (1 - rate) * height }, ele)

          bottom = ::Appium::Core::TouchAction.new(driver)
          bottom.swipe({ start_x: 0.5, start_y: rate * height,
                         offset_x: 0.0, offset_y: (1 - rate) * height }, ele)

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

        def zoom_ios(rate, driver)
          height = 100

          top = ::Appium::Core::TouchAction.new(driver)
          top.swipe start_x: 0.5, start_y: (1 - rate) * height,
                    offset_x: 0.0, offset_y: - (1 - rate) * height, duration: 1_000

          bottom = ::Appium::Core::TouchAction.new(driver)
          bottom.swipe start_x: 0.5, start_y: rate * height,
                       offset_x: 0.0, offset_y: (1 - rate) * height, duration: 1_000

          [top, bottom]
        end
      end # self

      attr_reader :actions, :driver

      # Create a new multi-action with Driver
      def initialize(driver)
        @actions = []
        @driver = driver
      end

      # Add a touch_action to be performed
      # @param chain (TouchAction) The action to add to the chain
      def add(chain)
        @actions << chain.actions
      end

      # Ask Appium to perform the actions
      def perform
        @driver.multi_touch @actions
        @actions.clear
      end
    end # class MultiTouch
  end # module Core
end # module Appium
