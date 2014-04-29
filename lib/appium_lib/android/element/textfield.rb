module Appium
  module Android
    EditText = 'android.widget.EditText'

    # Find the first EditText that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the EditText at that index is returned.
    # @return [EditText]
    def textfield value
      return ele_index EditText, value if value.is_a? Numeric
      xpath_visible_contains EditText, value
    end

    # Find all EditTexts containing value.
    # @param value [String] the value to search for
    # @return [Array<EditText>]
    def textfields value
      xpaths_visible_contains EditText, value
    end

    # Find the first EditText.
    # @return [EditText]
    def first_textfield
      first_ele EditText
    end

    # Find the last EditText.
    # @return [EditText]
    def last_textfield
      last_ele EditText
    end

    # Find the first EditText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [EditText]
    def textfield_exact value
      xpath_visible_exact EditText, value
    end

    # Find all EditTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<EditText>]
    def textfields_exact value
      xpaths_visible_exact EditText, value
    end

    # Find all EditTexts.
    # @return [Array<EditText>]
    def e_textfields
      tags EditText
    end
  end # module Android
end # module Appium