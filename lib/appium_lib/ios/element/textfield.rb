module Appium
  module Ios
    UIATextField = 'UIATextField'
    UIASecureTextField = 'UIASecureTextField'

    XCUIElementTypeTextField = 'XCUIElementTypeTextField'
    XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'

    private

    # @private
    # for XCUITest
    def _text_field_elem
      automation_name_is_xcuitest? ? XCUIElementTypeTextField : UIATextField
    end

    # @private
    # for XCUITest
    def _secure_text_field_elem
      automation_name_is_xcuitest? ? XCUIElementTypeSecureTextField : UIASecureTextField
    end

    # @private
    # for XCUITest
    def _textfields
      %(#{_text_field_elem} | //#{_secure_text_field_elem})
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
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield(value)
      if value.is_a? Numeric
        index = value
        fail "#{index} is not a valid index. Must be >= 1" if index <= 0

        if automation_name_is_xcuitest?
          return ele_index _textfields, index
        else
          index -= 1 # eles_by_json is 0 indexed.
          result = eles_by_json(_textfield_visible)[index]
          fail _no_such_element if result.nil?
          return result
        end

      end

      if automation_name_is_xcuitest?
        find_ele_by_attr_include _textfields, '*', value
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
        return tags(_textfields) unless value
        find_eles_by_attr_include _textfields, '*', value
      else
        return eles_by_json _textfield_visible unless value
        eles_by_json _textfield_contains_string value
      end
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      if automation_name_is_xcuitest?
        first_ele _textfields
      else
        ele_by_json _textfield_visible
      end
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      if automation_name_is_xcuitest?
        last_ele _textfields
      else
        result = eles_by_json(_textfield_visible).last
        fail _no_such_element if result.nil?
        result
      end
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact(value)
      if automation_name_is_xcuitest?
        find_ele_by_attr _textfields, '*', value
      else
        ele_by_json _textfield_exact_string value
      end
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact(value)
      if automation_name_is_xcuitest?
        find_eles_by_attr _textfields, '*', value
      else
        eles_by_json _textfield_exact_string value
      end
    end
  end # module Ios
end # module Appium
