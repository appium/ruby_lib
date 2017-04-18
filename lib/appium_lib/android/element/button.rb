# UIAButton methods
module Appium
  module Android
    Button      = 'android.widget.Button'.freeze
    ImageButton = 'android.widget.ImageButton'.freeze

    private

    # @private
    def _button_visible_selectors_xpath
      "//#{Button}|#{ImageButton}"
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

    # @private
    def _button_exact_string_xpath(value)
      string_visible_exact_xpath(Button, value) +
          string_visible_exact_xpath(ImageButton, value).sub(/\A\/\//, '|')
    end

    def _button_exact_string(value)
      button       = string_visible_exact Button, value
      image_button = string_visible_exact ImageButton, value
      button + image_button
    end

    # @private
    def _button_contains_string_xpath(value)
      string_visible_contains_xpath(Button, value) +
          string_visible_contains_xpath(ImageButton, value).sub(/\A\/\//, '|')
    end

    def _button_contains_string(value)
      button       = string_visible_contains Button, value
      image_button = string_visible_contains ImageButton, value
      button + image_button
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

        if automation_name_is_uiautomator2?
          result = find_elements(:xpath, _button_visible_selectors_xpath)[value - 1]
          raise Selenium::WebDriver::Error::NoSuchElementError unless result
        else
          result = find_element :uiautomator, _button_visible_selectors(index: index)
        end

        return result
      end

      if automation_name_is_uiautomator2?
        find_element :xpath, _button_contains_string_xpath(value)
      else
        find_element :uiautomator, _button_contains_string(value)
      end
    end

    # Find all buttons containing value.
    # If value is omitted, all buttons are returned.
    # @param value [String] the value to search for
    # @return [Array<Button>]
    def buttons(value = false)
      if automation_name_is_uiautomator2?
        return find_elements :xpath, _button_visible_selectors_xpath unless value
        find_elements :xpath, _button_contains_string_xpath(value)
      else
        return find_elements :uiautomator, _button_visible_selectors unless value
        find_elements :uiautomator, _button_contains_string(value)
      end
    end

    # Find the first button.
    # @return [Button]
    def first_button
      if automation_name_is_uiautomator2?
        find_element :xpath, _button_visible_selectors_xpath
      else
        find_element :uiautomator, _button_visible_selectors(button_index: 0, image_button_index: 0)
      end
    end

    # Find the last button.
    # @return [Button]
    def last_button
      if automation_name_is_uiautomator2?
        result = find_elements(:xpath, _button_visible_selectors_xpath).last
        raise Selenium::WebDriver::Error::NoSuchElementError unless result
        result
      else
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
    end

    # Find the first button that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact(value)
      if automation_name_is_uiautomator2?
        find_element :xpath, _button_exact_string_xpath(value)
      else
        find_element :uiautomator, _button_exact_string(value)
      end
    end

    # Find all buttons that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact(value)
      if automation_name_is_uiautomator2?
        find_elements :xpath, _button_exact_string_xpath(value)
      else
        find_elements :uiautomator, _button_exact_string(value)
      end
    end
  end # module Android
end # module Appium
