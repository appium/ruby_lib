module Appium
  module Ios
    module Xcuitest
      module Element
        # XCUIElementTypeTextField = 'XCUIElementTypeTextField'.freeze
        # XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'.freeze

        # @return [String] Class name for text field
        def text_field_class
          ::Appium::Ios::XCUIElementTypeTextField
        end

        # @return [String] Class name for secure text field
        def secure_text_field_class
          ::Appium::Ios::XCUIElementTypeSecureTextField
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
