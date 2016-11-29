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

    # @private
    # for XCUITest
    def _textfield_with_xpath
      xpath "//#{_textfields}"
    end

    # @private
    # for XCUITest
    def _textfields_with_xpath
      xpaths "//#{_textfields}"
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
        index -= 1 # eles_by_json and _textfields_with_xpath is 0 indexed.
        result = if automation_name_is_xcuitest?
                   _textfields_with_xpath[index]
                 else
                   eles_by_json(_textfield_visible)[index]
                 end
        fail _no_such_element if result.nil?
        return result

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
        return _textfields_with_xpath unless value
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
        _textfield_with_xpath
      else
        ele_by_json _textfield_visible
      end
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      result = if automation_name_is_xcuitest?
                 _textfields_with_xpath.last
               else
                 eles_by_json(_textfield_visible).last
               end
      fail _no_such_element if result.nil?
      result
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
