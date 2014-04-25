module Appium
  module Ios
    UIATextField = 'UIATextField'
    UIASecureTextField = 'UIASecureTextField'
    # Get an array of textfield elements.
    # @return [Array<Textfield>]
    def e_textfields
      xpaths %Q(//#{UIATextField}[@visible="true"] | //#{UIASecureTextField}[@visible="true"])
    end

    # Get the first textfield element.
    # @return [Textfield]
    def first_textfield
      xpath %Q(//#{UIATextField}[@visible="true"] | //#{UIASecureTextField}[@visible="true"])
    end

    # Get the last textfield element.
    # @return [Textfield]
    def last_textfield
      xpath %Q(//#{UIATextField}[@visible="true"][last()] | //#{UIASecureTextField}[@visible="true"][last()])
    end

    # Get the first textfield that matches text.
    # @param text [String, Integer] the text to match exactly. If int then the textfield at that index is returned.
    # @return [Textfield]
    def textfield value
      # Don't use ele_index because that only works on one element type.
      # iOS needs to combine textfield and secure to match Android.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0

        return xpath(%Q(//#{UIATextField}[@visible="true"][#{index}] | //#{UIASecureTextField}[@visible="true"][#{index}]))
      end

      textfield_include value
    end

    def textfields value
      textfield = string_visible_include UIATextField, value
      secure = string_visible_include UIASecureTextField, value
      xpaths "#{textfield} | #{secure}"
    end

    # Get the first textfield that includes text.
    # @param value [String] the value the textfield must include
    # @return [Textfield]
    def textfield_include value
      textfield = string_visible_include UIATextField, value
      secure = string_visible_include UIASecureTextField, value
      xpath "#{textfield} | #{secure}"
    end

    # Get the first textfield that exactly matches text.
    # @param value [String] the value the textfield must exactly match
    # @return [Textfield]
    def textfield_exact value
      textfield = string_visible_exact UIATextField, value
      secure = string_visible_exact UIASecureTextField, value
      xpath "#{textfield} | #{secure}"
    end
  end # module Ios
end # module Appium