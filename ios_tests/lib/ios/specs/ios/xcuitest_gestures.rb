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
      def open_alert_ok_cancel
        wait_true do
          find_element(:name, 'Okay / Cancel').click
          find_element(:name, 'A Short Title Is Best').displayed?
        end
      end

      def open_alert_custom
        wait_true do
          find_element(:name, 'Other').click
          find_element(:name, 'A Short Title Is Best').displayed?
        end
      end

      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        assert_equal screen, catalog
      end

      def test_02_tap
        element = text('controls')
        one_finger_tap x: 0, y: 0, element: element

        back_click

        element = text('controls')
        rect = element.rect
        one_finger_tap x: rect.x + rect.width / 2, y: rect.y + rect.height / 2
      end

      def test_03_double_tap
        element = button('Search')
        double_tap(element: element)
      end

      def test_04_touch_and_hold
        element = button('Tools')
        touch_and_hold(element: element, duration: 4.0)
        touch_and_hold(x: 100, y: 100)
      end

      def test_05_swipe
        swipe direction: 'down'
        swipe direction: 'down'

        assert_raises Selenium::WebDriver::Error::NoSuchElementError do
          text('Toolbars')
        end
      end

      def test_06_drag_from_to_for_duration
        drag_from_to_for_duration from_x: 100, from_y: 100, to_x: 100, to_y: 400
      end

      def test_07_pinch
        pinch(scale: 0.5, velocity: -1)
      end

      def test_08_back_to_top
        back_click
      end

      def test_09_select_picker_wheel
        element = text('Picker View')
        one_finger_tap x: 0, y: 0, element: element

        e = find_element :class, ui_ios.picker_wheel
        previous_value = e.text
        select_picker_wheel(element: e, order: 'next')

        current_element = find_element(:class, ui_ios.picker_wheel)
        assert_equal current_element.displayed?, true
        assert current_element.text != previous_value
      end

      def test_10_back_to_top
        back_click
      end

      def test_11_alert
        wait_true do
          find_element(:name, 'Alert Views').click
          tag(ui_ios.navbar).name == 'Alert Views'
        end

        open_alert_ok_cancel
        alert action: 'accept'

        open_alert_ok_cancel
        alert action: 'dismiss'

        open_alert_custom
        list = alert action: 'getButtons'
        assert_equal list, ['Choice One', 'Choice Two', 'Cancel']
        alert action: 'accept', button_label: 'Choice Two'
      end

      def test_12_back_to_top
        back_click
      end

      def test_13_after_last
        assert_equal screen, catalog
      end
    end
  end
end
