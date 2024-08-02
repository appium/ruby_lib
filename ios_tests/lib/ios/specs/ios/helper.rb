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

# rake "ios[ios/helper]"
class IosTest
  class Ios
    class Helper < Minitest::Test
      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id

        assert_equal screen, catalog
      end

      def test_02_ios_password
        assert_equal ios_password, 8226.chr('UTF-8')
        assert_equal ios_password(2), 8226.chr('UTF-8') * 2
      end

      def test_03_page
        page # writes to std out
      end

      def test_04_id
        id 'Buttons' # 'Various uses of UIButton'
      end

      def test_05_platform_version
        assert !platform_version.empty?
      end

      def test_06_tags_include
        elements = tags_include class_names: %w(XCUIElementTypeTextView)
        assert_equal elements.length, 0

        elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
        assert_equal elements.length, 24

        elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'u'
        assert_equal elements.length, 3
      end

      def test_07_tags_exact
        elements = tags_exact class_names: %w()
        assert_equal elements.length, 0

        elements = tags_exact class_names: %w(XCUIElementTypeStaticText)
        assert_equal elements.length, 24

        elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
        assert_equal elements.length, 24

        elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'Buttons'
        assert_equal elements.length, 1
        assert_equal elements.first.value, 'Buttons'
      end
    end
  end
end
