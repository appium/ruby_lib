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

# rake "android[common/device_touchaction]"
class AndroidTest
  class Common
    class DeviceTouchAction < Minitest::Test
      def test_01_before_test
        wait { text('Accessibility') }
      end

      def test_02_action_chain_press_release
        wait do
          e = text('Accessibility')
          action.click(e).perform
        end
        wait { text('Custom View') }
        back
        wait { text_exact 'NFC' }
      end

      def test_03_action_chain_tap
        wait do
          e = text('Accessibility')
          action.click(e).perform
        end
        wait { text('Custom View') }
        back
        wait { text_exact 'NFC' }
      end

      def test_04_swipe
        wait { text('Animation').click }
        wait { text_exact('Bouncing Balls').click }

        driver.action
              .move_to_location(0.75, 0.25).pointer_down(:left)
              .move_to_location(0.75, 50)
              .release.perform

        3.times { back }
        wait { text_exact 'NFC' }
      end

      def test_05_pinch_zoom
        wait { text_exact 'NFC' }
        wait { text_exact('Graphics').click }
        wait { scroll_to('Touch Paint').click }

        # multiple action chains
        f1 = driver.action.add_pointer_input(:touch, 'finger1')
        f1.create_pointer_move(
          duration: 0.5, x: 500, y: 800,
          origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT
        )
        f1.create_pointer_down(:left)
        f1.create_pause(0.5)
        f1.create_pointer_move(
          duration: 3, x: 500, y: 700,
          origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT
        )
        f1.create_pointer_up(:left)

        f2 = driver.action.add_pointer_input(:touch, 'finger2')
        f2.create_pointer_move(
          duration: 0.5, x: 500, y: 800,
          origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT
        )
        f2.create_pointer_down(:left)
        f1.create_pause(0.5)
        f2.create_pointer_move(
          duration: 3, x: 500, y: 900,
          origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT
        )
        f2.create_pointer_up(:left)

        driver.perform_actions [f1, f2]

        wait { text('Graphics/Touch Paint') }
        2.times { back }
        wait { text_exact 'NFC' }
      end
    end
  end
end
