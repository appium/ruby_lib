module Appium
  module Ios
    UIATextField       = 'UIATextField'
    UIASecureTextField = 'UIASecureTextField'

    private

    # @private
    def _textfield_visible_string opts={}
      index = opts.fetch :index, false
      if index
        %Q(//#{UIATextField}[@visible="true"][#{index}] | //#{UIASecureTextField}[@visible="true"][#{index}])
      else
        %Q(//#{UIATextField}[@visible="true"] | //#{UIASecureTextField}[@visible="true"])
      end
    end

    # @private
    def _textfield_exact_string value
      textfield = string_visible_exact UIATextField, value
      secure    = string_visible_exact UIASecureTextField, value
      "#{textfield} | #{secure}"
    end

    # @private
    def _textfield_contains_string value
      textfield = string_visible_contains UIATextField, value
      secure    = string_visible_contains UIASecureTextField, value
      "#{textfield} | #{secure}"
    end

    public

    # Find the first TextField that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield value
      # Don't use ele_index because that only works on one element type.
      # iOS needs to combine textfield and secure to match Android.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0

        return xpath _textfield_visible_string index: index
      end

      xpath _textfield_contains_string value
    end

    # Find all TextFields containing value.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields value
      xpaths _textfield_contains_string value
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      xpath _textfield_visible_string
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      xpath _textfield_visible_string index: 'last()'
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact value
      xpath _textfield_exact_string value
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact value
      xpaths _textfield_exact_string value
    end

    # Find all TextFields.
    # @return [Array<TextField>]
    def e_textfields
      xpaths _textfield_visible_string
    end
  end # module Ios
end # module Appium