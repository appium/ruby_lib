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
        elements = find_eles_by_attr_include '*', '*', value
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
        elements = find_eles_by_attr '*', '*', value
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

    # Return all elements include not displayed elements.
    def elements_include(elements, value)
      return [] if elements.empty?
      elements.select do |element|
        # `text` is equal to `value` if value is not `nil`
        # `text` is equal to `name` if value is `nil`
        name = element.name
        text = element.value
        name_result = name.nil? ? false : name.downcase.include?(value.downcase)
        text_result = text.nil? ? false : text.downcase.include?(value.downcase)
        name_result || text_result
      end
    end

    # Return all elements include not displayed elements.
    def elements_exact(elements, value)
      return [] if elements.empty?
      elements.select do |element|
        # `text` is equal to `value` if value is not `nil`
        # `text` is equal to `name` if value is `nil`
        name = element.name
        text = element.value
        name_result = name.nil? ? false : name.casecmp(value).zero?
        text_result = text.nil? ? false : text.casecmp(value).zero?
        name_result || text_result
      end
    end

    # Return visible elements.
    def select_visible_elements(elements)
      elements.select(&:displayed?)
    end
  end # module Ios
end # module Appium
