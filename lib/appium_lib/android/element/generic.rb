module Appium
  module Android
    # Find the first element containing value
    # @param value [String] the value to search for
    # @return [Element]
    def find(value)
      complex_find_contains '*', value
    end

    # Find all elements containing value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds(value)
      complex_finds_contains '*', value
    end

    # Find the first element exactly matching value
    # @param value [String] the value to search for
    # @return [Element]
    def find_exact(value)
      complex_find_exact '*', value
    end

    # Find all elements exactly matching value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds_exact(value)
      complex_finds_exact '*', value
    end

    # @private
    def scroll_uiselector(content)
      "new UiScrollable(new UiSelector().scrollable(true).instance(0)).scrollIntoView(#{content}.instance(0));"
    end

    # Scroll to the first element containing target text or description.
    # @param text [String] the text to search for in the text value and content description
    # @return [Element] the element scrolled to
    def scroll_to(text)
      text = %("#{text}")

      args = scroll_uiselector("new UiSelector().textContains(#{text})") +
             scroll_uiselector("new UiSelector().descriptionContains(#{text})")

      find_element :uiautomator, args
    end

    # Scroll to the first element with the exact target text or description.
    # @param text [String] the text to search for in the text value and content description
    # @return [Element] the element scrolled to
    def scroll_to_exact(text)
      text = %("#{text}")

      args = scroll_uiselector("new UiSelector().text(#{text})") +
             scroll_uiselector("new UiSelector().description(#{text})")

      find_element :uiautomator, args
    end
  end # module Android
end # module Appium
