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
          raise NotImplementedError,
                "Please define pinch with percentage: #{percentage}, auto_perform: #{auto_perform}, driver: #{driver}"
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
          raise NotImplementedError,
                "Please define zoom with percentage: #{percentage}, auto_perform: #{auto_perform}, driver: #{driver}"
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
