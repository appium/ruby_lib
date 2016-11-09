# XCUIElementTypeButton methods
module Appium
  module Ios

    private

    # @private
    def _button_elem
      if @automation_name && @automation_name == 'XCUITest'
        'XCUIElementTypeButton'
      else
        'UIAButton'
      end
    end

    public

    # Find the first XCUIElementTypeButton that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the XCUIElementTypeButton at that index is returned.
    # @return [XCUIElementTypeButton]
    def button(value)
      # return button at index.
      return ele_index _button_elem, value if value.is_a? Numeric
      find_ele_by_attr_include _button_elem, '*', value
    end

    # Find all XCUIElementTypeButtons containing value.
    # If value is omitted, all XCUIElementTypeButtons are returned.
    # @param value [String] the value to search for
    # @return [Array<XCUIElementTypeButton>]
    def buttons(value = false)
      return tags _button_elem unless value
      find_ele_by_attr_include _button_elem, '*', value
    end

    # Find the first XCUIElementTypeButton.
    # @return [XCUIElementTypeButton]
    def first_button
      first_ele _button_elem
    end

    # Find the last XCUIElementTypeButton.
    # @return [XCUIElementTypeButton]
    def last_button
      last_ele _button_elem
    end

    # Find the first XCUIElementTypeButton that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [XCUIElementTypeButton]
    def button_exact(value)
      find_ele_by_attr _button_elem, '*', value
    end

    # Find all XCUIElementTypeButtons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<XCUIElementTypeButton>]
    def buttons_exact(value)
      find_ele_by_attr _button_elem, '*', value
    end
  end # module Ios
end # module Appium
