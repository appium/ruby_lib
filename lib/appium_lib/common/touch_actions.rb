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
  #   action = TouchAction.new.press(x: 45, y: 100).wait(5).release
  #   action.perform(@driver)
  #   action = TouchAction.new.swipe(....)
  #   action.perform(@driver)
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
  end # class TouchAction
end # module Appium
