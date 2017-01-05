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
    ACTIONS         = [:move_to, :long_press, :double_tap, :two_finger_tap, :press, :release, :tap, :wait, :perform].freeze
    COMPLEX_ACTIONS = [:swipe].freeze

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
    # Alternatively, you can use `press(...).wait(...).release()` instead of `long_press` if duration doesn't work well.
    # https://github.com/appium/ruby_lib/issues/231#issuecomment-269895512
    # e.g. Appium::TouchAction.new.press(x: 280, y: 530).wait(2000).release.perform
    #
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

    # Touch a point on the screen.
    # Alternatively, you can use `press(...).release.perform` instead of `tap(...).perform`.
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

    # Double tap an element on the screen
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to restrict scope too.
    # @option opts [integer] :x x co-ordinate to tap
    # @option opts [integer] :y y co-ordinate to tap

    def double_tap(opts)
      args = opts.select { |k, _v| [:element, :x, :y].include? k }
      args = args_with_ele_ref(args)
      chain_method(:doubleTap, args) # doubleTap is what the appium server expects
    end

    # Two finger tap an element on the screen
    #
    # @option opts [WebDriver::Element] :element (Optional) Element to restrict scope too.
    # @option opts [integer] :x x co-ordinate to tap
    # @option opts [integer] :y y co-ordinate to tap
    def two_finger_tap(opts)
      args = opts.select { |k, _v| [:element, :x, :y].include? k }
      args = args_with_ele_ref(args)
      chain_method(:twoFingerTap, args) # twoFingerTap is what the appium server expects
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
    # @option opts [int] :delta_x The distance from start to move, on the x axis.  Default 0.
    # @option opts [int] :delta_y The distance from start to move, on the y axis.  Default 0.
    # @option opts [int] :duration How long the actual swipe takes to complete in milliseconds. Default 200.
    # @deprecated Please do not use end_x, end_y anymore
    def swipe(opts, ele = nil)
      start_x  = opts.fetch :start_x, 0
      start_y  = opts.fetch :start_y, 0
      delta_x  = opts.fetch :delta_x, nil
      delta_y  = opts.fetch :delta_y, nil
      end_x    = opts.fetch :end_x, nil
      end_y    = opts.fetch :end_y, nil

      if end_x || end_y
        warn '[DEPRECATION] `end_x` and `end_y` are deprecated. Please use `delta_x` and `delta_y` instead.'
      end

      delta_x ||= end_x
      delta_y ||= end_y

      delta_x ||= 0
      delta_y ||= 0

      duration = opts.fetch :duration, 200

      if ele # pinch/zoom for XCUITest
        press x: start_x, y: start_y, element: ele
        move_to x: start_x + delta_x, y: start_y + delta_y, element: ele
      else
        press x: start_x, y: start_y
        wait(duration) if duration
        move_to x: start_x + delta_x, y: start_y + delta_y
      end
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
      action = args ? { action: method, options: args } : { action: method }
      @actions << action
      self
    end

    def args_with_ele_ref(args)
      args[:element] = args[:element].ref if args.key? :element
      args
    end
  end # class TouchAction
end # module Appium
