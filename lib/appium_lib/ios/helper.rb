module Appium
  module Ios
    # iOS only. On Android uiautomator always returns an empty string for EditText password.
    #
    # Password character returned from value of UIASecureTextField
    # @param length [Integer] the length of the password to generate
    # @return [String] the returned string is of size length
    def ios_password length=1
      '•' * length
    end

    # Returns a string of interesting elements. iOS only.
    #
    # Defaults to inspecting the 1st windows source only.
    # use get_page(get_source) for all window sources
    #
    # @param element [Object] the element to search. omit to search everything
    # @return [String]
    def get_page element=source_window(0), class_name=nil
      lazy_load_strings # populate @strings_xml

      # @private
      def empty ele
        (ele['name'] || ele['label'] || ele['value']) == nil
      end

      # @private
      def fix_space s
        # if s is an int, we can't call .empty
        return nil if s.nil? || (s.respond_to?(:empty) && s.empty?)
        # ints don't respond to force encoding
        # ensure we're converting to a string
        unless s.respond_to? :force_encoding
          s_s = s.to_s
          return s_s.empty? ? nil : s_s
        end
        # char code 160 (name, label) vs 32 (value) will break comparison.
        # convert string to binary and remove 160.
        # \xC2\xA0
        s = s.force_encoding('binary').gsub("\xC2\xA0".force_encoding('binary'), ' ') if s
        s.empty? ? nil : s
      end

      unless empty(element) || element['visible'] == false
        name    = fix_space element['name']
        label   = fix_space element['label']
        value   = fix_space element['value']
        hint    = fix_space element['hint']
        visible = fix_space element['visible']
        type    = fix_space element['type']

        # if class_name is set, mark non-matches as invisible
        visible = (type == class_name).to_s if class_name

        if name == label && name == value
          puts "#{type}" if name || label || value || hint
          puts "   name, label, value: #{name}" if name
          puts "   hint: #{hint}" if hint
        elsif name == label
          puts "#{type}" if name || label || value || hint
          puts "   name, label: #{name}" if name
          puts "   value: #{value}" if value
          puts "   hint: #{hint}" if hint
        elsif name == value
          puts "#{type}" if name || label || value || hint
          puts "   name, value: #{name}" if name
          puts "  label: #{label}" if label
          puts "   hint: #{hint}" if hint
        else
          puts "#{type}" if name || label || value || hint
          puts "   name: #{name}" if name
          puts "  label: #{label}" if label
          puts "  value: #{value}" if value
          puts "   hint: #{hint}" if hint
        end if visible && visible == 'true'

        # there may be many ids with the same value.
        # output all exact matches.
        id_matches = @strings_xml.select do |key, val|
          val == name || val == label || val == value
        end

        if id_matches && id_matches.length > 0
          match_str = ''
          # [0] = key, [1] = value
          id_matches.each do |match|
            match_str += ' ' * 7 + "#{match[0]}\n"
          end
          puts "   id: #{match_str.strip}\n"
        end
      end

      children = element['children']
      children.each { |c| get_page c, class_name } if children
      nil
    end

    # Prints a string of interesting elements to the console.
    # @return [void]
    def page opts={}
      window_number = opts.fetch :window, -1
      class_name    = opts.fetch :class, nil

      if window_number == -1
        # if the 0th window has no children, find the next window that does.
        target_window = source_window 0
        target_window = source_window 1 if target_window['children'].empty?
        get_page target_window, class_name
      else
        get_page source_window(window_number || 0), class_name
      end
      nil
    end

    # Gets the JSON source of window number
    # @param window_number [Integer] the int index of the target window
    # @return [JSON]
    def source_window window_number=0
      # appium 1.0 still returns JSON when getTree() is invoked so this
      # doesn't need to change to XML. If getTree() is removed then
      # source_window will need to parse the results of getTreeForXML()\
      # https://github.com/appium/appium-uiauto/blob/247eb71383fa1a087ff8f8fc96fac25025731f3f/uiauto/appium/element.js#L145
      execute_script "UIATarget.localTarget().frontMostApp().windows()[#{window_number}].getTree()"
    end

    # Prints parsed page source to console.
    # @param window_number [Integer] the int index of the target window
    # example: page_window 0
    def page_window window_number=0
      get_page source_window window_number
      nil
    end

    # Find by id
    # @param id [String] the id to search for
    # @return [Element]
    def id id
      value = resolve_id id
      raise "Invalid id `#{id}`" unless value
      exact    = string_visible_exact '*', value
      contains = string_visible_contains '*', value
      xpath "#{exact} | #{contains}"
    end

    # Return the iOS version as an array of integers
    # @return [Array<Integer>]
    def ios_version
      ios_version = execute_script 'UIATarget.localTarget().systemVersion()'
      ios_version.split('.').map { |e| e.to_i }
    end

    # Get the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index class_name, index
      unless index == 'last()'
        # XPath index starts at 1.
        raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0
      end
      find_element :xpath, %Q(//#{class_name}[@visible="true"][#{index}])
    end

    # @private
    def string_attr_exact class_name, attr, value
      %Q(//#{class_name}[@visible="true" and @#{attr}='#{value}'])
    end

    # Find the first element exactly matching class and attribute value.
    # @param class_name [String] the class name to search for
    # @param attr [String] the attribute to inspect
    # @param value [String] the expected value of the attribute
    # @return [Element]
    def find_ele_by_attr class_name, attr, value
      @driver.find_element :xpath, string_attr_exact(class_name, attr, value)
    end

    # Find all elements exactly matching class and attribute value.
    # @param class_name [String] the class name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must have
    # @return [Array<Element>]
    def find_eles_by_attr class_name, attr, value
      @driver.find_elements :xpath, string_attr_exact(class_name, attr, value)
    end

    # @private
    def string_attr_include class_name, attr, value
      %Q(//#{class_name}[@visible="true" and contains(translate(@#{attr},'#{value.upcase}', '#{value}'), '#{value}')])
    end

    # Get the first tag by attribute that exactly matches value.
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Element] the element of type tag who's attribute includes value
    def find_ele_by_attr_include class_name, attr, value
      @driver.find_element :xpath, string_attr_include(class_name, attr, value)
    end

    # Get tags by attribute that include value.
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Array<Element>] the elements of type tag who's attribute includes value
    def find_eles_by_attr_include class_name, attr, value
      @driver.find_elements :xpath, string_attr_include(class_name, attr, value)
    end

    # Get the first tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele class_name
      # XPath index starts at 1
      ele_index class_name, 1
    end

    # Get the last tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele class_name
      ele_index class_name, 'last()'
    end

    # Returns the first element matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag class_name
      xpath %Q(//#{class_name}[@visible="true"])
    end

    # Returns all elements matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags class_name
      xpaths %Q(//#{class_name}[@visible="true"])
    end

    # @private
    # Returns a string xpath that matches the first element that contains value
    #
    # example: xpath_visible_contains 'UIATextField', 'sign in'
    #
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains element, value
      result     = []
      attributes = %w[name hint label value]

      value_up   = value.upcase
      value_down = value.downcase

      attributes.each do |attribute|
        result << %Q(contains(translate(@#{attribute},"#{value_up}","#{value_down}"), "#{value_down}"))
      end

      result = result.join(' or ')
      result = %Q(@visible="true" and (#{result}))
      "//#{element}[#{result}]"
    end

    # Find the first element that contains value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def xpath_visible_contains element, value
      xpath string_visible_contains element, value
    end

    # Find all elements containing value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def xpaths_visible_contains element, value
      xpaths string_visible_contains element, value
    end

    # @private
    # Create an xpath string to exactly match the first element with target value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact element, value
      result     = []
      attributes = %w[name hint label value]

      attributes.each do |attribute|
        result << %Q(@#{attribute}="#{value}")
      end

      result = result.join(' or ')
      result = %Q(@visible="true" and (#{result}))

      "//#{element}[#{result}]"
    end

    # Find the first element exactly matching value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def xpath_visible_exact element, value
      xpath string_visible_exact element, value
    end

    # Find all elements exactly matching value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def xpaths_visible_exact element, value
      xpaths string_visible_exact element, value
    end
  end # module Ios
end # module Appium