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
        def tag(class_name, visible = true)
          raise_error_if_no_element tags(class_name, visible).first
        end

        # Returns all visible elements matching class_name
        #
        # @param class_name [String] the class_name to search for
        # @return [Element]
        def tags(class_name, visible = true)
          tags_predicate class_name, visible
        end

        def tag_predicate(class_name, visible = false)
          raise_error_if_no_element tags_predicate(class_name, visible).first
        end

        @private
        def tags_predicate(class_name, visible = false)
          if visible
            find_elements :predicate, %(type == "#{class_name}" && visible == true)
          else
            find_elements :predicate, %(type == "#{class_name}" && visible == false)
          end
        end

        # Returns all visible elements matching class_names and value
        # This method calls find_element/s and element.value/text many times.
        # So, if you set many class_names, this method's performance become worse.
        #
        # @param class_names [Array[String]] the class_names to search for
        # @param value [String] the value to search for
        # @return [Array[Element]]
        def tags_include(class_names:, value: nil, visible: true)
          return unless class_names.is_a? Array

          c_names = class_names.map { |class_name| %(type == "#{class_name}") }.join(' || ')

          predicate = if value
                        %((#{c_names}) && ) +
                            %((name contains[c] "#{value}" || label contains[c] "#{value}" || value contains[c] "#{value}"))
                      else
                        c_names
                      end

          predicate = visible ? %((#{predicate}) && visible == true) : %((#{predicate}) && visible == false)
          @driver.find_elements :predicate, predicate
        end

        # Returns all visible elements matching class_names and value.
        # This method calls find_element/s and element.value/text many times.
        # So, if you set many class_names, this method's performance become worse.
        #
        # @param class_names [Array[String]] the class_names to search for
        # @param value [String] the value to search for
        # @return [Array[Element]]
        def tags_exact(class_names:, value: nil, visible: true)
          return unless class_names.is_a? Array

          c_names = class_names.map { |class_name| %(type == "#{class_name}") }.join(' || ')

          predicate = if value
                        %((#{c_names}) && ) +
                            %((name ==[c] "#{value}" || label ==[c] "#{value}" || value ==[c] "#{value}"))
                      else
                        c_names
                      end

          predicate = visible ? %((#{predicate}) && visible == true) : %((#{predicate}) && visible == false)
          @driver.find_elements :predicate, predicate
        end
      end # module Helper
    end # module Xcuitest
  end # module Ios
end # module Appium
