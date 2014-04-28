module Appium
  module Android

    def find value
      xpath_visible_contains '*', value
    end

    def finds value
      xpaths_visible_contains '*', value
    end

    def find_exact value
      xpath_visible_exact '*', value
    end

    def finds_exact value
      xpaths_visible_exact '*', value
    end

    # Scroll to an element containing target text or description.
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

    # Scroll to an element with the exact target text or description.
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