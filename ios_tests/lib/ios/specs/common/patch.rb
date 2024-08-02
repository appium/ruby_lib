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

#  Skip:
#    status # status patches are already tested in driver.rb
#    execute # debug output for Pry
#

# bundle exec rake "ios[common/patch]"
class IosTest
  class Common
    class Patch < Minitest::Test
      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        assert_equal screen, catalog
      end

      def test_02_appium_core_element_method_name
        assert_equal first_text.name, 'UICatalog'
      end

      def test_03_appium_core_element_method_location_rel
        loc = first_text.location_rel($driver)
        assert_equal loc.x.class, String
        assert_equal loc.y.class, String
      end
    end
  end
end
