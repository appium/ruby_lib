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
      module Helper
        # @private
        def string_attr_exact(class_name, attr, value)
          if attr == '*'
            %((//#{class_name})[@*[.="#{value}"]])
          else
            %((//#{class_name})[@#{attr}="#{value}"])
          end
        end

        # @private
        def string_attr_include(class_name, attr, value)
          if attr == '*'
            %((//#{class_name})[@*[contains(translate(., "#{value.upcase}", "#{value}"), "#{value}")]])
          else
            %((//#{class_name})[contains(translate(@#{attr}, "#{value.upcase}", "#{value}"), "#{value}")])
          end
        end

        # Get the last tag that matches class_name
        # @param class_name [String] the tag to match
        # @return [Element]
        def last_ele(class_name)
          visible_elements = tags class_name
          raise _no_such_element if visible_elements.empty?

          visible_elements.last
        end

        # Returns the first **visible** element matching class_name
        #
        # @param class_name [String] the class_name to search for
        # @return [Element]
        def tag(class_name)
          raise_error_if_no_element tags(class_name).first
        end

        # Returns all visible elements matching class_name
        #
        # @param class_name [String] the class_name to search for
        # @return [Element]
        def tags(class_name)
          elements = @driver.find_elements :class, class_name
          select_visible_elements elements
        end

        # Returns all visible elements matching class_names and value
        # This method calls find_element/s and element.value/text many times.
        # So, if you set many class_names, this method's performance become worse.
        #
        # @param class_names [Array[String]] the class_names to search for
        # @param value [String] the value to search for
        # @return [Array[Element]]
        def tags_include(class_names:, value: nil)
          return unless class_names.is_a? Array

          c_names = class_names.map { |class_name| %(type == "#{class_name}") }.join(' || ')

          predicate = if value
                        %((#{c_names}) && (name contains[c] "#{value}" || label contains[c] "#{value}" || value contains[c] "#{value}")) # rubocop:disable Metrics/LineLength
                      else
                        c_names
                      end

          elements = @driver.find_elements :predicate, predicate
          select_visible_elements elements
        end

        # Returns all visible elements matching class_names and value.
        # This method calls find_element/s and element.value/text many times.
        # So, if you set many class_names, this method's performance become worse.
        #
        # @param class_names [Array[String]] the class_names to search for
        # @param value [String] the value to search for
        # @return [Array[Element]]
        def tags_exact(class_names:, value: nil)
          return unless class_names.is_a? Array

          c_names = class_names.map { |class_name| %(type == "#{class_name}") }.join(' || ')

          predicate = if value
                        %((#{c_names}) && (name ==[c] "#{value}" || label ==[c] "#{value}" || value ==[c] "#{value}"))
                      else
                        c_names
                      end

          elements = @driver.find_elements :predicate, predicate
          select_visible_elements elements
        end
      end # module Helper
    end # module Xcuitest
  end # module Ios
end # module Appium
