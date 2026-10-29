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
class AndroidTest
  class Common
    class Device < Minitest::Test
      include AndroidTestNavigation

      def setup
        super
        reset_test_app
      end

      def teardown
        reset_test_app
      ensure
        super
      end

      def test_01_get_performance_data_types
        expected = %w(batteryinfo cpuinfo memoryinfo networkinfo)
        assert_equal expected, get_performance_data_types.sort
      end

      def test_01_get_performance_data
        # CPU samples may omit a newly started/idle app. Battery data exercises
        # the same client endpoint without depending on a process sampling window.
        data = get_performance_data(package_name: 'io.appium.android.apis', data_type: 'batteryinfo')
        assert_equal ['power'], data.fetch(0)
        assert_equal 1, data.fetch(1).length
        assert_includes 0..100, Integer(data.fetch(1).fetch(0))
      end

      def test_02_start_activity
        wait { assert_equal current_activity, '.ApiDemos' }
        start_test_activity('io.appium.android.apis/.accessibility.AccessibilityNodeProviderActivity')
        wait { assert_equal current_activity.include?('Node'), true }
        start_test_activity('com.android.settings/.Settings')
        wait { assert_equal current_activity.include?('Settings'), true }
      end

      def test_03_current_package
        start_test_activity('io.appium.android.apis/.accessibility.AccessibilityNodeProviderActivity')
        wait { assert_equal current_package, 'io.appium.android.apis' }
      end

      def test_04_app_strings
        wait_true { app_strings.key? 'activity_save_restore' }
      end

      def test_05_press_keycode
        # http://developer.android.com/reference/android/view/KeyEvent.html
        press_keycode 176
      end

      def test_06_long_press_keycode
        # http://developer.android.com/reference/android/view/KeyEvent.html
        long_press_keycode 176
      end
    end
  end
end
