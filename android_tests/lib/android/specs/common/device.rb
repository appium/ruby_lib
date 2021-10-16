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

# rake "android[common/device]"
describe 'common/device' do
  t 'get_performance_data_types' do
    expected = %w(batteryinfo cpuinfo memoryinfo networkinfo)
    get_performance_data_types.sort.must_equal expected

    get_performance_data(package_name: 'io.appium.android.apis',
                         data_type: 'cpuinfo')[0].must_equal %w(user kernel)
  end

  t 'start_activity' do
    wait { current_activity.must_equal '.ApiDemos' }
    start_activity app_package: 'io.appium.android.apis',
                   app_activity: '.accessibility.AccessibilityNodeProviderActivity'
    wait { current_activity.include?('Node').must_equal true }
    start_activity app_package: 'com.android.settings',
                   app_activity: '.Settings',
                   app_wait_package: 'com.android.settings',
                   app_wait_activity: '.Settings'
    wait { current_activity.include?('Settings').must_equal true }
  end

  t 'current_package' do
    start_activity app_package: 'io.appium.android.apis',
                   app_activity: '.accessibility.AccessibilityNodeProviderActivity'
    wait { current_package.must_equal 'io.appium.android.apis' }
  end

  t 'app_strings' do
    wait_true { app_strings.key? 'activity_save_restore' }
  end

  def must_return_element(element)
    element.class.must_equal ::Appium::Core::Element
  end

  t 'press_keycode' do
    # http://developer.android.com/reference/android/view/KeyEvent.html
    press_keycode 176
  end

  t 'long_press_keycode' do
    # http://developer.android.com/reference/android/view/KeyEvent.html
    long_press_keycode 176
  end
end
