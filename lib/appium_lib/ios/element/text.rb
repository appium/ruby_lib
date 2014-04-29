# UIAStaticText methods
module Appium
  module Ios
    UIAStaticText = 'UIAStaticText'

    # Find the first UIAStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the UIAStaticText at that index is returned.
    # @return [UIAStaticText]
    def s_text value
      return ele_index UIAStaticText, value if value.is_a? Numeric
      xpath_visible_contains UIAStaticText, value
    end

    # Find all UIAStaticText containing value.
    # @param value [String] the value to search for
    # @return [Array<UIAStaticText>]
    def s_texts value
      xpaths_visible_contains UIAStaticText, value
    end

    # Find the first UIAStaticText.
    # @return [UIAStaticText]
    def first_s_text
      first_ele UIAStaticText
    end

    # Find the last UIAStaticText.
    # @return [UIAStaticText]
    def last_s_text
      last_ele UIAStaticText
    end

    # Find the first UIAStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAStaticText]
    def s_text_exact value
      xpath_visible_exact UIAStaticText, value
    end

    # Find all UIAStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAStaticText>]
    def s_texts_exact value
      xpaths_visible_exact UIAStaticText, value
    end

    # Find all UIAStaticTexts.
    # @return [Array<UIAStaticText>]
    def e_s_texts
      tags UIAStaticText
    end
  end # module Ios
end # module Appium