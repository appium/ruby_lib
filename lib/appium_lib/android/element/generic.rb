module Appium
  module Android

    # Find the first element containing value
    # @param value [String] the value to search for
    # @return [Element]
    def find value
      complex_find_contains '*', value
    end

    # Find all elements containing value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds value
      complex_finds_contains '*', value
    end

    # Find the first element exactly matching value
    # @param value [String] the value to search for
    # @return [Element]
    def find_exact value
      complex_find_exact '*', value
    end

    # Find all elements exactly matching value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds_exact value
      complex_finds_exact '*', value
    end

    # Scroll to the first element containing target text or description.
    # @param text [String] the text to search for in the text value and content description
    # @return [Element] the element scrolled to
    def scroll_to text
      args =
        # textContains(text)
        [[3, text]],
          # descriptionContains(text)
          [[7, text]]

      complex_find mode: 'scroll', selectors: args
    end

    # Scroll to the first element with the exact target text or description.
    # @param text [String] the text to search for in the text value and content description
    # @return [Element] the element scrolled to
    def scroll_to_exact text
      args =
        # text(text)
        [[1, text]],
          # description(text)
          [[5, text]]

      complex_find mode: 'scroll', selectors: args
    end
  end # module Android
end # module Appium