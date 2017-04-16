module Appium
  module Ios
    module XcuitestGesture
      # @param [string] direction Either 'up', 'down', 'left' or 'right'.
      # @option opts [Element] :element Element to swipe on
      #
      #   ```ruby
      #   swipe direction: "down"
      #   ```
      def swipe(direction:, element: nil)
        return unless %w(up down left right).include?(direction)

        args = { direction: direction }
        args[:element] = element.ref if element

        execute_script 'mobile: swipe', args
      end

      # @param [string] direction Either 'up', 'down', 'left' or 'right'.
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
      def scroll(direction:, name: nil, element: nil, to_visible: nil, predicate_string: nil)
        return 'Set "up", "down", "left" or "right" for :direction' unless %w(up down left right).include?(direction)

        args =  { direction: direction }
        args[:element] = element.ref if element
        args[:name] = name if name
        args[:toVisible] = to_visible if to_visible
        args[:predicateString] = predicate_string if predicate_string

        execute_script 'mobile: scroll', args
      end

      # @param scale [scale] X tap coordinate of type float. Mandatory parameter
      # @param velocity [float] Y tap coordinate of type float. Mandatory parameter
      # @option opts [Element] :element Element id to long tap on.
      #
      #   ```ruby
      #   pinch scale: 0.5, velocity: -1
      #   ```
      def pinch(scale:, velocity: 1.0, element: nil)
        return unless automation_name_is_xcuitest?

        args = { scale: scale, velocity: velocity }
        args[:element] = element.ref if element

        execute_script 'mobile: pinch', args
      end

      # @param x [float] X Screen x tap coordinate of type float. Mandatory parameter only if element is not set
      # @param y [float] Y Screen y tap coordinate of type float. Mandatory parameter only if element is not set
      # @option opts [Element] :element Element to long tap on.
      #
      #   ```ruby
      #   double_tap x: 100, y: 100
      #   double_tap element: find_element(:accessibility_id, "some item")
      #   ```
      def double_tap(x: nil, y: nil, element: nil)
        return 'require XCUITest(WDA)' unless automation_name_is_xcuitest?
        return 'Set x, y or element' if (x.nil? || y.nil?) && element.nil?

        args = element.nil? ? { x: x, y: y } : { element: element.ref }
        execute_script 'mobile: doubleTap', args
      end

      # @param [Element] :element Element to long tap on.
      #
      #   ```ruby
      #   two_finger_tap element: find_element(:accessibility_id, "some item")
      #   ```
      def two_finger_tap(element:)
        return 'require XCUITest(WDA)' unless automation_name_is_xcuitest?

        args = { element: element.ref }
        execute_script 'mobile: twoFingerTap', args
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
      def tap(x:, y:, element: nil)
        return 'require XCUITest(WDA)' unless automation_name_is_xcuitest?

        args = { x: x, y: y }
        args[:element] = element.ref
        execute_script 'mobile: tap', args
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
        return 'require XCUITest(WDA)' unless automation_name_is_xcuitest?

        args = { from_x: from_x, from_y: from_y, to_x: to_x, to_y: to_y, duration: duration }
        args[:element] = element if element
        execute_script 'mobile: dragFromToForDuration', args
      end
      # rubocop:enable Metrics/ParameterLists

      # https://github.com/facebook/WebDriverAgent/pull/523
      # https://github.com/appium/appium-xcuitest-driver/pull/420
      # @param order [String] The order to move picker to. "next" or "previous".
      # @param element [Element]  Element id to perform select picker wheel on.
      #
      #   ```ruby
      #   select_picker_wheel order: "next", element: find_element(:accessibility_id, "some picker")
      #   ```
      def select_picker_wheel(element:, order:)
        return 'require XCUITest(WDA)' unless automation_name_is_xcuitest?
        return 'Set "next" or "previous" for :order' unless %w(next previous).include?(order)

        args = { element: element.ref, order: order }
        execute_script 'mobile: selectPickerWheelValue', args
      end
    end # module XcuitestGesture
  end # module Ios
end # module Appium
