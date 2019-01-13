module Appium
  module Android
    Button      = 'android.widget.Button'.freeze
    ImageButton = 'android.widget.ImageButton'.freeze

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

        # 1 indexed
        return find_element :uiautomator, _button_visible_selectors(index: index)
      end

      find_element :uiautomator, _button_contains_string(value)
    end

    # Find all buttons containing value.
    # If value is omitted, all buttons are returned.
    # @param value [String] the value to search for
    # @return [Array<Button>]
    def buttons(value = false)
      return find_elements :uiautomator, _button_visible_selectors unless value

      find_elements :uiautomator, _button_contains_string(value)
    end

    # Find the first button.
    # @return [Button]
    def first_button
      find_element :uiautomator, _button_visible_selectors(button_index: 0, image_button_index: 0)
    end

    # Find the last button.
    # @return [Button]
    def last_button
      # uiautomator index doesn't support last
      # and it's 0 indexed
      button_index = tags(Button).length
      button_index -= 1 if button_index > 0
      image_button_index = tags(ImageButton).length
      image_button_index -= 1 if image_button_index > 0

      find_element :uiautomator,
                   _button_visible_selectors(button_index: button_index,
                                             image_button_index: image_button_index)
    end

    # Find the first button that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact(value)
      find_element :uiautomator, _button_exact_string(value)
    end

    # Find all buttons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact(value)
      find_elements :uiautomator, _button_exact_string(value)
    end

    private

    # @private
    def raise_no_such_element_if_empty(elements)
      raise _no_such_element if elements.empty?

      elements.first
    end

    def _button_visible_selectors(opts = {})
      button_index       = opts.fetch :button_index, false
      image_button_index = opts.fetch :image_button_index, false

      if button_index && image_button_index
        "new UiSelector().className(#{Button}).instance(#{button_index});" \
        "new UiSelector().className(#{ImageButton}).instance(#{image_button_index});"
      else
        "new UiSelector().className(#{Button});" \
        "new UiSelector().className(#{ImageButton});"
      end
    end

    def _button_exact_string(value)
      button       = string_visible_exact Button, value
      image_button = string_visible_exact ImageButton, value
      button + image_button
    end

    def _button_contains_string(value)
      button       = string_visible_contains Button, value
      image_button = string_visible_contains ImageButton, value
      button + image_button
    end
  end # module Android
end # module Appium
