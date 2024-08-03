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

# rake ios[ios/mobile_methods]
class IosTest
  class Ios
    class MobileMethods < Minitest::Test
      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        assert_equal screen, catalog
      end

      def test_02_an_element_with_class_chain
        element = find_element :class_chain, '**/XCUIElementTypeStaticText'

        assert_equal element.name, catalog
      end

      def test_03_elements_with_class_chain
        elements = find_elements :class_chain, 'XCUIElementTypeWindow/*/*'

        assert_equal elements.size, 2
        assert_equal elements[0].name, catalog
        assert elements[1].name.nil?
      end
    end
  end
end
