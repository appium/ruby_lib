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
    ACTIONS         = [:move_to, :long_press, :press, :release, :tap, :wait, :perform]
    COMPLEX_ACTIONS = [:swipe]

    class << self
      COMPLEX_ACTIONS.each do |action|
        define_method(action) do |opts|
          auto_perform = opts.delete(:auto_perform) { |_k| true }
          ta           = TouchAction.new
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
    # @option opts [integer] :x x co-ordinate to move to.
    # @option opts [integer] :y y co-ordinate to move to.
    # @option opts [WebDriver::Element] Element to scope this move within.
    def move_to(opts)
      opts = args_with_ele_ref(opts)
      chain_method(:moveTo, opts)
    end

    # Press down for a specific duration.
    # @option element [WebDriver::Element] the element to press.
    # @option x [integer] x co-ordinate to press on.
    # @option y [integer] y co-ordinate to press on.
    # @option duration [integer] Number of milliseconds to press.
    def long_press(opts)
      args = opts.select { |k, _v| [:element, :x, :y, :duration].include? k }
      args = args_with_ele_ref(args)
      chain_method(:longPress, args) # longPress is what the appium server expects
    end

    # Press a finger onto the screen.  Finger will stay down until you call
    # `release`.
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to press within.
    # @option opts [integer] :x x co-ordinate to press on
    # @option opts [integer] :y y co-ordinate to press on
    def press(opts)
      args = opts.select { |k, _v| [:element, :x, :y].include? k }
      args = args_with_ele_ref(args)
      chain_method(:press, args)
    end

    # Remove a finger from the screen.
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to release from.
    # @option opts [integer] :x x co-ordinate to release from
    # @option opts [integer] :y y co-ordinate to release from
    def release(opts = nil)
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
      opts[:count] ||= 1
      args = args_with_ele_ref opts
      chain_method(:tap, args)
    end

    # Pause for a number of milliseconds before the next action
    # @param milliseconds [integer] Number of milliseconds to pause for
    def wait(milliseconds)
      args = { ms: milliseconds }
      chain_method(:wait, args)
    end

    # Convenience method to peform a swipe.
    #
    # Note that iOS 7 simulators have broken swipe.
    #
    # @option opts [int] :start_x Where to start swiping, on the x axis.  Default 0.
    # @option opts [int] :start_y Where to start swiping, on the y axis.  Default 0.
    # @option opts [int] :end_x Where to end swiping, on the x axis.  Default 0.
    # @option opts [int] :end_y Where to end swiping, on the y axis.  Default 0.
    # @option opts [int] :duration How long the actual swipe takes to complete in milliseconds.
    def swipe(opts)
      start_x  = opts.fetch :start_x, 0
      start_y  = opts.fetch :start_y, 0
      end_x    = opts.fetch :end_x, 0
      end_y    = opts.fetch :end_y, 0
      duration = opts[:duration]

      press x: start_x, y: start_y
      wait(duration) if duration
      move_to x: end_x, y: end_y
      release
      self
    end

    # Ask the driver to perform all actions in this action chain.
    def perform
      $driver.touch_actions @actions
      self
    end

    # Does nothing, currently.
    def cancel
      @actions << { action: cancel }
      $driver.touch_actions @actions
      self
    end

    private

    def chain_method(method, args = nil)
      if args
        @actions << { action: method, options: args }
      else
        @actions << { action: method }
      end
      self
    end

    def args_with_ele_ref(args)
      args[:element] = args[:element].ref if args.key? :element
      args
    end
  end # class TouchAction
end # module Appium
