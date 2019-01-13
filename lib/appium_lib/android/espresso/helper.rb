module Appium
  module Android
    module Espresso
      module Helper
        # Find the first element that contains value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_find_contains(class_name, value)
          find_element :xpath, string_visible_contains_xpath(class_name, value)
        end

        # Find all elements containing value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Array<Element>]
        def complex_finds_contains(class_name, value)
          find_elements :xpath, string_visible_contains_xpath(class_name, value)
        end

        # Find the first element exactly matching value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_find_exact(class_name, value)
          find_element :xpath, string_visible_exact_xpath(class_name, value)
        end

        # Find all elements exactly matching value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_finds_exact(class_name, value)
          find_elements :xpath, string_visible_exact_xpath(class_name, value)
        end
      end # module Helper
    end # module Espresso
  end # module Android
end # module Appium
