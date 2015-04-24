module Appium
  # MultiTouch actions allow for multiple touches to happen at the same time,
  # for instance, to simulate multiple finger swipes.
  #
  # Create a series of touch actions by themselves (without a `prepare()`), then
  # add to a new MultiTouch action.  When ready, call `prepare()` and all
  # actions will be executed simultaneously.
  #
  # ```ruby
  # action_1 = TouchAction.new.press(x: 45, y: 100).wait(5).release
  # action_2 = TouchAction.new.tap(element: el, x: 50, y:5, count: 3).release
  #
  # multi_touch_action = MultiTouch.new
  # multi_touch_action.add action_1
  # multi_touch_action.add action_2
  # multi_touch_action.perform
  class MultiTouch
    class << self
      # Convenience method for pinching the screen.
      # Places two fingers at the edges of the screen and brings them together.
      # @param percentage (int) The percent size by which to shrink the screen when pinched.
      # @param auto_perform (boolean) Whether to perform the action immediately (default true)
      #
      # ```ruby
      # action = pinch 75 #=> Pinch the screen from the top right and bottom left corners
      # action.perform    #=> to 25% of its size.
      # ```
      def pinch(percentage = 25, auto_perform = true)
        fail ArgumentError("Can't pinch to greater than screen size.") if percentage > 100

        p = Float(percentage) / 100
        i = 1 - p

        top = TouchAction.new
        top.swipe start_x: 1.0, start_y: 0.0, end_x: i, end_y: i, duration: 1

        bottom = TouchAction.new
        bottom.swipe(start_x: 0.0, start_y: 1.0, end_x: p, end_y: p, duration: 1)

        pinch = MultiTouch.new
        pinch.add top
        pinch.add bottom
        return pinch unless auto_perform
        pinch.perform
      end

      # Convenience method for zooming the screen.
      # Places two fingers at the edges of the screen and brings them together.
      # @param percentage (int) The percent size by which to shrink the screen when pinched.
      # @param auto_perform (boolean) Whether to perform the action immediately (default true)
      #
      # ```ruby
      # action = zoom 200 #=> Zoom in the screen from the center until it doubles in size.
      # action.perform
      # ```
      def zoom(percentage = 200, auto_perform = true)
        fail ArgumentError("Can't zoom to smaller then screen size.") if percentage < 100

        p = 100 / Float(percentage)
        i = 1 - p

        top = TouchAction.new
        top.swipe start_x: i, start_y: i, end_x: 1, end_y: 1, duration: 1

        bottom = TouchAction.new
        bottom.swipe start_x: p, start_y: p, end_x: 1, end_y: 1, duration: 1

        zoom = MultiTouch.new
        zoom.add top
        zoom.add bottom
        return zoom unless auto_perform
        zoom.perform
      end
    end

    # Create a new multi-action
    def initialize
      @actions = []
    end

    # Add a touch_action to be performed
    # @param chain (TouchAction) The action to add to the chain
    def add(chain)
      @actions << chain.actions
    end

    # Ask Appium to perform the actions
    def perform
      $driver.multi_touch @actions
    end
  end # class MultiTouch
end # module Appium
