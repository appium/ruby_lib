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

class IosTest
  class Common
    class Version < Minitest::Test
      def test_01_before_first
        assert_equal screen, catalog
      end

      def test_02_appium_version
        assert_match(/(\d+)\.(\d+).(\d+)/, ::Appium::VERSION)
      end

      def test_03_appium_date
        assert_match(/(\d+)-(\d+)-(\d+)/, ::Appium::DATE)
      end
    end
  end
end
