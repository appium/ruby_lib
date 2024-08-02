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

# rake "ios[ios/command/multi_app_handler]"
class IosTest
  class Ios
    class Command
      class MultiAppHandler < Minitest::Test
        # Only for Xcode 9+
        def test_multip_app_handler
          driver.terminate_app target_bundle_id
          driver.activate_app target_bundle_id

          test_app_bundle = target_bundle_id

          assert_equal xcuitest_query_app_status(bundle_id: test_app_bundle), :running_in_foreground

          assert_equal xcuitest_terminate_app(bundle_id: test_app_bundle), true
          assert_equal xcuitest_query_app_status(bundle_id: test_app_bundle), :not_running

          assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
          assert_equal xcuitest_query_app_status(bundle_id: test_app_bundle), :running_in_foreground

          assert xcuitest_activate_app(bundle_id: 'com.apple.Preferences').nil?
          wait(timeout: 5) do
            assert_equal xcuitest_query_app_status(bundle_id: test_app_bundle), :running_in_background_suspended
          end

          assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
          wait(timeout: 5) do
            assert_equal xcuitest_query_app_status(bundle_id: test_app_bundle), :running_in_foreground
          end
        end
      end
    end
  end
end
