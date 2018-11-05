# XCUIElementTypeButton methods
module Appium
  module Ios
    UIAButton = 'UIAButton'.freeze
    XCUIElementTypeButton = 'XCUIElementTypeButton'.freeze

    # @return [String] Class name for button
    def button_class
      UIAButton
    end

    # Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the UIAButton|XCUIElementTypeButton at that index is returned.
    # @return [UIAButton|XCUIElementTypeButton]
    def button(value)
      # return button at index.
      return ele_index button_class, value if value.is_a? Numeric

      ele_by_json_visible_contains button_class, value
    end

    # Find all UIAButtons|XCUIElementTypeButtons containing value.
    # If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.
    # @param value [String] the value to search for
    # @return [Array<UIAButton|XCUIElementTypeButton>]
    def buttons(value = false)
      return tags button_class unless value

      eles_by_json_visible_contains button_class, value
    end

    # Find the first UIAButton|XCUIElementTypeButton.
    # @return [UIAButton|XCUIElementTypeButton]
    def first_button
      first_ele button_class
    end

    # TODO: add documentation regarding previous element.
    #       Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
    # Find the last UIAButton|XCUIElementTypeButton.
    # @return [UIAButton|XCUIElementTypeButton]
    def last_button
      last_ele button_class
    end

    # Find the first UIAButton|XCUIElementTypeButton that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAButton|XCUIElementTypeButton]
    def button_exact(value)
      ele_by_json_visible_exact button_class, value
    end

    # Find all UIAButtons|XCUIElementTypeButtons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAButton|XCUIElementTypeButton>]
    def buttons_exact(value)
      eles_by_json_visible_exact button_class, value
    end
  end # module Ios
end # module Appium
