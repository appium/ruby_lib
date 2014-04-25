# UIAButton methods
module Appium
  module Ios
    UIAButton = 'UIAButton'
    # Find a button by text and optionally number.
    # @param value [String, Integer] the value to exactly match. If int then the button at that index is returned.
    # @return [Button] the button found with text and matching number
    def button value
      # return button at index.
      return ele_index UIAButton, value if value.is_a? Numeric
      xpath_visible_contains UIAButton, value
    end

    def buttons value
      xpaths_visible_contains UIAButton, value
    end

    # Get the first button element.
    # @return [Button]
    def first_button
      first_ele UIAButton
    end

    # Get the last button element.
    # @return [Button]
    def last_button
      last_ele UIAButton
    end

    # Get the first button element that exactly matches text.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact value
      xpath_visible_exact UIAButton, value
    end

    # Get all button elements that exactly match text.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact value
      xpaths_visible_exact UIAButton, value
    end

    # Get an array of button elements.
    # @return [Array<Button>]
    def e_buttons
      tags UIAButton
    end
  end # module Common
end # module Appium