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

# rake "android[android/element/generic]"
class AndroidTest
  class Element
    class Generic < Minitest::Test
      def content
        'Content'
      end

      def partial
        'tent'
      end

      def test_01_find_works_before_and_after_get_source
        wait { assert_equal find(partial).text, content }
        wait { assert_equal get_source.class, String }
        wait { assert_equal find(partial).text, content }
      end

      def test_01_find
        wait { assert_equal find(partial).text, content }
      end

      def test_01_finds
        wait { assert_equal finds(partial).first.text, content }
      end

      def test_01_find_exact
        wait { assert_equal find_exact(content).text, content }
      end

      def test_01_finds_exact
        wait { assert_equal finds_exact(content).first.text, content }
      end

      # scroll_to is broken
      def test_01_scroll_to
        wait { scroll_to('Views').click }
        wait { assert_equal scroll_to('scrollbars').text, 'ScrollBars' }

        wait { find('ScrollBars').click }
        wait { text('style').click }
        wait { assert scroll_to('Developers', 1).text.include? 'What would it take to build a better mobile phone?' }
        back
        back
        # back to start activity
        back
      end

      def test_01_scroll_to_exact
        wait { scroll_to('Views').click }

        wait { assert_equal scroll_to_exact('ScrollBars').text, 'ScrollBars' }
        wait { find('ScrollBars').click }
        wait { text('style').click }
        back
        back
        # back to start activity
        back
      end
    end
  end
end
