# UIAStaticText methods
module Appium
  module Ios
    UIAStaticText = 'UIAStaticText'
    # Get an array of text elements.
    # @return [Array<Text>]
    def e_s_texts
      tags UIAStaticText
    end

    # Get the first text element.
    # @return [Text]
    def first_s_text
      first_ele UIAStaticText
    end

    # Get the last text element
    # @return [Text]
    def last_s_text
      last_ele UIAStaticText
    end

    # Get the first element that includes text.
    # @param value [String, Integer] the value to find. If int then the text at that index is returned.
    # @return [Text]
    def s_text value
      return ele_index :text, value if value.is_a? Numeric
      xpath_visible_contains UIAStaticText, value
    end

    def s_texts value
      xpaths_visible_contains UIAStaticText, value
    end

    # Get the first textfield that matches text.
    # @param value [String] the value that the tag must match
    # @return [Text]
    def s_text_exact value
      xpath_visible_exact UIAStaticText, value
    end

    # Get all static textfields that matches text.
    # @param value [String] the value that the tag must match
    # @return [Array<Text>]
    def s_texts_exact value
      xpaths_visible_exact UIAStaticText, value
    end
  end # module Common
end # module Appium