# XCUIElementTypeButton methods
module Appium
  module Ios
    BUTTON = 'XCUIElementTypeButton'

    # Find the first XCUIElementTypeButton that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the XCUIElementTypeButton at that index is returned.
    # @return [XCUIElementTypeButton]
    def button(value)
      # return button at index.
      return ele_index BUTTON, value if value.is_a? Numeric
      find_ele_by_attr_include BUTTON, '*', value
    end

    # Find all XCUIElementTypeButtons containing value.
    # If value is omitted, all XCUIElementTypeButtons are returned.
    # @param value [String] the value to search for
    # @return [Array<XCUIElementTypeButton>]
    def buttons(value = false)
      return tags BUTTON unless value
      find_ele_by_attr_include BUTTON, '*', value
    end

    # Find the first XCUIElementTypeButton.
    # @return [XCUIElementTypeButton]
    def first_button
      first_ele BUTTON
    end

    # Find the last XCUIElementTypeButton.
    # @return [XCUIElementTypeButton]
    def last_button
      last_ele BUTTON
    end

    # Find the first XCUIElementTypeButton that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [XCUIElementTypeButton]
    def button_exact(value)
      find_ele_by_attr BUTTON, '*', value
    end

    # Find all XCUIElementTypeButtons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<XCUIElementTypeButton>]
    def buttons_exact(value)
      find_ele_by_attr BUTTON, '*', value
    end
  end # module Ios
end # module Appium
