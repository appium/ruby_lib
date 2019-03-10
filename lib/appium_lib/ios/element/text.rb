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

# UIAStaticText|XCUIElementTypeStaticText methods
module Appium
  module Ios
    UIA_STATIC_TEXT = 'UIAStaticText'
    UIAStaticText = UIA_STATIC_TEXT

    XCUIELEMENT_TYPE_STATIC_TEXT = 'XCUIElementTypeStaticText'
    XCUIElementTypeStaticText = XCUIELEMENT_TYPE_STATIC_TEXT

    # @return [String] Class name for text
    def static_text_class
      UIA_STATIC_TEXT
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.
    # @return [UIA_STATIC_TEXT|XCUIELEMENT_TYPE_STATIC_TEXT]
    def text(value)
      return ele_index static_text_class, value if value.is_a? Numeric

      ele_by_json_visible_contains static_text_class, value
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
    # If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<UIA_STATIC_TEXT|XCUIELEMENT_TYPE_STATIC_TEXT>]
    def texts(value = false)
      return tags static_text_class unless value

      eles_by_json_visible_contains static_text_class, value
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIA_STATIC_TEXT|XCUIELEMENT_TYPE_STATIC_TEXT]
    def first_text
      first_ele static_text_class
    end

    # Find the last UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIA_STATIC_TEXT|XCUIELEMENT_TYPE_STATIC_TEXT]
    def last_text
      last_ele static_text_class
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIA_STATIC_TEXT|XCUIElementTypeStaticText]
    def text_exact(value)
      ele_by_json_visible_exact static_text_class, value
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIA_STATIC_TEXT|XCUIElementTypeStaticText>]
    def texts_exact(value)
      eles_by_json_visible_exact static_text_class, value
    end
  end # module Ios
end # module Appium
