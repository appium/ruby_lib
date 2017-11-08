module Appium
  # Perform a series of gestures, one after another.  Gestures are chained
  # together and only performed when `perform()` is called. Default is conducted by global driver.
  #
  # Each method returns the object itself, so calls can be chained.
  #
  # @example
  #
  #   action = TouchAction.new.press(x: 45, y: 100).wait(5).release
  #   action.perform
  #   action = TouchAction.new.swipe(....)
  #   action.perform
  #
  # Or each methods can call without `TouchAction.new` as the following.
  # In this case, `perform` is called automatically.
  #
  # @example
  #
  #   # called `swipe(...).perform` in this method.
  #   swipe(start_x: 75, start_y: 500, offset_x: 75, offset_y: 20, duration: 500)
  #
  # If you'd like to perform the chain with an arbitrary driver:
  #
  # @example
  #
  #   driver =  Appium::Driver.new(opts, false).start_driver
  #   action = TouchAction.new(driver).press(x: 45, y: 100).wait(5).release
  #   action.perform
  #   action = TouchAction.new(driver).swipe(....)
  #   action.perform
  #
  class TouchAction < ::Appium::Core::TouchAction
    COMPLEX_ACTIONS = ::Appium::Core::TouchAction::COMPLEX_ACTIONS

    class << self
      COMPLEX_ACTIONS.each do |action|
        define_method(action) do |opts|
          auto_perform = opts.delete(:auto_perform) { |_k| true }
          ta           = ::Appium::TouchAction.new($driver)
          ta.send(action, opts)
          return ta unless auto_perform
          ta.perform
        end
      end
    end

    def initialize(driver = $driver)
      super driver
    end

    def swipe(opts, ele = nil)
      start_x  = opts.fetch :start_x, 0
      start_y  = opts.fetch :start_y, 0
      offset_x = opts.fetch :offset_x, nil
      offset_y = opts.fetch :offset_y, nil
      end_x    = opts.fetch :end_x, nil
      end_y    = opts.fetch :end_y, nil
      duration = opts.fetch :duration, 200

      if end_x || end_y
        warn '[DEPRECATION] end_x and end_y will be removed. Please use offset_x and offset_y for all platform.'
        end_x ||= 0
        end_y ||= 0

        offset_x = end_x - start_x
        offset_y = end_y - start_y
      end

      super(start_x: start_x, start_y: start_y, offset_x: offset_x, offset_y: offset_y, duration: duration, ele: ele)
    end
  end # class TouchAction
end # module Appium
