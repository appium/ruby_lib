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
  #   swipe(start_x: 75, start_y: 500, end_x: 75, end_y: 20, duration: 500)
  #
  # If you'd like to perform the chain with an arbitrary driver:
  #
  # @example
  #
  #   driver =  Appium::Driver.new(opts, false).start_driver # return an Appium::Core::Base::Driver instance
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
          ta = ::Appium::TouchAction.new($driver)
          ta.send(action, opts)
          return ta unless auto_perform

          ta.perform
        end
      end
    end

    def initialize(driver = $driver)
      super driver
    end

    def swipe(opts)
      start_x = opts.fetch :start_x, 0
      start_y = opts.fetch :start_y, 0
      end_x = opts.fetch :end_x, 0
      end_y = opts.fetch :end_y, 0
      duration = opts.fetch :duration, 200

      super(start_x: start_x, start_y: start_y, end_x: end_x, end_y: end_y, duration: duration)
    end
  end # class TouchAction
end # module Appium
