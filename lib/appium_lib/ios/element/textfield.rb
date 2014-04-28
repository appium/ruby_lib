module Appium
  module Ios
    UIATextField       = 'UIATextField'
    UIASecureTextField = 'UIASecureTextField'

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

    # Get the first textfield that matches text.
    # @param value [String, Integer] the text to match exactly. If int then the textfield at that index is returned.
    # @return [Textfield]
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

    def textfields value
      xpaths _textfield_contains_string value
    end

    # Get the first textfield element.
    # @return [Textfield]
    def first_textfield
      xpath _textfield_visible_string
    end

    # Get the last textfield element.
    # @return [Textfield]
    def last_textfield
      xpath _textfield_visible_string index: 'last()'
    end

    # Get the first textfield that exactly matches text.
    # @param value [String] the value the textfield must exactly match
    # @return [Textfield]
    def textfield_exact value
      xpath _textfield_exact_string value
    end

    def textfields_exact value
      xpaths _textfield_exact_string value
    end

    # Get an array of textfield elements.
    # @return [Array<Textfield>]
    def e_textfields
      xpaths _textfield_visible_string
    end
  end # module Ios
end # module Appium