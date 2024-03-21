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

# rake "android[android/element/button]"
class AndroidTest
  class Element
    class Button < Minitest::Test
      def before_first
        # nav to buttons activity
        wait { find('App').click }
        wait { find('Activity').click }
        wait { find('Animation').click }
      end

      def after_last
        # nav back to home activity
        3.times { back }
      end

      def fade_in
        'Fade in'
      end

      def test_01_before_first
        before_first
      end

      def test_02_button
        # by index
        2.times { wait { assert_equal button(1).text.upcase, fade_in.upcase } }

        # by name contains
        wait { assert_equal button('ade').text.upcase, fade_in.upcase }
      end

      def test_03_buttons
        exp = ['ZOOM IN', 'MODERN ZOOM IN', 'THUMBNAIL ZOOM']
        wait { assert_equal buttons('zoom').map(&:text).map(&:upcase), exp }
        wait { assert_equal buttons.length, 6 }
      end

      def test_04_first_button
        wait { assert_equal first_button.text.upcase, fade_in.upcase }
      end

      def test_05_last_button
        wait { assert_equal last_button.text.upcase, 'THUMBNAIL ZOOM' }
      end

      def test_06_button_exact
        wait { assert_equal button_exact(fade_in).text.upcase, fade_in.upcase }
      end

      def test_07_buttons_exact
        2.times { wait { assert_equal buttons_exact(fade_in).first.text.upcase, fade_in.upcase } }
      end

      def test_08_after_last
        after_last
      end
    end
  end
end
