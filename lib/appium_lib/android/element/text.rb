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
    TEXT_VIEW = 'android.widget.TextView'
    TextView = TEXT_VIEW

    # Find the first TextView that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the TextView at that index is returned.
    # @return [TextView]
    def text(value)
      return ele_index TEXT_VIEW, value if value.is_a? Numeric

      complex_find_contains TEXT_VIEW, value
    end

    # Find all TextViews containing value.
    # If value is omitted, all texts are returned.
    # @param value [String] the value to search for
    # @return [Array<TEXT_VIEW>]
    def texts(value = false)
      return tags TEXT_VIEW unless value

      complex_finds_contains TEXT_VIEW, value
    end

    # Find the first TextView.
    # @return [TEXT_VIEW]
    def first_text
      first_ele TEXT_VIEW
    end

    # Find the last TextView.
    # @return [TEXT_VIEW]
    def last_text
      last_ele TEXT_VIEW
    end

    # Find the first TextView that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TEXT_VIEW]
    def text_exact(value)
      complex_find_exact TEXT_VIEW, value
    end

    # Find all TextViews that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TEXT_VIEW>]
    def texts_exact(value)
      complex_finds_exact TEXT_VIEW, value
    end
  end # module Android
end # module Appium
