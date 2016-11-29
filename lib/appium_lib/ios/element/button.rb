# XCUIElementTypeButton methods
module Appium
  module Ios
    UIAButton = 'UIAButton'
    XCUIElementTypeButton = 'XCUIElementTypeButton'

    private

    # @private
    def _button_elem
      automation_name_is_xcuitest? ? XCUIElementTypeButton : UIAButton
    end

    public

    # Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the UIAButton|XCUIElementTypeButton at that index is returned.
    # @return [UIAButton|XCUIElementTypeButton]
    def button(value)
      # return button at index.
      return ele_index _button_elem, value if value.is_a? Numeric

      if automation_name_is_xcuitest?
        find_ele_by_attr_include _button_elem, '*', value
      else
        ele_by_json_visible_contains _button_elem, value
      end
    end

    # Find all UIAButtons|XCUIElementTypeButtons containing value.
    # If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.
    # @param value [String] the value to search for
    # @return [Array<UIAButton|XCUIElementTypeButton>]
    def buttons(value = false)
      return tags _button_elem unless value

      if automation_name_is_xcuitest?
        find_eles_by_attr_include _button_elem, '*', value
      else
        eles_by_json_visible_contains _button_elem, value
      end
    end

    # Find the first UIAButton|XCUIElementTypeButton.
    # @return [UIAButton|XCUIElementTypeButton]
    def first_button
      first_ele _button_elem
    end

    # TODO: add documentation regarding previous element.
    #       Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
    # Find the last UIAButton|XCUIElementTypeButton.
    # @return [UIAButton|XCUIElementTypeButton]
    def last_button
      last_ele _button_elem
    end

    # Find the first UIAButton|XCUIElementTypeButton that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAButton|XCUIElementTypeButton]
    def button_exact(value)
      if automation_name_is_xcuitest?
        find_ele_by_attr _button_elem, '*', value
      else
        ele_by_json_visible_exact _button_elem, value
      end
    end

    # Find all UIAButtons|XCUIElementTypeButtons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAButton|XCUIElementTypeButton>]
    def buttons_exact(value)
      if automation_name_is_xcuitest?
        find_eles_by_attr _button_elem, '*', value
      else
        eles_by_json_visible_exact _button_elem, value
      end
    end
  end # module Ios
end # module Appium
