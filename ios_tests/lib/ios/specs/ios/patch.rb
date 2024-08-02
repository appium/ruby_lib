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

# rake "ios[ios/patch]"
class IosTest
  class Ios
    class MobileMethods < Minitest::Test
      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        assert_equal screen, catalog
        go_to_textfields
      end

      def test_02_label
        assert_equal textfields[0].label, ''
      end

      def test_03_type
        text('text fields').click

        ele = first_textfield

        ele.clear
        ele.type 'ok'
        assert_equal ele.text, 'ok'
      end

      def test_04_after_last
        leave_textfields
      end
    end
  end
end
