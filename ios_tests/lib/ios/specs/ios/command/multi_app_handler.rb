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
describe 'ios/command/source' do
  # Only for Xcode 9+
  it 'multip app handler' do
    test_app_bundle = 'com.example.apple-samplecode.UICatalog'

    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground

    xcuitest_terminate_app(bundle_id: test_app_bundle).must_equal true
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :not_running

    assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground

    assert xcuitest_activate_app(bundle_id: 'com.apple.Preferences').nil?
    wait(timeout: 5) do
      xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_background_suspended
    end

    assert xcuitest_activate_app(bundle_id: test_app_bundle).nil?
    wait(timeout: 5) do
      xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground
    end
  end
end
