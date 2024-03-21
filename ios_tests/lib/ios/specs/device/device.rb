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

# $ rake "ios[device/device]"

class IosTest
  class Device
    class Device < Minitest::Test
      # go back to the main page
      def go_back
        back
        wait { find_ele_by_predicate_include(class_name: ui_ios.navbar, value: 'UICatalog') }
      end

      def test_01_before_first
        assert_equal screen, catalog
      end

      def test_02_app_installed
        installed = app_installed? 'Derrp'
        assert_equal installed, false
      end

      def test_03_background_app_homescreen
        bundle_id = 'com.example.apple-samplecode.UICatalog'

        background_app(-1) # background_app(nil) should work as same.

        # The app goes to background and never come back
        wait do
          assert_equal driver.app_state(bundle_id), :running_in_background_suspended
        end

        driver.activate_app bundle_id
      end

      def test_04_app_strings
        assert_includes app_strings, 'A Short Title Is Best'
        assert_includes app_strings('en'), 'A Short Title Is Best'
      end

      def test_05_action_chain
        element = text('Buttons')
        one_finger_tap x: 0, y: 0, element: element

        wait { button 'UICatalog' } # successfully transitioned to buttons page
        go_back
      end

      def test_06_swipe
        action.move_to_location(75, 500).pointer_down(:left)
              .move_to_location(75, 20).release.perform
      end
    end
  end
end
