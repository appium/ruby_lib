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

# rake "ios[ios/element/text]"
class IosTest
  class Ios
    class Element
      class Text < Minitest::Test
        def ui_catalog
          'UICatalog'
        end

        def uiview_steppers
          'Steppers'
        end

        def test_01_before_first
          assert_equal screen, catalog
        end

        def test_02_first_text
          assert_equal first_text.text, ui_catalog
        end

        def test_03_last_text
          expected = 'Steppers'

          assert_equal last_text.text, expected
          assert_equal last_text.name, expected
        end

        def test_04_text
          assert_equal text('epp').text, uiview_steppers
          assert_equal text(1).text, ui_catalog
          assert_equal text('epp').name, uiview_steppers
        end

        def test_05_texts
          exp = ['Date Picker', 'AAPLDatePickerController', 'Picker View', 'AAPLPickerViewController']
          assert_equal texts.length, 24
          assert_equal texts('icker').map(&:name), exp
          assert_equal texts('AAPL').length, 11
        end

        def test_06_text_exact
          # should fail
          set_wait 0
          act = begin
            text_exact 'mos'
          rescue StandardError
            # nop
          end
          assert act.nil?
          set_wait

          # should pass
          assert_equal text_exact(ui_catalog).text, ui_catalog
        end

        def test_07_texts_exact
          assert_equal texts_exact('UICatalog').length, 1
        end
      end
    end
  end
end
