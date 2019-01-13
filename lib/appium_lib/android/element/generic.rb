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
      rid  = resource_id(text, "new UiSelector().resourceId(#{text});")
      args = rid.empty? ? ["new UiSelector().textContains(#{text})", "new UiSelector().descriptionContains(#{text})"] : [rid]
      args.each_with_index do |arg, index|
        begin
          elem = find_element :uiautomator, scroll_uiselector(arg, scrollable_index)
          return elem
        rescue StandardError => e
          raise e if index == args.size - 1
        end
      end
    end

    # Scroll to the first element with the exact target text or description.
    # @param text [String] the text or resourceId to search for in the text value and content description
    # @param scrollable_index [Integer] the index for scrollable views.
    # @return [Element] the element scrolled to
    def scroll_to_exact(text, scrollable_index = 0)
      text = %("#{text}")
      rid  = resource_id(text, "new UiSelector().resourceId(#{text});")
      args = rid.empty? ? ["new UiSelector().text(#{text})", "new UiSelector().description(#{text})"] : [rid]
      args.each_with_index do |arg, index|
        begin
          elem = find_element :uiautomator, scroll_uiselector(arg, scrollable_index)
          return elem
        rescue StandardError => e
          raise e if index == args.size - 1
        end
      end
    end
  end # module Android
end # module Appium
