# UIAStaticText|XCUIElementTypeStaticText methods
module Appium
  module Ios
    module Xcuitest
      module Element
        # XCUIElementTypeStaticText = 'XCUIElementTypeStaticText'.freeze

        # @return [String] Class name for text
        def static_text_class
          ::Appium::Ios::XCUIElementTypeStaticText
        end

        # Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
        # @param value [String, Integer] the value to find.
        # If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.
        # @return [UIAStaticText|XCUIElementTypeStaticText]
        def text(value)
          return ele_index static_text_class, value if value.is_a? Numeric

          raise_error_if_no_element texts(value).first
        end

        # Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
        # If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned
        # @param value [String] the value to search for
        # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
        def texts(value = false)
          return tags static_text_class unless value

          elements = find_eles_by_predicate_include(class_name: static_text_class, value: value)
          select_visible_elements elements
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
          raise_error_if_no_element texts_exact(value).first
        end

        # Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<UIAStaticText|XCUIElementTypeStaticText>]
        def texts_exact(value)
          elements = find_eles_by_predicate(class_name: static_text_class, value: value)
          select_visible_elements elements
        end
      end # module Text
    end # module XCUITest
  end # module Ios
end # module Appium
