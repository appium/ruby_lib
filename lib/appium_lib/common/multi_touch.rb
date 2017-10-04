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
  #   driver = Appium::Driver.new(opts, false).start_driver
  #   multi_touch_action = MultiTouch.new(driver)
  #   multi_touch_action.add action_1
  #   multi_touch_action.add action_2
  #   multi_touch_action.perform
  #
  class MultiTouch < ::Appium::Core::MultiTouch
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
        ::Appium::Core::MultiTouch.pinch percentage: percentage, auto_perform: auto_perform, driver: driver
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
        ::Appium::Core::MultiTouch.zoom percentage: percentage, auto_perform: auto_perform, driver: driver
      end
    end # self

    def initialize(driver = $driver)
      super driver
    end
  end # class MultiTouch
end # module Appium
