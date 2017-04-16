# UIAButton methods
module Appium
  module Android
    Button      = 'android.widget.Button'.freeze
    ImageButton = 'android.widget.ImageButton'.freeze

    private

    # @private
    def _button_visible_selectors
      "//#{Button}|#{ImageButton}"
    end

    # @private
    def _button_exact_string(value)
      string_visible_exact(Button, value) +
          string_visible_exact(ImageButton, value).sub(/\A\/\//, '|')
    end

    # @private
    def _button_contains_string(value)
      string_visible_contains(Button, value) +
          string_visible_contains(ImageButton, value).sub(/\A\/\//, '|')
    end

    public

    # Find the first button that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the button at that index is returned.
    # @return [Button]
    def button(value)
      # Don't use ele_index because that only works on one element type.
      # Android needs to combine button and image button to match iOS.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid index. Must be >= 1" if index <= 0

        result = find_elements(:xpath, _button_visible_selectors)[value + 1]
        raise Selenium::WebDriver::Error::NoSuchElementError unless result
        return result
      end

      find_element :xpath, _button_contains_string(value)
    end

    # Find all buttons containing value.
    # If value is omitted, all buttons are returned.
    # @param value [String] the value to search for
    # @return [Array<Button>]
    def buttons(value = false)
      return find_elements :xpath, _button_visible_selectors unless value
      find_elements :xpath, _button_contains_string(value)
    end

    # Find the first button.
    # @return [Button]
    def first_button
      find_element :xpath, _button_visible_selectors
    end

    # Find the last button.
    # @return [Button]
    def last_button
      result = find_elements(:xpath, _button_visible_selectors).last
      raise Selenium::WebDriver::Error::NoSuchElementError unless result
      result
    end

    # Find the first button that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact(value)
      find_element :xpath, _button_exact_string(value)
    end

    # Find all buttons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact(value)
      find_elements :xpath, _button_exact_string(value)
    end
  end # module Android
end # module Appium
