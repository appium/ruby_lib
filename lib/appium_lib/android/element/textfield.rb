module Appium
  module Android
    EditText = 'android.widget.EditText'

    # Get the first textfield that matches text.
    # @param value [String, Integer] the text to match exactly. If int then the textfield at that index is returned.
    # @return [Textfield]
    def textfield value
      return ele_index EditText, value if value.is_a? Numeric
      xpath_visible_contains EditText, value
    end

    def textfields value
      xpaths_visible_contains EditText, value
    end

    # Get the first textfield element.
    # @return [Textfield]
    def first_textfield
      first_ele EditText
    end

    # Get the last textfield element.
    # @return [Textfield]
    def last_textfield
      last_ele EditText
    end

    # Get the first textfield that exactly matches text.
    # @param value [String] the value the textfield must exactly match
    # @return [Textfield]
    def textfield_exact value
      xpath_visible_exact EditText, value
    end

    def textfields_exact value
      xpaths_visible_exact EditText, value
    end

    # Get an array of textfield elements.
    # @return [Array<Textfield>]
    def e_textfields
      tags EditText
    end
  end # module Android
end # module Appium