# encoding: utf-8
# UIAButton methods
module Appium
  module Ios
    # Find a button by text and optionally number.
    # @param value [String, Integer] the value to exactly match. If int then the button at that index is returned.
    # @param number [Integer] the occurrence of the button matching text. Defaults to the first button.
    # @return [Button] the button found with text and matching number
    def button value, number=0
      # return button at index.
      return ele_index :button, value if value.is_a? Numeric
      xpath(xpath_visible_contains('UIAButton', value))
    end

    def buttons value
      xpaths(xpath_visible_contains('UIAButton', value))
    end

    # Get the first button element.
    # @return [Button]
    def first_button
      first_ele :button
    end

    # Get the last button element.
    # @return [Button]
    def last_button
      last_ele :button
    end

    # Get the first button element that exactly matches text.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact value
      xpath xpath_visible_exact 'UIAButton', value
    end

    # Get all button elements that exactly match text.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact value
      xpaths xpath_visible_exact 'UIAButton', value
    end

    # Get an array of button elements.
    # @return [Array<Button>]
    def e_buttons
      find_elements :class, 'UIAButton'
    end
  end # module Common
end # module Appium