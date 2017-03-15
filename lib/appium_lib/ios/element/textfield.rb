module Appium
  module Ios
    UIATextField = 'UIATextField'.freeze
    UIASecureTextField = 'UIASecureTextField'.freeze

    XCUIElementTypeTextField = 'XCUIElementTypeTextField'.freeze
    XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'.freeze

    # @return [String] Class name for text field
    def text_field_class
      automation_name_is_xcuitest? ? XCUIElementTypeTextField : UIATextField
    end

    # @return [String] Class name for secure text field
    def secure_text_field_class
      automation_name_is_xcuitest? ? XCUIElementTypeSecureTextField : UIASecureTextField
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

    # Appium
    def _textfield_visible
      { typeArray: [UIATextField, UIASecureTextField], onlyVisible: true }
    end

    # Appium
    def _textfield_exact_string(value)
      exact = { target: value, substring: false, insensitive: false }
      exact_obj = { name:  exact, label: exact, value: exact }
      _textfield_visible.merge(exact_obj)
    end

    # Appium
    def _textfield_contains_string(value)
      contains = { target: value, substring: true, insensitive: true }
      contains_obj = { name: contains, label: contains, value: contains }
      _textfield_visible.merge(contains_obj)
    end

    public

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
        result = if automation_name_is_xcuitest?
                   _textfields_with_predicate[index]
                 else
                   eles_by_json(_textfield_visible)[index]
                 end
        raise _no_such_element if result.nil?
        return result

      end

      if automation_name_is_xcuitest?
        raise_error_if_no_element textfields(value).first
      else
        ele_by_json _textfield_contains_string value
      end
    end

    # Find all TextFields containing value.
    # If value is omitted, all TextFields are returned.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields(value = false)
      if automation_name_is_xcuitest?
        return tags_include(class_names: [text_field_class, secure_text_field_class]) unless value

        elements = tags_include class_names: [text_field_class, secure_text_field_class], value: value
        select_visible_elements elements
      else
        return eles_by_json _textfield_visible unless value
        eles_by_json _textfield_contains_string value
      end
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      if automation_name_is_xcuitest?
        _textfield_with_predicate
      else
        ele_by_json _textfield_visible
      end
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      result = if automation_name_is_xcuitest?
                 _textfields_with_predicate.last
               else
                 eles_by_json(_textfield_visible).last
               end
      raise _no_such_element if result.nil?
      result
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact(value)
      if automation_name_is_xcuitest?
        raise_error_if_no_element textfields_exact(value).first
      else
        ele_by_json _textfield_exact_string value
      end
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact(value)
      if automation_name_is_xcuitest?
        elements = tags_exact class_names: [text_field_class, secure_text_field_class], value: value
        select_visible_elements elements
      else
        eles_by_json _textfield_exact_string value
      end
    end
  end # module Ios
end # module Appium
