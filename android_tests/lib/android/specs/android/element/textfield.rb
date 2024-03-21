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

# rake "android[android/element/textfield]"
class AndroidTest
  class Element
    class TextField < Minitest::Test
      def must_raise_no_element
        assert_raises Selenium::WebDriver::Error::NoSuchElementError do
          yield
        end
      end

      def left
        'Left is best'
      end

      def right
        'Right is always right'
      end

      def before_first
        # nav to activity
        wait { find('app').click }
        wait { find('activity').click }
        wait { find('custom title').click }
      end

      def after_last
        # back to start
        3.times { back }
      end

      def test_01_before_test
        before_first
      end

      def test_02_textfield
        wait { assert_equal textfield(1).text, left }
        wait { assert_equal textfield('right').text, right }
      end

      def test_03_textfields
        wait { assert_equal textfields('right').first.text, right }
        wait { assert_equal textfields.length, 2 }
      end

      def test_04_first_textfield
        wait { assert_equal first_textfield.text, left }
      end

      def test_05_last_textfield
        wait { assert_equal last_textfield.text, right }
      end

      def test_06_textfield_exact
        must_raise_no_element { textfield_exact 'zz' }
        wait { assert_equal textfield_exact(left).text, left }
      end

      def test_07_textfields_exact
        wait { assert_equal textfields_exact('zz'), [] }
        wait { assert_equal textfields_exact(left).first.text, left }
      end

      def test_08_hide_keyboard
        first_textfield.click
        hide_keyboard
      end

      def test_09_after_last
        after_last
      end
    end
  end
end
