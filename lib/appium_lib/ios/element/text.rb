# UIAStaticText|XCUIElementTypeStaticText methods
module Appium
  module Ios
    IAStaticText = 'UIAStaticText'
    XCUIElementTypeStaticText = 'XCUIElementTypeStaticText'

    private

    # @private
    # XCUITest
    def _static_text_elem
      automation_name_is_xcuitest? ? XCUIElementTypeStaticText : IAStaticText
    end

    public

    # Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def text(value)
      return ele_index _static_text_elem, value if value.is_a? Numeric

      if automation_name_is_xcuitest?
        find_ele_by_attr_include _static_text_elem, '*', value
      else
        ele_by_json_visible_contains _static_text_elem, value
      end
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
    # If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
    def texts(value = false)
      return tags _static_text_elem unless value

      if automation_name_is_xcuitest?
        find_eles_by_attr_include _static_text_elem, '*', value
      else
        eles_by_json_visible_contains _static_text_elem, value
      end
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def first_text
      first_ele _static_text_elem
    end

    # Find the last UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def last_text
      last_ele _static_text_elem
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def text_exact(value)
      if automation_name_is_xcuitest?
        find_ele_by_attr _static_text_elem, '*', value
      else
        ele_by_json_visible_exact _static_text_elem, value
      end
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
    def texts_exact(value)
      if automation_name_is_xcuitest?
        find_eles_by_attr _static_text_elem, '*', value
      else
        eles_by_json_visible_exact _static_text_elem, value
      end
    end
  end # module Ios
end # module Appium
