module Appium
  module Ios
    # Find the first element containing value
    # @param value [String] the value to search for
    # @return [Element]
    def find(value)
      if automation_name_is_xcuitest?
        find_ele_by_attr_include '*', '*', value
      else
        ele_by_json_visible_contains '*', value
      end
    end

    # Find all elements containing value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds(value)
      if automation_name_is_xcuitest?
        find_eles_by_attr_include '*', '*', value
      else
        eles_by_json_visible_contains '*', value
      end
    end

    # Find the first element exactly matching value
    # @param value [String] the value to search for
    # @return [Element]
    def find_exact(value)
      if automation_name_is_xcuitest?
        find_ele_by_attr '*', '*', value
      else
        ele_by_json_visible_exact '*', value
      end
    end

    # Find all elements exactly matching value
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def finds_exact(value)
      if automation_name_is_xcuitest?
        find_eles_by_attr '*', '*', value
      else
        eles_by_json_visible_exact '*', value
      end
    end
  end # module Ios
end # module Appium
