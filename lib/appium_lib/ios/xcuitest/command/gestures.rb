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
  module Ios
    module Xcuitest
      module Gesture
        # @param [string] direction Either 'up', 'down', 'left' or 'right'.
        # @option opts [Element] :element Element to swipe on
        #
        #   ```ruby
        #   swipe direction: "down"
        #   ```
        def swipe(direction:, element: nil)
          args = { direction: direction }
          args[:element] = element.ref if element

          @driver.execute_script 'mobile: swipe', args
        end

        # @param [string] direction Either 'up', 'down', 'left' or 'right'.
        # @option opts [Double] :distance scroll distance, proportional to scroll view height.
        #   the value is supposed to be in between 0.0 and 1.0.
        # @option opts [String] :name the accessibility id of the child element, to which scrolling is performed.
        # @option opts [Element] :element Element id to long tap on.
        # @option opts [bool] :to_visible Boolean parameter. If set to true then asks to scroll to the first visible
        #   element in the parent container. Has no effect if element is not set
        # @option opts [String] :predicate_string the NSPredicate locator of the child element,
        #   to which the scrolling should be performed. Has no effect if element is not a container
        #
        #   ```ruby
        #   scroll direction: "down"
        #   ```
        # rubocop:disable Metrics/ParameterLists
        def scroll(direction:, distance: nil, name: nil, element: nil, to_visible: nil, predicate_string: nil)
          return 'Set "up", "down", "left" or "right" for :direction' unless %w(up down left right).include?(direction)

          args = { direction: direction }
          args[:element] = element.ref if element
          args[:distance] = distance if distance
          args[:name] = name if name
          args[:toVisible] = to_visible if to_visible
          args[:predicateString] = predicate_string if predicate_string

          @driver.execute_script 'mobile: scroll', args
        end
        # rubocop:enable Metrics/ParameterLists

        # @param scale [scale] X tap coordinate of type float. Mandatory parameter
        # @param velocity [float] Y tap coordinate of type float. Mandatory parameter
        # @option opts [Element] :element Element id to long tap on.
        #
        #   ```ruby
        #   pinch scale: 0.5, velocity: -1
        #   ```
        def pinch(scale:, velocity: 1.0, element: nil)
          args = { scale: scale, velocity: velocity }
          args[:element] = element.ref if element

          @driver.execute_script 'mobile: pinch', args
        end

        # @param x [float] X Screen x tap coordinate of type float. Mandatory parameter only if element is not set
        # @param y [float] Y Screen y tap coordinate of type float. Mandatory parameter only if element is not set
        # @option opts [Element] :element Element to long tap on.
        #
        #   ```ruby
        #   double_tap x: 100, y: 100
        #   double_tap element: find_element(:accessibility_id, "some item")
        #   ```
        def double_tap(x: nil, y: nil, element: nil) # rubocop:disable Naming/UncommunicativeMethodParamName
          return 'Set x, y or element' if (x.nil? || y.nil?) && element.nil?

          args = element.nil? ? { x: x, y: y } : { element: element.ref }
          @driver.execute_script 'mobile: doubleTap', args
        end

        # @param x [float] Screen x long tap coordinate of type float. Mandatory parameter only if element is not set
        # @param y [float] Screen y long tap coordinate of type float. Mandatory parameter only if element is not set
        # @param duration [Float] The float duration of press action in seconds. Mandatory parameter
        # @option opts [Element] :element The internal element identifier (as hexadecimal hash string) to long tap on
        #
        #   ```ruby
        #   touch_and_hold x: 100, y: 100
        #   touch_and_hold x: 100, y: 100, duration: 2.0
        #   touch_and_hold element: find_element(:accessibility_id, "some item")
        #   ```
        def touch_and_hold(x: nil, y: nil, element: nil, duration: 1.0) # rubocop:disable Naming/UncommunicativeMethodParamName
          return 'Set x, y or element' if (x.nil? || y.nil?) && element.nil?

          args = element.nil? ? { x: x, y: y } : { element: element.ref }
          args[:duration] = duration
          @driver.execute_script 'mobile: touchAndHold', args
        end

        # @param [Element] element Element to long tap on.
        #
        #   ```ruby
        #   two_finger_tap element: find_element(:accessibility_id, "some item")
        #   ```
        def two_finger_tap(element:)
          args = { element: element.ref }
          @driver.execute_script 'mobile: twoFingerTap', args
        end

        # @param x [float] X tap coordinate of type float. Mandatory parameter
        # @param y [float] Y tap coordinate of type float. Mandatory parameter
        # @option opts [Element] :element Element id to long tap on. x and y tap coordinates will be calculated
        #   relatively to the current element position on the screen if this argument is provided.
        #   Otherwise they should be calculated relatively to screen borders.
        #
        #   ```ruby
        #   tap x: 100, y: 100
        #   tap x: 100, y: 100, element: find_element(:accessibility_id, "some item")
        #   ```
        def tap(x:, y:, element: nil) # rubocop:disable Naming/UncommunicativeMethodParamName
          args = { x: x, y: y }
          args[:element] = element.ref if element
          @driver.execute_script 'mobile: tap', args
        end

        # rubocop:disable Metrics/ParameterLists
        # @param duration [float] Float number of seconds in range [0.5, 60]. How long the tap gesture at starting
        #   drag point should be before to start dragging. Mandatory parameter
        # @param from_x [float] The x coordinate of starting drag point (type float). Mandatory parameter
        # @param from_y [float] The y coordinate of starting drag point (type float). Mandatory parameter
        # @param to_x [float] The x coordinate of ending drag point (type float). Mandatory parameter
        # @param to_y [float] The y coordinate of ending drag point (type float). Mandatory parameter
        # @option opts [Element] :element  Element id to perform drag on. All the coordinates will be calculated
        #   relatively this this element position on the screen. Absolute screen coordinates are expected
        #   if this argument is not set
        #
        #   ```ruby
        #   drag_from_to_for_duration from_x: 100, from_y: 100, to_x: 150, to_y: 150
        #   ```
        def drag_from_to_for_duration(from_x:, from_y:, to_x:, to_y:, duration: 1.0, element: nil)
          args = { fromX: from_x, fromY: from_y, toX: to_x, toY: to_y, duration: duration }
          args[:element] = element.ref if element
          @driver.execute_script 'mobile: dragFromToForDuration', args
        end
        # rubocop:enable Metrics/ParameterLists

        # https://github.com/facebook/WebDriverAgent/pull/523
        # https://github.com/appium/appium-xcuitest-driver/pull/420
        # @param order [String] The order to move picker to. "next" or "previous".
        # @param element [Element]  Element id to perform select picker wheel on.
        # @option opts [Integer] :offset The value in range [0.01, 0.5]. Default is 0.2 in server side.
        #   https://github.com/facebook/WebDriverAgent/pull/549/files
        #
        #   ```ruby
        #   select_picker_wheel order: "next", element: find_element(:accessibility_id, "some picker")
        #   ```
        def select_picker_wheel(element:, order:, offset: nil)
          return 'Set "next" or "previous" for :order' unless %w(next previous).include?(order)

          args = { element: element.ref, order: order }
          args[:offset] = offset if offset
          @driver.execute_script 'mobile: selectPickerWheelValue', args
        end

        # @param action [String] The following actions are supported: accept, dismiss and getButtons. Mandatory parameter
        # @param button_label [String] The label text of an existing alert button to click on.
        #   This is an optional parameter and is only valid in combination with accept and dismiss actions.
        # @return {} or Selenium::WebDriver::Error::NoSuchAlertError if no action sheet or alert
        #   or button labels if action is equal to getButtons.
        #
        #   ```ruby
        #   alert action: "accept"
        #   alert action: "dismiss"
        #   ```
        def alert(action:, button_label: nil)
          return 'Set "accept", "dismiss" or "getButtons" for :action' unless %w(accept dismiss getButtons).include?(action)

          args = { action: action }
          args[:button_label] if button_label
          @driver.execute_script 'mobile: alert', args
        end
      end # module Gesture
    end # module Xcuitest
  end # module Ios
end # module Appium
