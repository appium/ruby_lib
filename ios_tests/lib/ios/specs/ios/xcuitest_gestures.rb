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

# rake "ios[ios/xcuitest_gestures]"
class IosTest
  class Ios
    class XcuitestGestures < Minitest::Test
      include IosTestNavigation

      def open_screen(name)
        wait { find_element(:accessibility_id, name).click }
        wait_true { screen == name }
      end

      def open_alert(name)
        wait { find_element(:accessibility_id, name).click }
        wait_true { find_element(:name, 'A Short Title Is Best').displayed? }
      end

      def test_tap
        element = text_exact('Buttons')
        one_finger_tap x: element.rect.width / 2, y: element.rect.height / 2, element: element
        wait_true { screen == 'Buttons' }
        rect = button_exact('Button').rect
        one_finger_tap x: rect.x + rect.width / 2, y: rect.y + rect.height / 2
        assert_equal 'Buttons', screen
      end

      def test_double_tap
        open_screen 'Buttons'
        double_tap(element: button_exact('Button'))
        assert_equal 'Buttons', screen
      end

      def test_touch_and_hold
        open_screen 'Buttons'
        element = button_exact('Button')
        touch_and_hold(element: element, duration: 1.0)
        rect = element.rect
        touch_and_hold(x: rect.x + rect.width / 2, y: rect.y + rect.height / 2)
        assert_equal 'Buttons', screen
      end

      def test_swipe
        table = find_element(:class_name, ui_ios.table)
        2.times { swipe direction: 'up', element: table }
        wait_true { find_element(:accessibility_id, 'Toolbars').displayed? }
        2.times { swipe direction: 'down', element: table }
        wait_true { find_element(:accessibility_id, 'Activity Indicators').displayed? }
      end

      def test_drag_from_to_for_duration
        drag_from_to_for_duration from_x: 100, from_y: 100, to_x: 100, to_y: 400
        assert_equal catalog, screen
      end

      def test_pinch
        open_screen 'Image View'
        pinch(scale: 0.5, velocity: -1)
        assert_equal 'Image View', screen
      end

      def test_select_picker_wheel
        open_screen 'Picker View'
        element = find_element :class, ui_ios.picker_wheel
        previous_value = element.text
        select_picker_wheel(element: element, order: 'next')

        current_element = find_element(:class, ui_ios.picker_wheel)
        assert current_element.displayed?
        refute_equal previous_value, current_element.text
      end

      def test_alert
        open_screen 'Alert Views'
        open_alert 'Okay / Cancel'
        alert action: 'accept'

        open_alert 'Okay / Cancel'
        alert action: 'dismiss'

        open_alert 'Other'
        assert_equal ['Choice One', 'Choice Two', 'Cancel'], alert(action: 'getButtons')
        alert action: 'accept', button_label: 'Choice Two'
      end
    end
  end
end
