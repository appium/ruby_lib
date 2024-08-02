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

# rake "ios[ios/element/alert]"
class IosTest
  class Ios
    class Element
      class Alert < Minitest::Test
        def open_alert
          wait_true do
            find_element(:name, 'Okay / Cancel').click
            find_element(:name, 'A Short Title Is Best').displayed?
          end
        end

        def test_01_before
          driver.terminate_app target_bundle_id
          driver.activate_app target_bundle_id

          assert_equal screen, catalog
          wait_true do
            find_element(:name, 'Alert Views').click
            tag(ui_ios.navbar).name == 'Alert Views' # wait for true
          end
        end

        def test_02_alert_accept
          open_alert
          alert_accept
        end

        def test_03_alert_dismiss
          open_alert
          alert_dismiss
        end

        def test_04_after_last
          back_click
          assert screen == catalog
          sleep 1
        end
      end
    end
  end
end
