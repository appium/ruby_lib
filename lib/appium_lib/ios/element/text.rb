# UIAStaticText methods
module Appium
  module Ios
    UIAStaticText = 'UIAStaticText'

    # Find the first UIAStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the UIAStaticText at that index is returned.
    # @return [UIAStaticText]
    def text(value)
      return ele_index UIAStaticText, value if value.is_a? Numeric
      ele_by_json_visible_contains UIAStaticText, value
    end

    # Find all UIAStaticText containing value.
    # If value is omitted, all UIAStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<UIAStaticText>]
    def texts(value = false)
      return tags UIAStaticText unless value
      eles_by_json_visible_contains UIAStaticText, value
    end

    # Find the first UIAStaticText.
    # @return [UIAStaticText]
    def first_text
      first_ele UIAStaticText
    end

    # Find the last UIAStaticText.
    # @return [UIAStaticText]
    def last_text
      last_ele UIAStaticText
    end

    # Find the first UIAStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAStaticText]
    def text_exact(value)
      ele_by_json_visible_exact UIAStaticText, value
    end

    # Find all UIAStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAStaticText>]
    def texts_exact(value)
      eles_by_json_visible_exact UIAStaticText, value
    end
  end # module Ios
end # module Appium
