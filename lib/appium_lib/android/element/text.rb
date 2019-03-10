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

# TextView methods
module Appium
  module Android
    TextView = 'android.widget.TextView'

    # Find the first TextView that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the TextView at that index is returned.
    # @return [TextView]
    def text(value)
      return ele_index TextView, value if value.is_a? Numeric

      complex_find_contains TextView, value
    end

    # Find all TextViews containing value.
    # If value is omitted, all texts are returned.
    # @param value [String] the value to search for
    # @return [Array<TextView>]
    def texts(value = false)
      return tags TextView unless value

      complex_finds_contains TextView, value
    end

    # Find the first TextView.
    # @return [TextView]
    def first_text
      first_ele TextView
    end

    # Find the last TextView.
    # @return [TextView]
    def last_text
      last_ele TextView
    end

    # Find the first TextView that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextView]
    def text_exact(value)
      complex_find_exact TextView, value
    end

    # Find all TextViews that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextView>]
    def texts_exact(value)
      complex_finds_exact TextView, value
    end
  end # module Android
end # module Appium
