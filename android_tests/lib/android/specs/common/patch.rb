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
      # Attributes are busted in Android.
      # Blocked on https://github.com/appium/appium/issues/628

      # Android supports exactly two string Attributes
      # .name and .text
      # https://github.com/appium/appium/blob/ea3450e7f78d1794bab42fa396a387e7b86fd3b3/android/bootstrap/src/io/appium/android/bootstrap/handler/GetAttribute.java#L43
      # def test_01_value' do; end # Doesn't work on And

      def test_01_element_method_name
        wait { first_text.text.must_equal 'API Demos' }
      end

      # def test_01_tag_name' do; end # Doesn't work on And

      def test_02_element_method_location_rel
        wait do
          loc = first_text.location_rel($driver)
          loc.x.class.must_equal String
          loc.y.class.must_equal String
        end
      end

      # By default, the webdriver gem will return message instead of origValue
      # {"message":"An unknown server-side error occurred while processing the command.","origValue":"Strategy id is not valid."}
      def test_03_common_patch_id error_message
        value = ''
        begin
          set_wait 0
          find_element(:id, 'ok')
        rescue StandardError => e
          value = e.message
        ensure
          set_wait 30
        end
        value = value.split("\n").first.strip
        exp   = 'An element could not be located on the page using the given search parameters.'
        value.must_equal exp
      end

      def test_04_id_common_patch_success
        if automation_name_is_uiautomator2?
          wait do
            el = text 'text' # <string name="autocomplete_3_button_7">Text</str
            el.text.must_equal 'Text'
          end
        else
          wait do
            el = id 'autocomplete_3_button_7' # <string name="autocomplete_3_button_7">Text</string>
            el.text.must_equal 'Text'
          end
        end
      end

      def test_05_find_many_elements_by_resource_id
        wait do
          value = find_elements(:id, 'android:id/text1').length
          value.must_equal 12
        end
      end

      def test_06_find_single_element_by_resource_id
        wait do
          value = id('android:id/text1').text
          value.must_equal "Access'ibility"
        end
      end
    end
  end
end
