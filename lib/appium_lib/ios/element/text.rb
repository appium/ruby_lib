# XCUIElementTypeStaticText methods
module Appium
  module Ios

    private

    # @private
    def _static_text_elem
      if @automation_name && @automation_name == 'XCUITest'
        'XCUIElementTypeStaticText'
      else
        'UIAStaticText'
      end
    end

    public

    # Find the first XCUIElementTypeStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the XCUIElementTypeStaticText at that index is returned.
    # @return [XCUIElementTypeStaticText]
    def text(value)
      return ele_index _static_text_elem, value if value.is_a? Numeric
      find_ele_by_attr_include _static_text_elem, '*', value
    end

    # Find all XCUIElementTypeStaticText containing value.
    # If value is omitted, all XCUIElementTypeStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<XCUIElementTypeStaticText>]
    def texts(value = false)
      return tags _static_text_elem unless value
      find_eles_by_attr_include _static_text_elem, '*', value
    end

    # Find the first XCUIElementTypeStaticText.
    # @return [XCUIElementTypeStaticText]
    def first_text
      first_ele _static_text_elem
    end

    # Find the last XCUIElementTypeStaticText.
    # @return [XCUIElementTypeStaticText]
    def last_text
      last_ele _static_text_elem
    end

    # Find the first XCUIElementTypeStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [XCUIElementTypeStaticText]
    def text_exact(value)
      find_ele_by_attr _static_text_elem, '*', value
    end

    # Find all XCUIElementTypeStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<XCUIElementTypeStaticText>]
    def texts_exact(value)
      find_eles_by_attr _static_text_elem, '*', value
    end
  end # module Ios
end # module Appium
