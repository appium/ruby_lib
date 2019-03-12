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
    module Espresso
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

            # zero index
            _button_visible_selectors_xpath(index: index - 1)
          end

          i = find_elements :xpath, _button_contains_string_xpath(BUTTON, value)
          e = find_elements :xpath, _button_contains_string_xpath(IMAGE_BUTTON, value)

          raise_no_such_element_if_empty(i + e)

          (i + e)[0]
        end

        # Find all buttons containing value.
        # If value is omitted, all buttons are returned.
        # @param value [String] the value to search for
        # @return [Array<Button>]
        def buttons(value = false)
          return _button_visible_selectors_xpath unless value

          i = find_elements :xpath, _button_contains_string_xpath(BUTTON, value)
          e = find_elements :xpath, _button_contains_string_xpath(IMAGE_BUTTON, value)
          i + e
        end

        # Find the first button.
        # @return [Button]
        def first_button
          _button_visible_selectors_xpath(button_index: 0, image_button_index: 0)
        end

        # Find the last button.
        # @return [Button]
        def last_button
          # uiautomator index doesn't support last
          # and it's 0 indexed
          button_index = tags(::Appium::Android::BUTTON).length
          button_index -= 1 if button_index > 0
          image_button_index = tags(::Appium::Android::IMAGE_BUTTON).length
          image_button_index -= 1 if image_button_index > 0

          _button_visible_selectors_xpath(button_index: button_index,
                                          image_button_index: image_button_index)
        end

        # Find the first button that exactly matches value.
        # @param value [String] the value to match exactly
        # @return [Button]
        def button_exact(value)
          i = find_elements :xpath, _button_exact_string_xpath(BUTTON, value)
          e = find_elements :xpath, _button_exact_string_xpath(IMAGE_BUTTON, value)

          raise_no_such_element_if_empty(i + e)

          (i + e)[0]
        end

        # Find all buttons that exactly match value.
        # @param value [String] the value to match exactly
        # @return [Array<Button>]
        def buttons_exact(value)
          i = find_elements :xpath, _button_exact_string_xpath(BUTTON, value)
          e = find_elements :xpath, _button_exact_string_xpath(IMAGE_BUTTON, value)
          i + e
        end

        private

        # @private
        def raise_no_such_element_if_empty(elements)
          raise _no_such_element if elements.empty?

          elements.first
        end

        def _button_visible_selectors_xpath(opts = {})
          button_index       = opts.fetch :button_index, false
          image_button_index = opts.fetch :image_button_index, false

          index = opts.fetch :index, false

          b = find_elements :xpath, "//#{BUTTON}"
          i = find_elements :xpath, "//#{IMAGE_BUTTON}"

          if index
            raise_no_such_element_if_empty(b + i)
            (b + i)[index]
          elsif button_index && image_button_index
            raise_no_such_element_if_empty(b + i)
            b_index = button_index + image_button_index
            (b + i)[b_index]
          else
            b + i
          end
        end

        def _button_exact_string_xpath(class_name, value)
          r_id = resource_id(value, " or @resource-id='#{value}'")
          "//#{class_name}[@text='#{value}' or @content-desc='#{value}'#{r_id}]"
        end

        def _button_contains_string_xpath(class_name, value)
          r_id = resource_id(value, " or @resource-id='#{value}'")
          "//#{class_name}[contains(translate(@text,'#{value.upcase}', '#{value}'), '#{value}')" \
            " or contains(translate(@content-desc,'#{value.upcase}', '#{value}'), '#{value}')#{r_id}]"
        end
      end # module Element
    end # module Espresso
  end # module Android
end # module Appium
