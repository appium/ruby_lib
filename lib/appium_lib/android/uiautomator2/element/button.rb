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
      module Element
        # Find the first button that contains value or by index.
        # @param value [String, Integer] the value to exactly match.
        # If int then the button at that index is returned.
        # @return [Button]
        def button(value)
          # Don't use ele_index because that only works on one element type.
          # Android needs to combine button and image button to match iOS.
          if value.is_a? Numeric
            index = value
            raise "#{index} is not a valid index. Must be >= 1" if index <= 0

            result = find_elements :uiautomator, _button_visible_selectors(index: index)
            raise _no_such_element if result.empty?

            return result[value - 1]
          end

          elements = find_elements :uiautomator, _button_contains_string(value)
          raise_no_such_element_if_empty(elements)
        end

        # Find all buttons containing value.
        # If value is omitted, all buttons are returned.
        # @param value [String] the value to search for
        # @return [Array<Button>]
        def buttons(value = false)
          return find_elements :uiautomator, _button_visible_selectors unless value

          find_elements :uiautomator, _button_contains_string(value)
        end

        # Find the first button.
        # @return [Button]
        def first_button
          elements = find_elements :uiautomator, _button_visible_selectors(button_index: 0, image_button_index: 0)
          raise_no_such_element_if_empty(elements)
        end

        # Find the last button.
        # @return [Button]
        def last_button
          # uiautomator index doesn't support last
          # and it's 0 indexed
          button_index = tags(::Appium::Android::Button).length
          button_index -= 1 if button_index > 0
          image_button_index = tags(::Appium::Android::ImageButton).length
          image_button_index -= 1 if image_button_index > 0

          elements = find_elements :uiautomator,
                                   _button_visible_selectors(button_index: button_index,
                                                             image_button_index: image_button_index)
          raise_no_such_element_if_empty(elements)
        end

        # Find the first button that exactly matches value.
        # @param value [String] the value to match exactly
        # @return [Button]
        def button_exact(value)
          elements = find_elements :uiautomator, _button_exact_string(value)
          raise_no_such_element_if_empty(elements)
        end

        # Find all buttons that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<Button>]
        def buttons_exact(value)
          find_elements :uiautomator, _button_exact_string(value)
        end

        private

        # @private
        def raise_no_such_element_if_empty(elements)
          raise _no_such_element if elements.empty?

          elements.first
        end

        # @private
        def _button_visible_selectors(opts = {})
          button_index       = opts.fetch :button_index, false
          image_button_index = opts.fetch :image_button_index, false

          if button_index && image_button_index
            "new UiSelector().className(#{::Appium::Android::Button}).instance(#{button_index});" \
        "new UiSelector().className(#{::Appium::Android::ImageButton}).instance(#{image_button_index});"
          else
            "new UiSelector().className(#{::Appium::Android::Button});" \
        "new UiSelector().className(#{::Appium::Android::ImageButton});"
          end
        end

        # @private
        def _button_exact_string(value)
          button       = string_visible_exact ::Appium::Android::Button, value
          image_button = string_visible_exact ::Appium::Android::ImageButton, value
          button + image_button
        end

        # @private
        def _button_contains_string(value)
          button       = string_visible_contains ::Appium::Android::Button, value
          image_button = string_visible_contains ::Appium::Android::ImageButton, value
          button + image_button
        end
      end # module Element
    end # module Uiautomator2
  end # module Android
end # module Appium
