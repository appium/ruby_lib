# UIAButton methods
module Appium
  module Ios
    UIAButton = 'UIAButton'

    # Find the first UIAButton that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the UIAButton at that index is returned.
    # @return [UIAButton]
    def button(value)
      # return button at index.
      return ele_index UIAButton, value if value.is_a? Numeric
      ele_by_json_visible_contains UIAButton, value
    end

    # Find all UIAButtons containing value.
    # If value is omitted, all UIAButtons are returned.
    # @param value [String] the value to search for
    # @return [Array<UIAButton>]
    def buttons(value = false)
      return tags UIAButton unless value
      eles_by_json_visible_contains UIAButton, value
    end

    # Find the first UIAButton.
    # @return [UIAButton]
    def first_button
      first_ele UIAButton
    end

    # Find the last UIAButton.
    # @return [UIAButton]
    def last_button
      last_ele UIAButton
    end

    # Find the first UIAButton that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAButton]
    def button_exact(value)
      ele_by_json_visible_exact UIAButton, value
    end

    # Find all UIAButtons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAButton>]
    def buttons_exact(value)
      eles_by_json_visible_exact UIAButton, value
    end
  end # module Ios
end # module Appium
