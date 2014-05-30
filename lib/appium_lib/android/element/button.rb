# UIAButton methods
module Appium
  module Android
    Button      = 'android.widget.Button'
    ImageButton = 'android.widget.ImageButton'

    private

    # @private
    def _button_visible_selectors opts={}
      button_index       = opts.fetch :button_index, false
      image_button_index = opts.fetch :image_button_index, false

      # complex_find(...)
      # 4 = className(String className)
      # 9 = instance(final int instance)

      if button_index && image_button_index
        [
          # className().instance()
          [[4, Button], [9, button_index]],
          # className().instance()
          [[4, ImageButton], [9, image_button_index]]
        ]
      else
        [
          # className()
          [[4, Button]],
          # className()
          [[4, ImageButton]]
        ]
      end
    end

    # @private
    def _button_exact_string value
      button       = string_visible_exact Button, value
      image_button = string_visible_exact ImageButton, value
      button + image_button
    end

    # @private
    def _button_contains_string value
      button       = string_visible_contains Button, value
      image_button = string_visible_contains ImageButton, value
      button + image_button
    end

    public

    # Find the first button that contains value or by index.
    # @param value [String, Integer] the value to exactly match.
    # If int then the button at that index is returned.
    # @return [Button]
    def button value
      # Don't use ele_index because that only works on one element type.
      # Android needs to combine button and image button to match iOS.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid index. Must be >= 1" if index <= 0

        return complex_find _button_visible_selectors index: index
      end

      complex_find _button_contains_string value
    end

    # Find all buttons containing value.
    # If value is omitted, all buttons are returned.
    # @param value [String] the value to search for
    # @return [Array<Button>]
    def buttons value=false
      return complex_find mode: 'all', selectors: _button_visible_selectors unless value
      complex_find mode: 'all', selectors: _button_contains_string(value)
    end

    # Find the first button.
    # @return [Button]
    def first_button
      complex_find _button_visible_selectors button_index: 0, image_button_index: 0
    end

    # Find the last button.
    # @return [Button]
    def last_button
      # uiautomator index doesn't support last
      # and it's 0 indexed
      button_index       = tags(Button).length
      button_index       -= 1 if button_index >= 0
      image_button_index = tags(ImageButton).length
      image_button_index -= 1 if image_button_index >= 0

      complex_find _button_visible_selectors button_index: button_index, image_button_index: image_button_index
    end

    # Find the first button that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact value
      complex_find _button_exact_string value
    end

    # Find all buttons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact value
      complex_find mode: 'all', selectors: _button_exact_string(value)
    end
  end # module Android
end # module Appium