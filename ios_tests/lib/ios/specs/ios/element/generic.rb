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

# rake "ios[ios/element/generic]"
class IosTest
  class Ios
    class Element
      class Generic < Minitest::Test
        def uibutton_text
          'Buttons'
        end

        def verify(element)
          element = element.first if element.is_a? Array
          assert_equal element.name, uibutton_text
        end

        def test_01_before_first
          driver.terminate_app target_bundle_id
          driver.activate_app target_bundle_id

          assert_equal screen, catalog
        end

        def test_02_find
          verify find 'tons'
        end

        def test_03_finds
          verify finds 'tons'
        end

        def test_04_find_exact
          verify find_exact uibutton_text
        end

        def test_05_finds_exact
          elements = finds_exact uibutton_text
          assert_equal elements.is_a?(Array), true
          verify elements
        end
      end
    end
  end
end
