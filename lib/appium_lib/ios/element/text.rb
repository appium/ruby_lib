# UIAStaticText|XCUIElementTypeStaticText methods
module Appium
  module Ios
    UIAStaticText = 'UIAStaticText'.freeze
    XCUIElementTypeStaticText = 'XCUIElementTypeStaticText'.freeze

    # @return [String] Class name for text
    def static_text_class
      UIAStaticText
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def text(value)
      return ele_index static_text_class, value if value.is_a? Numeric

      ele_by_json_visible_contains static_text_class, value
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
    # If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned
    # @param value [String] the value to search for
    # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
    def texts(value = false)
      return tags static_text_class unless value

      eles_by_json_visible_contains static_text_class, value
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def first_text
      first_ele static_text_class
    end

    # Find the last UIAStaticText|XCUIElementTypeStaticText.
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def last_text
      last_ele static_text_class
    end

    # Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [UIAStaticText|XCUIElementTypeStaticText]
    def text_exact(value)
      ele_by_json_visible_exact static_text_class, value
    end

    # Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
    def texts_exact(value)
      eles_by_json_visible_exact static_text_class, value
    end
  end # module Ios
end # module Appium
