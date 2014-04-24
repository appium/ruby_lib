module Appium

  # Perform a series of gestures, one after another.  Gestures are chained
  # together and only performed when `perform()` is called.
  #
  # Each method returns the object itself, so calls can be chained.
  #
  # ```ruby
  # action = TouchAction.new.press(x: 45, y: 100).wait(5).release
  # action.perform
  class TouchAction
    ACTIONS = [:move_to, :press_for_duration, :press, :release, :tap, :wait, :perform]
    COMPLEX_ACTIONS = [:swipe]
    
    class << self
      COMPLEX_ACTIONS.each do |action|
        define_method(action) do |opts|
          auto_perform = opts.delete(:auto_perform) {|k| true}
          ta = TouchAction.new
          ta.send(action, opts)
          return ta unless auto_perform
          ta.perform
        end
      end
    end  

    attr_reader :actions

    def initialize
      @actions = []
    end

    # Move to the given co-ordinates.
    # @option opts (integer) :x x co-ordinate to move to.
    # @option opts (integer) :y y co-ordinate to move to.
    # @option opts (WebDriver::Element) Element to scope this move within.
    def move_to(opts)
      opts = args_with_ele_ref(opts)
      chain_method(:moveTo, opts)
    end

    # Press down for a specific duration.
    # @param element (WebDriver::Element) the element to press.
    # @param x (integer) x co-ordinate to press on.
    # @param y (integer) y co-ordinate to press on.
    # @param (integer) Number of seconds to press.
    def press_for_duration(element, x, y, duration)
      @actions << {element: element.ref, x: x, y: y, duration: duration}
      chain_method(:longPress, args)
    end

    # Press a finger onto the screen.  Finger will stay down until you call
    # `release`.
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to press within.
    # @option opts [integer] :x x co-ordinate to press on
    # @option opts [integer] :y y co-ordinate to press on
    def press(opts)
      args = opts.select {|k, v| [:element, :x, :y].include? k}
      args = args_with_ele_ref(args)
      chain_method(:press, args)
    end

    # Remove a finger from the screen.
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to release from.
    # @option opts [integer] :x x co-ordinate to release from
    # @option opts [integer] :y y co-ordinate to release from
    def release(opts=nil)
      args = args_with_ele_ref(opts) if opts
      chain_method(:release, args)
    end

    # Touch a point on the screen
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to restrict scope too.
    # @option opts [integer] :x x co-ordinate to tap
    # @option opts [integer] :y y co-ordinate to tap
    # @option opts [integer] :fingers how many fingers to tap with (Default 1)
    def tap(opts)
      opts[:count] = opts.delete(:fingers) if opts[:fingers]
      opts_with_defaults = {count: 1}.merge opts
      chain_method(:tap, opts_with_defaults)
    end

    # Pause for a number of seconds before the next action
    # @params seconds (integer) Number of seconds to pause for
    def wait(seconds)
      args = {ms: seconds}
      chain_method(:wait, args)
    end

    # Convenience method to peform a swipe.
    # @option opts [int] :start_x Where to start swiping, on the x axis.  Default 0.
    # @option opts [int] :start_y Where to start swiping, on the y axis.  Default 0.
    # @option opts [int] :end_x Where to end swiping, on the x axis.  Default 0.
    # @option opts [int] :end_y Where to end swiping, on the y axis.  Default 0.
    # @option opts [int] :duration How long the actual swipe takes to complete.
    def swipe(opts)
      start_x = opts.fetch :start_x, 0
      start_y = opts.fetch :start_y, 0
      end_x = opts.fetch :end_x, 0
      end_y = opts.fetch :end_y, 0
      duration = opts[:duration]

      self.press x: start_x, y: start_y
      self.wait(duration) if duration
      self.move_to x: end_x, y: end_y
      self.release
      self
    end

    # Ask the driver to perform all actions in this action chain.
    def perform
      $driver.touch_actions @actions
      self
    end

    # Does nothing, currently.
    def cancel
      @actions << {action: cancel}
      $driver.touch_actions @actions
      self
    end

    private

    def chain_method(method, args=nil)
      if args
        @actions << {action: method, options: args}
      else
        @actions << {action: method}
      end
      self
    end

    def args_with_ele_ref(args)
      args[:element] = args[:element].ref if args.has_key? :element
      args
    end
  end
end