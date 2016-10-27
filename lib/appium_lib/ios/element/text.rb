# XCUIElementTypeStaticText methods
module Appium
  module Ios
    STATIC_TEXT = 'XCUIElementTypeStaticText'

    # Find the first XCUIElementTypeStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the XCUIElementTypeStaticText at that index is returned.
    # @return [XCUIElementTypeStaticText]
    def text(value)
      return ele_index STATIC_TEXT, value if value.is_a? Numeric
      find_ele_by_attr_include STATIC_TEXT, '*', value
    end

    # Find all XCUIElementTypeStaticText containing value.
    # If value is omitted, all XCUIElementTypeStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<XCUIElementTypeStaticText>]
    def texts(value = false)
      return tags STATIC_TEXT unless value
      find_eles_by_attr_include STATIC_TEXT, '*', value
    end

    # Find the first XCUIElementTypeStaticText.
    # @return [XCUIElementTypeStaticText]
    def first_text
      first_ele STATIC_TEXT
    end

    # Find the last XCUIElementTypeStaticText.
    # @return [XCUIElementTypeStaticText]
    def last_text
      last_ele STATIC_TEXT
    end

    # Find the first XCUIElementTypeStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [XCUIElementTypeStaticText]
    def text_exact(value)
      find_ele_by_attr STATIC_TEXT, '*', value
    end

    # Find all XCUIElementTypeStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<XCUIElementTypeStaticText>]
    def texts_exact(value)
      find_eles_by_attr STATIC_TEXT, '*', value
    end
  end # module Ios
end # module Appium
