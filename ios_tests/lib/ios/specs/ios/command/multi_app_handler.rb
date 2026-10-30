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
        include IosTestNavigation

        def test_multi_app_handler
          test_app_bundle = target_bundle_id

          assert_equal :running_in_foreground, xcuitest_query_app_status(bundle_id: test_app_bundle)

          assert_equal true, xcuitest_terminate_app(bundle_id: test_app_bundle)
          assert_equal :not_running, xcuitest_query_app_status(bundle_id: test_app_bundle)

          assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
          assert_equal :running_in_foreground, xcuitest_query_app_status(bundle_id: test_app_bundle)

          assert xcuitest_activate_app(bundle_id: 'com.apple.Preferences').nil?
          wait(timeout: 5) do
            # iOS may suspend the background app before we observe its state.
            assert_includes %i[running_in_background running_in_background_suspended],
                            xcuitest_query_app_status(bundle_id: test_app_bundle)
          end

          assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
          wait(timeout: 5) do
            assert_equal :running_in_foreground, xcuitest_query_app_status(bundle_id: test_app_bundle)
          end
        end
      end
    end
  end
end
