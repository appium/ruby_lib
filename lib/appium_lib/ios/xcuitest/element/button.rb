# XCUIElementTypeButton methods
module Appium
  module Ios
    module Xcuitest
      module Element
        # XCUIElementTypeButton = 'XCUIElementTypeButton'.freeze

        # @return [String] Class name for button
        def button_class
          ::Appium::Ios::XCUIElementTypeButton
        end

        # Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
        # @param value [String, Integer] the value to exactly match.
        # If int then the UIAButton|XCUIElementTypeButton at that index is returned.
        # @return [UIAButton|XCUIElementTypeButton]
        def button(value)
          # return button at index.
          return ele_index button_class, value if value.is_a? Numeric

          raise_error_if_no_element buttons(value).first
        end

        # Find all UIAButtons|XCUIElementTypeButtons containing value.
        # If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.
        # @param value [String] the value to search for
        # @return [Array<UIAButton|XCUIElementTypeButton>]
        def buttons(value = false)
          return tags button_class unless value

          elements = find_eles_by_predicate_include(class_name: button_class, value: value)
          select_visible_elements elements
        end

        # Find the first UIAButton|XCUIElementTypeButton.
        # @return [UIAButton|XCUIElementTypeButton]
        def first_button
          first_ele button_class
        end

        # TODO: add documentation regarding previous element.
        #       Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
        # Find the last UIAButton|XCUIElementTypeButton.
        # @return [UIAButton|XCUIElementTypeButton]
        def last_button
          last_ele button_class
        end

        # Find the first UIAButton|XCUIElementTypeButton that exactly matches value.
        # @param value [String] the value to match exactly
        # @return [UIAButton|XCUIElementTypeButton]
        def button_exact(value)
          raise_error_if_no_element buttons_exact(value).first
        end

        # Find all UIAButtons|XCUIElementTypeButtons that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<UIAButton|XCUIElementTypeButton>]
        def buttons_exact(value)
          elements = find_eles_by_predicate(class_name: button_class, value: value)
          select_visible_elements elements
        end
      end # moudule button
    end # module Xcuitest
  end # module Ios
end # module Appium
