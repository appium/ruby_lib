module Appium
  module Ios
    # Find the first element containing value
    # @param value [String] the value to search for
    # @return [Element]
    def find(value)
      if automation_name_is_xcuitest?
        raise_error_if_no_element finds(value).first
      else
        ele_by_json_visible_contains '*', value
      end
    end

    # Find all elements containing value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds(value)
      if automation_name_is_xcuitest?
        elements = find_eles_by_predicate_include value: value
        select_visible_elements elements
      else
        eles_by_json_visible_contains '*', value
      end
    end

    # Find the first element exactly matching value
    # @param value [String] the value to search for
    # @return [Element]
    def find_exact(value)
      if automation_name_is_xcuitest?
        raise_error_if_no_element finds_exact(value).first
      else
        ele_by_json_visible_exact '*', value
      end
    end

    # Find all elements exactly matching value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds_exact(value)
      if automation_name_is_xcuitest?
        elements = find_eles_by_predicate value: value
        select_visible_elements elements
      else
        eles_by_json_visible_exact '*', value
      end
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
