module Appium
  module Ios
    module Xcuitest
      module Element
        # Find the first element containing value
        # @param value [String] the value to search for
        # @return [Element]
        def find(value)
          raise_error_if_no_element finds(value).first
        end

        # Find all elements containing value
        # @param value [String] the value to search for
        # @return [Array<Element>]
        def finds(value)
          elements = find_eles_by_predicate_include value: value
          select_visible_elements elements
        end

        # Find the first element exactly matching value
        # @param value [String] the value to search for
        # @return [Element]
        def find_exact(value)
          raise_error_if_no_element finds_exact(value).first
        end

        # Find all elements exactly matching value
        # @param value [String] the value to search for
        # @return [Array<Element>]
        def finds_exact(value)
          elements = find_eles_by_predicate value: value
          select_visible_elements elements
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
      end # module Element
    end # module Xcuitest
  end # module Ios
end # module Appium
