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
      rid  = resource_id(text, "new UiSelector().resourceId(#{text})")
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
      rid  = resource_id(text, "new UiSelector().resourceId(#{text})")
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
