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

# $ rake ios[device/image_comparison]

class IosTest
  class Device
    class ImageComparison < Minitest::Test
      def test_image_comparison
        image1 = File.read './data/test_normal.png'
        image2 = File.read './data/test_has_blue.png'

        # Equal to `$driver.driver.find_image_occurrence`
        # Equal to `driver.find_image_occurrence`
        find_result = find_image_occurrence full_image: image1, partial_image: image2
        assert_equal({ 'rect' => { 'x' => 0, 'y' => 0, 'width' => 750, 'height' => 1334 } }, find_result)
      end
    end
  end
end
