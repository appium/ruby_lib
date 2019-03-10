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
    module Xcuitest
      module Element
        # XCUIElementTypeTextField = 'XCUIElementTypeTextField'
        # XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'

        # @return [String] Class name for text field
        def text_field_class
          ::Appium::Ios::XCUIELEMENT_TYPE_TEXT_FIELD
        end

        # @return [String] Class name for secure text field
        def secure_text_field_class
          ::Appium::Ios::XCUIELEMENT_TYPE_SECURE_TEXT_FIELD
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
            result = _textfields_with_predicate[index]
            raise _no_such_element if result.nil?

            return result

          end

          raise_error_if_no_element textfields(value).first
        end

        # Find all TextFields containing value.
        # If value is omitted, all TextFields are returned.
        # @param value [String] the value to search for
        # @return [Array<TextField>]
        def textfields(value = false)
          return tags_include(class_names: [text_field_class, secure_text_field_class]) unless value

          elements = tags_include class_names: [text_field_class, secure_text_field_class], value: value
          select_visible_elements elements
        end

        # Find the first TextField.
        # @return [TextField]
        def first_textfield
          _textfield_with_predicate
        end

        # Find the last TextField.
        # @return [TextField]
        def last_textfield
          result = _textfields_with_predicate.last
          raise _no_such_element if result.nil?

          result
        end

        # Find the first TextField that exactly matches value.
        # @param value [String] the value to match exactly
        # @return [TextField]
        def textfield_exact(value)
          raise_error_if_no_element textfields_exact(value).first
        end

        # Find all TextFields that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<TextField>]
        def textfields_exact(value)
          elements = tags_exact class_names: [text_field_class, secure_text_field_class], value: value
          select_visible_elements elements
        end

        private

        # @private
        # for XCUITest
        def _textfield_with_predicate
          raise_error_if_no_element _textfields_with_predicate.first
        end

        # @private
        # for XCUITest
        def _textfields_with_predicate
          elements = tags_include(class_names: [text_field_class, secure_text_field_class])
          select_visible_elements elements
        end
      end # module TextField
    end # module XCUITest
  end # module Ios
end # module Appium
