# TextView methods
module Appium
  module Android
    TextView = 'android.widget.TextView'

    # Get the first element that includes text.
    # @param value [String, Integer] the value to find. If int then the text at that index is returned.
    # @return [Text]
    def s_text value
      return ele_index TextView, value if value.is_a? Numeric
      xpath_visible_contains TextView, value
    end

    def s_texts value
      xpaths_visible_contains TextView, value
    end

    # Get the first text element.
    # @return [Text]
    def first_s_text
      first_ele TextView
    end

    # Get the last text element
    # @return [Text]
    def last_s_text
      last_ele TextView
    end

    # Get the first textfield that matches text.
    # @param value [String] the value that the tag must match
    # @return [Text]
    def s_text_exact value
      xpath_visible_exact TextView, value
    end

    # Get all static textfields that matches text.
    # @param value [String] the value that the tag must match
    # @return [Array<Text>]
    def s_texts_exact value
      xpaths_visible_exact TextView, value
    end

    # Get an array of text elements.
    # @return [Array<Text>]
    def e_s_texts
      tags TextView
    end
  end # module Android
end # module Appium