module Appium
  module Android
    # @private
    # http://nokogiri.org/Nokogiri/XML/SAX.html
    class AndroidElements < Nokogiri::XML::SAX::Document
      # TODO: Support strings.xml ids
      attr_reader :result, :keys

      def filter
        @filter
      end

      # convert to string to support symbols
      def filter= value
        # nil and false disable the filter
        return @filter = false unless value
        @filter = value.to_s.downcase
      end

      def initialize
        reset
        @filter = false
      end

      def reset
        @result = ''
        @keys   = %w[text resource-id content-desc]
      end

      # http://nokogiri.org/Nokogiri/XML/SAX/Document.html
      def start_element name, attrs = []
        return if filter && !name.downcase.include?(filter)

        attributes = {}

        attrs.each do |key, value|
          if keys.include?(key) && !value.empty?
            attributes[key] = value
          end
        end

        string = ''
        text   = attributes['text']
        desc   = attributes['content-desc']
        id     = attributes['resource-id']

        if !text.nil? && text == desc
          string += "  text, desc: #{text}\n"
        else
          string += "  text: #{text}\n" unless text.nil?
          string += "  desc: #{desc}\n" unless desc.nil?
        end
        string  += "  id: #{id}\n" unless id.nil?

        @result += "\n#{name}\n#{string}" unless attributes.empty?
      end
    end # class AndroidElements

    # Android only.
    # Returns a string containing interesting elements.
    # The text, content description, and id are returned.
    # @param class_name [String] the class name to filter on.
    # if false (default) then all classes will be inspected
    # @return [String]
    def get_android_inspect class_name=false
      parser = @android_elements_parser ||= Nokogiri::XML::SAX::Parser.new(AndroidElements.new)

      parser.document.reset
      parser.document.filter = class_name
      parser.parse get_source

      parser.document.result
    end

    # Intended for use with console.
    # Inspects and prints the current page.
    # @opt class [Symbol] the class name to filter on. case insensitive include match.
    # if nil (default) then all classes will be inspected
    # @return [void]
    def page opts={}
      class_name = opts.fetch :class, nil
      puts get_android_inspect class_name
      nil
    end

    # Lists package, activity, and adb shell am start -n value for current app.
    # Works on local host only (not remote).
    # noinspection RubyArgCount
    def current_app
      line = `adb shell dumpsys window windows`.each_line.grep(/mFocusedApp/).first.strip
      pair = line.split(' ').last.gsub('}', '').split '/'
      pkg  = pair.first
      act  = pair.last
      OpenStruct.new(line:     line,
                     package:  pkg,
                     activity: act,
                     am_start: pkg + '/' + act)
    end

    # Find by id
    # @param id [String] the id to search for
    # @return [Element]
    def id id
      value = resolve_id id
      # If the id doesn't resolve in strings.xml then use it as is
      # It's probably a resource id which won't be in strings.xml
      value = id unless value
      exact    = string_visible_exact '*', value
      contains = string_visible_contains '*', value
      xpath "#{exact} | #{contains}"
    end

    # Find the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index class_name, index
      unless index == 'last()'
        # XPath index starts at 1.
        raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0
      end
      find_element :xpath, %Q(//#{class_name}[#{index}])
    end

    # @private
    def string_attr_exact class_name, attr, value
      %Q(//#{class_name}[@#{attr}='#{value}'])
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
      %Q(//#{class_name}[contains(translate(@#{attr},'#{value.upcase}', '#{value}'), '#{value}')])
    end

    # Find the first element by attribute that exactly matches value.
    # @param class_name [String] the class name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Element] the element of type tag who's attribute includes value
    def find_ele_by_attr_include class_name, attr, value
      @driver.find_element :xpath, string_attr_include(class_name, attr, value)
    end

    # Find elements by attribute that include value.
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Array<Element>] the elements of type tag who's attribute includes value
    def find_eles_by_attr_include class_name, attr, value
      @driver.find_elements :xpath, string_attr_include(class_name, attr, value)
    end

    # Find the first element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele class_name
      # XPath index starts at 1
      ele_index class_name, 1
    end

    # Find the last element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele class_name
      ele_index class_name, 'last()'
    end

    # Find the first element of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag class_name
      xpath %Q(//#{class_name})
    end

    # Find all elements of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags class_name
      xpaths %Q(//#{class_name})
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
      attributes = %w[content-desc text]

      value_up   = value.upcase
      value_down = value.downcase

      attributes.each do |attribute|
        result << %Q(contains(translate(@#{attribute},"#{value_up}","#{value_down}"), "#{value_down}"))
      end

      # never partial match on a resource id
      result << %Q(@resource-id="#{value}")

      result = result.join(' or ')

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
      attributes = %w[content-desc resource-id text]

      attributes.each do |attribute|
        result << %Q(@#{attribute}="#{value}")
      end

      result = result.join(' or ')

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
  end # module Android
end # module Appium