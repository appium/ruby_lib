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

# rake "ios[ios/element/textfield]"
class IosTest
  class Element
    class Textfield < Minitest::Test
      def enter_text
        'Placeholder text'
      end

      def enter_password
        'Placeholder text'
      end

      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        go_to_textfields
      end

      def test_02_textfield
        assert_equal textfield(1).text, enter_text
        assert_equal textfield(enter_text).text, enter_text
        assert_equal textfield('holder').value, enter_password
      end

      def test_03_textfields
        values = textfields('text').map(&:value)
        assert_equal values.include?(enter_text), true
        assert_equal values.include?(enter_password), true # secure as well
        assert_equal textfields.length, 5
      end

      def test_04_predicate_textfields
        textfields = find_elements(:predicate, "type contains[c] 'textfield'")
        assert_equal textfields.length, 5
      end

      def test_05_first_textfield
        assert_equal first_textfield.text, enter_text
      end

      def test_06_last_textfield
        assert_equal last_textfield.text, enter_text
      end

      def test_07_textfield_exact
        assert_equal textfield_exact(enter_password).value, enter_password
      end

      def test_08_textfields_exact
        assert_equal textfields_exact(enter_password).first.value, enter_password
      end

      def test_09_textfield_type
        textfield(1).send_keys "o'k"

        assert_equal find_exact("o'k").text, "o'k"
      end

      def test_10_hide_keyboard
        first_textfield.click
        hide_keyboard
      end

      # test textfield methods with no textfields

      def test_11_leave_textfields
        set_wait 1
        leave_textfields
      end

      def test_12_no_textfield
        assert_raises(Selenium::WebDriver::Error::NoSuchElementError) { textfield(1) }
        assert_raises(Selenium::WebDriver::Error::NoSuchElementError) { textfield('does not exist') }
      end

      def test_13_no_textfields
        assert_equal textfields('does not exist').length, 0
      end

      def test_14_no_first_textfield
        assert_raises(Selenium::WebDriver::Error::NoSuchElementError) { first_textfield }
      end

      def test_15_no_last_textfield
        assert_raises(Selenium::WebDriver::Error::NoSuchElementError) { last_textfield }
      end

      def test_16_no_textfield_exact
        assert_raises(Selenium::WebDriver::Error::NoSuchElementError) { textfield_exact('does not exist') }
      end

      def test_17_no_textfields_exact
        assert_equal textfields_exact('does not exist').length, 0
      end

      def test_18_after_last
        set_wait 30
      end
    end
  end
end
