module Appium
  module Ios
    module XcuitestGesture
      # @param [string] direction Either 'up', 'down', 'left' or 'right'.
      # @option opts [Element] :element Element id to long tap on.
      def swipe(direction:, element: nil)
        return unless %w(up down left right).include?(direction)

        args = { direction: direction }
        args[:element] = element if element

        execute_script 'mobile: swipe', args
      end

      # @param [string] direction Either 'up', 'down', 'left' or 'right'.
      # @option opts [String] :name the accessibility id of the child element, to which scrolling is performed.
      # @option opts [Element] :element Element id to long tap on.
      # @option opts [bool] :to_visible Boolean parameter. If set to true then asks to scroll to the first visible
      #   element in the parent container. Has no effect if element is not set
      # @option opts [String] :predicate_string the NSPredicate locator of the child element,
      #   to which the scrolling should be performed. Has no effect if element is not a container
      def scroll(direction:, name: nil, element: nil, to_visible: nil, predicate_string: nil)
        return unless %w(up down left right).include?(direction)

        args =  { direction: direction }
        args[:element] = element if element
        args[:name] = name if name
        args[:toVisible] = to_visible if to_visible
        args[:predicateString] = predicate_string if predicate_string

        execute_script 'mobile: scroll', args
      end

      # @param scale [scale] X tap coordinate of type float. Mandatory parameter
      # @param velocity [float] Y tap coordinate of type float. Mandatory parameter
      # @option opts [Element] :element Element id to long tap on.
      def pinch(scale:, velocity: 1.0, element: nil)
        return unless automation_name_is_xcuitest?

        args = { scale: scale, velocity: velocity }
        args[:element] = element if element

        execute_script 'mobile: pinch', args
      end

      # @param x [float] X Screen x tap coordinate of type float. Mandatory parameter only if element is not set
      # @param y [float] Y Screen y tap coordinate of type float. Mandatory parameter only if element is not set
      # @option opts [Element] :element Element id to long tap on.
      def double_tap(x:, y:, element: nil)
        return unless automation_name_is_xcuitest?

        args = { x: x, y: y }
        args[:element] = element if element

        execute_script 'mobile: doubleTap', args
      end

      # @param [Element] :element Element id to long tap on.
      def two_finger_tap(element:)
        return unless automation_name_is_xcuitest?

        args = { element: element }

        execute_script 'mobile: twoFingerTap', args
      end

      # @param x [float] X tap coordinate of type float. Mandatory parameter
      # @param y [float] Y tap coordinate of type float. Mandatory parameter
      # @option opts [Element] :element Element id to long tap on.
      def tap(x:, y:, element: nil)
        return unless automation_name_is_xcuitest?

        args = { x: x, y: y }
        args[:element] = element if element

        execute_script 'mobile: tap', args
      end

      # rubocop:disable Metrics/ParameterLists
      # @param duration [float] Float number of seconds in range [0.5, 60]. How long the tap gesture at starting
      #   drag point should be before to start dragging. Mandatory parameter
      # @param from_x [float] The x coordinate of starting drag point (type float). Mandatory parameter
      # @param from_y [float] The y coordinate of starting drag point (type float). Mandatory parameter
      # @param to_x [float] The x coordinate of ending drag point (type float). Mandatory parameter
      # @param to_y [float] The y coordinate of ending drag point (type float). Mandatory parameter
      # @option opts [Element] :element Element id to long tap on.
      def drag_from_to_for_duration(from_x:, from_y:, to_x:, to_y:, duration: 1.0, element: nil)
        return unless automation_name_is_xcuitest?

        args = { from_x: from_x, from_y: from_y, to_x: to_x, to_y: to_y, duration: duration }
        args[:element] = element if element

        execute_script 'mobile: tap', args
      end
      # rubocop:enable Metrics/ParameterLists
    end
  end # module Ios
end # module Appium
