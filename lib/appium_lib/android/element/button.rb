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

        if automation_name_is_espresso?
          # 0 indexed
          return _button_visible_selectors_xpath(index: index - 1)
        end

        # 1 indexed
        return find_element :uiautomator, _button_visible_selectors(index: index)
      end

      if automation_name_is_espresso?
        i = find_elements :xpath, _button_contains_string_xpath(Button, value)
        e = find_elements :xpath, _button_contains_string_xpath(ImageButton, value)

        raise_no_such_element_if_empty(i + e)

        return (i + e)[0]
      end

      find_element :uiautomator, _button_contains_string(value)
    end

    # Find all buttons containing value.
    # If value is omitted, all buttons are returned.
    # @param value [String] the value to search for
    # @return [Array<Button>]
    def buttons(value = false)
      unless value
        return _button_visible_selectors_xpath if automation_name_is_espresso?

        return find_elements :uiautomator, _button_visible_selectors
      end

      if automation_name_is_espresso?
        i = find_elements :xpath, _button_contains_string_xpath(Button, value)
        e = find_elements :xpath, _button_contains_string_xpath(ImageButton, value)
        return i + e
      end

      find_elements :uiautomator, _button_contains_string(value)
    end

    # Find the first button.
    # @return [Button]
    def first_button
      return _button_visible_selectors_xpath(button_index: 0, image_button_index: 0) if automation_name_is_espresso?

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

      if automation_name_is_espresso?
        return _button_visible_selectors_xpath(button_index: button_index,
                                               image_button_index: image_button_index)
      end

      find_element :uiautomator,
                   _button_visible_selectors(button_index: button_index,
                                             image_button_index: image_button_index)
    end

    # Find the first button that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact(value)
      if automation_name_is_espresso?
        i = find_elements :xpath, _button_exact_string_xpath(Button, value)
        e = find_elements :xpath, _button_exact_string_xpath(ImageButton, value)

        raise_no_such_element_if_empty(i + e)

        return (i + e)[0]
      end

      find_element :uiautomator, _button_exact_string(value)
    end

    # Find all buttons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact(value)
      if automation_name_is_espresso?
        i = find_elements :xpath, _button_exact_string_xpath(Button, value)
        e = find_elements :xpath, _button_exact_string_xpath(ImageButton, value)
        return i + e
      end

      find_elements :uiautomator, _button_exact_string(value)
    end

    private

    # @private
    def raise_no_such_element_if_empty(elements)
      raise _no_such_element if elements.empty?

      elements.first
    end

    # @private
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

    def _button_visible_selectors_xpath(opts = {})
      button_index       = opts.fetch :button_index, false
      image_button_index = opts.fetch :image_button_index, false

      index = opts.fetch :index, false

      b = find_elements :xpath, "//#{Button}"
      i = find_elements :xpath, "//#{ImageButton}"

      if index
        raise_no_such_element_if_empty(b + i)
        (b + i)[index]
      elsif button_index && image_button_index
        raise_no_such_element_if_empty(b + i)
        b_index = button_index + image_button_index
        (b + i)[b_index]
      else
        b + i
      end
    end

    # @private
    def _button_exact_string(value)
      button       = string_visible_exact Button, value
      image_button = string_visible_exact ImageButton, value
      button + image_button
    end

    def _button_exact_string_xpath(class_name, value)
      r_id = resource_id(value, " or @resource-id='#{value}'")
      "//#{class_name}[@text='#{value}' or @content-desc='#{value}'#{r_id}]"
    end

    # @private
    def _button_contains_string(value)
      button       = string_visible_contains Button, value
      image_button = string_visible_contains ImageButton, value
      button + image_button
    end

    def _button_contains_string_xpath(class_name, value)
      r_id = resource_id(value, " or @resource-id='#{value}'")
      "//#{class_name}[contains(translate(@text,'#{value.upcase}', '#{value}'), '#{value}')" \
        " or contains(translate(@content-desc,'#{value.upcase}', '#{value}'), '#{value}')#{r_id}]" \
    end
  end # module Android
end # module Appium
