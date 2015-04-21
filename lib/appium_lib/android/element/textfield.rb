module Appium
  module Android
    EditText = 'android.widget.EditText'

    # Find the first EditText that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the EditText at that index is returned.
    # @return [EditText]
    def textfield(value)
      return ele_index EditText, value if value.is_a? Numeric
      complex_find_contains EditText, value
    end

    # Find all EditTexts containing value.
    # If value is omitted, all EditTexts are returned.
    # @param value [String] the value to search for
    # @return [Array<EditText>]
    def textfields(value = false)
      return tags EditText unless value
      complex_finds_contains EditText, value
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
    def textfield_exact(value)
      complex_find_exact EditText, value
    end

    # Find all EditTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<EditText>]
    def textfields_exact(value)
      complex_finds_exact EditText, value
    end
  end # module Android
end # module Appium
