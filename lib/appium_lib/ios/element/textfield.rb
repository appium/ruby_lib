module Appium
  module Ios

    private

    # @private
    def _text_field_elem
      if @automation_name && @automation_name == 'XCUITest'
        'XCUIElementTypeTextField'
      else
        'UIATextField'
      end
    end

    # @private
    def _secure_text_field_elem
      if @automation_name && @automation_name == 'XCUITest'
        'XCUIElementTypeSecureTextField'
      else
        'UIASecureTextField'
      end
    end

    # @private
    def _textfields
      %(#{_text_field_elem} | //#{_secure_text_field_elem})
    end

    public

    # Find the first TextField that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield(value)
      find_ele_by_attr_include _textfields, '*', value
      if value.is_a? Numeric
        index = value
        fail "#{index} is not a valid index. Must be >= 1" if index <= 0
        return ele_index index
      end
      find_ele_by_attr _textfields, '*', value
    end

    # Find all TextFields containing value.
    # If value is omitted, all TextFields are returned.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields(value = false)
      return tags(_textfields) unless value
      find_eles_by_attr_include _textfields, '*', value
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      first_ele _textfields
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      last_ele _textfields
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact(value)
      find_ele_by_attr _textfields, '*', value
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact(value)
      find_eles_by_attr _textfields, '*', value
    end
  end # module Ios
end # module Appium
