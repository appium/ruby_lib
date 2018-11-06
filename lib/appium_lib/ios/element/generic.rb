module Appium
  module Ios
    # Find the first element containing value
    # @param value [String] the value to search for
    # @return [Element]
    def find(value)
      ele_by_json_visible_contains '*', value
    end

    # Find all elements containing value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds(value)
      eles_by_json_visible_contains '*', value
    end

    # Find the first element exactly matching value
    # @param value [String] the value to search for
    # @return [Element]
    def find_exact(value)
      ele_by_json_visible_exact '*', value
    end

    # Find all elements exactly matching value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds_exact(value)
      eles_by_json_visible_exact '*', value
    end

    private

    def raise_error_if_no_element(element)
      error_message = 'An element could not be located on the page using the given search parameters.'
      raise(::Selenium::WebDriver::Error::NoSuchElementError, error_message) if element.nil?

      element
    end

    # Return visible elements.
    def select_visible_elements(elements)
      elements.select(&:displayed?)
    end
  end # module Ios
end # module Appium
