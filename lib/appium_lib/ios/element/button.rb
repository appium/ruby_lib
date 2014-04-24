# encoding: utf-8
# UIAButton methods
module Appium
  module Ios
    # Find a button by text and optionally number.
    # @param text [String, Integer] the text to exactly match. If int then the button at that index is returned.
    # @param number [Integer] the occurrence of the button matching text. Defaults to the first button.
    # @return [Button] the button found with text and matching number
    def button text, number=0
      # return button at index.
      return ele_index :button, text if text.is_a? Numeric

      number >= 1 ? button_num(text, number) :
          find_ele_by_name_include(:button, text)
    end

    # Get an array of button texts or button elements if text is provided.
    # @param text [String] the text to exactly match
    # @return [Array<String>, Array<Buttons>] either an array of button texts or an array of button elements if text is provided.
    def buttons text=nil
      text == nil ? find_eles_attr(:button, :name) :
          find_eles_by_name_include(:button, text)
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
    # @param text [String] the text to match exactly
    # @return [Button]
    def button_exact text
      find_ele_by_name :button, text
    end

    # Get all button elements that exactly match text.
    # @param text [String] the text to match exactly
    # @return [Array<Button>]
    def buttons_exact text
      find_eles_by_name :button, text
    end

    # Get an array of button elements.
    # @return [Array<Button>]
    def e_buttons
      find_eles :button
    end

    # Expected to be called via button method.
    #
    # Get the button element exactly matching text and
    # occurrence. number=2 means the 2nd occurrence.
    #
    # find the second Sign In button
    #
    # b = e_button 'Sign In', 2
    #
    # Button order will change in iOS vs Android
    # so if there's no button found at number then
    # return the first button.
    #
    # @param text [String] the text to match
    # @param number [Integer] the button occurance to return. 1 = first button
    # @return [Button] the button that matches text and number
    def button_num text, number=1
      raise 'Number must be >= 1' if number <= 0
      number = number - 1 # zero indexed
      result = nil

      elements = buttons text
      elements.size > number ? result = elements[number]
      : result = elements.first

      result
    end
  end # module Common
end # module Appium