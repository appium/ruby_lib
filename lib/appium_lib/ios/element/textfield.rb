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

module Appium
  module Ios
    UIA_TEXT_FIELD = 'UIATextField'
    UIATextField = UIA_TEXT_FIELD
    UIA_SECURE_TEXT_FIELD = 'UIASecureTextField'
    UIASecureTextField = UIA_SECURE_TEXT_FIELD

    XCUIELEMENT_TYPE_TEXT_FIELD = 'XCUIElementTypeTextField'
    XCUIElementTypeTextField = XCUIELEMENT_TYPE_TEXT_FIELD
    XCUIELEMENT_TYPE_SECURE_TEXT_FIELD = 'XCUIElementTypeSecureTextField'
    XCUIElementTypeSecureTextField = XCUIELEMENT_TYPE_SECURE_TEXT_FIELD

    # @return [String] Class name for text field
    def text_field_class
      UIA_TEXT_FIELD
    end

    # @return [String] Class name for secure text field
    def secure_text_field_class
      UIA_SECURE_TEXT_FIELD
    end

    # Find the first TextField that contains value or by index.
    # Note: Uses XPath
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield(value)
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid index. Must be >= 1" if index <= 0

        index -= 1 # eles_by_json and _textfields_with_predicate is 0 indexed.
        result = eles_by_json(_textfield_visible)[index]
        raise _no_such_element if result.nil?

        return result
      end

      ele_by_json _textfield_contains_string value
    end

    # Find all TextFields containing value.
    # If value is omitted, all TextFields are returned.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields(value = false)
      return eles_by_json _textfield_visible unless value

      eles_by_json _textfield_contains_string value
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      ele_by_json _textfield_visible
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      result = eles_by_json(_textfield_visible).last
      raise _no_such_element if result.nil?

      result
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact(value)
      ele_by_json _textfield_exact_string value
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact(value)
      eles_by_json _textfield_exact_string value
    end

    private

    # Appium
    def _textfield_visible
      { typeArray: [UIA_TEXT_FIELD, UIA_SECURE_TEXT_FIELD], onlyVisible: true }
    end

    # Appium
    def _textfield_exact_string(value)
      exact = { target: value, substring: false, insensitive: false }
      exact_obj = { name: exact, label: exact, value: exact }
      _textfield_visible.merge(exact_obj)
    end

    # Appium
    def _textfield_contains_string(value)
      contains = { target: value, substring: true, insensitive: true }
      contains_obj = { name: contains, label: contains, value: contains }
      _textfield_visible.merge(contains_obj)
    end
  end # module Ios
end # module Appium
