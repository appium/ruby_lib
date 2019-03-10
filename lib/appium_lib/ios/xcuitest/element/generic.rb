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
