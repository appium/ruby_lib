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
    def scroll_uiselector(content, index = 0)
      "new UiScrollable(new UiSelector().scrollable(true).instance(#{index})).scrollIntoView(#{content}.instance(0));"
    end

    # Scroll to the first element containing target text or description.
    # @param text [String] the text or resourceId to search for in the text value and content description
    # @param scrollable_index [Integer] the index for scrollable views.
    # @return [Element] the element scrolled to
    def scroll_to(text, scrollable_index = 0)
      text = %("#{text}")

      args = scroll_uiselector("new UiSelector().textContains(#{text})", scrollable_index) +
             scroll_uiselector("new UiSelector().descriptionContains(#{text})", scrollable_index) +
             scroll_uiselector(resource_id(text, "new UiSelector().resourceId(#{text});"), scrollable_index)

      find_element :uiautomator, args
    end

    # Scroll to the first element with the exact target text or description.
    # @param text [String] the text or resourceId to search for in the text value and content description
    # @param scrollable_index [Integer] the index for scrollable views.
    # @return [Element] the element scrolled to
    def scroll_to_exact(text, scrollable_index = 0)
      text = %("#{text}")

      args = scroll_uiselector("new UiSelector().text(#{text})", scrollable_index) +
             scroll_uiselector("new UiSelector().description(#{text})", scrollable_index) +
             scroll_uiselector(resource_id(text, "new UiSelector().resourceId(#{text});"), scrollable_index)

      find_element :uiautomator, args
    end
  end # module Android
end # module Appium
