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

# rake "android[android/element/text]"
class AndroidTest
  class Element
    class Text < Minitest::Test
      def must_raise_no_element
        assert_raises Selenium::WebDriver::Error::NoSuchElementError do
          yield
        end
      end

      def test_01_text
        wait { assert ['API Demos', "Access'ibility"].include? text(1).text }
        wait { assert_equal text('mos').text, 'API Demos' }
      end

      def test_02_texts
        wait { assert_equal texts('i').length, 7 }
        wait { assert_equal texts.length, 13 }
      end

      def test_03_first_text
        wait { assert ['API Demos', "Access'ibility"].include? first_text.text }
      end

      def test_04_last_text
        wait { assert ['API Demos', 'Views'].include? last_text.text }
      end

      def test_05_text_exact
        must_raise_no_element { text_exact 'mos' }

        # should pass
        wait { assert_equal text_exact('API Demos').text, 'API Demos' }
      end

      def test_06_texts_exact
        wait { assert_equal texts_exact('API Demos').length, 1 }
      end
    end
  end
end
