# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Appium
  module Android
    module Uiautomator2
      module Helper
        # Returns a string that matches the first element that contains value
        # For automationName is Appium
        # example: string_visible_contains 'UIATextField', 'sign in'
        # note for XPath: https://github.com/appium/ruby_lib/pull/561
        #
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [String]
        def string_visible_contains(class_name, value)
          value = %("#{value}")
          if class_name == '*'
            return (resource_id(value, "new UiSelector().resourceId(#{value});") +
              "new UiSelector().descriptionContains(#{value});" \
              "new UiSelector().textContains(#{value});")
          end

          class_name = %("#{class_name}")
          resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
            "new UiSelector().className(#{class_name}).descriptionContains(#{value});" \
            "new UiSelector().className(#{class_name}).textContains(#{value});"
        end

        # Find the first element that contains value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_find_contains(class_name, value)
          elements = find_elements :uiautomator, string_visible_contains(class_name, value)
          raise _no_such_element if elements.empty?

          elements.first
        end

        # Find all elements containing value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Array<Element>]
        def complex_finds_contains(class_name, value)
          find_elements :uiautomator, string_visible_contains(class_name, value)
        end

        # @private
        # Create an string to exactly match the first element with target value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [String]
        def string_visible_exact(class_name, value)
          value = %("#{value}")

          if class_name == '*'
            return (resource_id(value, "new UiSelector().resourceId(#{value});") +
              "new UiSelector().description(#{value});" \
              "new UiSelector().text(#{value});")
          end

          class_name = %("#{class_name}")
          resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
            "new UiSelector().className(#{class_name}).description(#{value});" \
            "new UiSelector().className(#{class_name}).text(#{value});"
        end

        # Find the first element exactly matching value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_find_exact(class_name, value)
          elements = find_elements :uiautomator, string_visible_exact(class_name, value)
          raise _no_such_element if elements.empty?

          elements.first
        end

        # Find all elements exactly matching value
        # @param class_name [String] the class name for the element
        # @param value [String] the value to search for
        # @return [Element]
        def complex_finds_exact(class_name, value)
          find_elements :uiautomator, string_visible_exact(class_name, value)
        end
      end # module Helper
    end # module Uiautomator2
  end # module Android
end # module Appium
