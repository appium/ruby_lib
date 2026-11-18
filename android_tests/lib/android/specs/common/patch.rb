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

# Skip:
#   status # status patches are already tested in driver.rb
#   execute # debug output for Pry

# rake "android[common/patch]"
class AndroidTest
  class Common
    class Patch < Minitest::Test
      include AndroidTestNavigation

      def setup
        super
        reset_test_app
        wait_true { text_exact('API Demos').displayed? }
      end

      def teardown
        reset_test_app
      ensure
        super
      end

      # Attributes are busted in Android.
      # Blocked on https://github.com/appium/appium/issues/628

      # Android supports exactly two string Attributes
      # .name and .text
      # https://github.com/appium/appium/blob/ea3450e7f78d1794bab42fa396a387e7b86fd3b3/android/bootstrap/src/io/appium/android/bootstrap/handler/GetAttribute.java#L43
      # def test_01_value' do; end # Doesn't work on And

      def test_01_element_method_name
        wait { assert_equal first_text.text, 'API Demos' }
      end

      # def test_01_tag_name' do; end # Doesn't work on And

      def test_02_element_method_rect
        wait do
          rect = first_text.rect
          assert_kind_of Numeric, rect.x
          assert_kind_of Numeric, rect.y
        end
      end

      # By default, the webdriver gem will return message instead of origValue
      def test_03_common_patch_id_error_message
        value = ''
        previous_wait = driver.manage.timeouts.implicit_wait
        begin
          set_wait 0
          find_element(:id, 'ok')
        rescue StandardError => e
          value = e.message
        ensure
          set_wait previous_wait
        end
        exp = 'An element could not be located on the page using the given search parameters.'
        assert value.start_with? exp
      end

      def test_04_id_common_patch_success
        wait do
          expected = find_element(:id, 'android:id/text1')
          assert_equal expected, id('android:id/text1')
        end
      end

      def test_05_find_many_elements_by_resource_id
        wait(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError]) do
          value = find_elements(:id, 'android:id/text1').length
          assert_equal 12, value
        end
      end

      def test_06_find_single_element_by_resource_id
        wait(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError]) do
          value = id('android:id/text1').text
          assert_equal "Access'ibility", value
        end
      end
    end
  end
end
