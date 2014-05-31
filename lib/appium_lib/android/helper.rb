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

        # scoped to: text resource-id content-desc
        attributes_values = attributes.values
        id_matches        = $driver.lazy_load_strings.select do |key, value|
          attributes_values.include? value
        end

        string_ids = nil

        if id_matches && id_matches.length > 0
          space_suffix = ' ' * '  strings.xml: '.length
          string_ids   = ''

          # add first
          string_ids   += "#{id_matches.shift[0]}\n"

          # use padding for remaining values
          # [0] = key, [1] = value
          id_matches.each do |match|
            string_ids += "#{space_suffix}#{match[0]}\n"
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
        string  += "  strings.xml: #{string_ids}" unless string_ids.nil?

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
      source = get_source
      if source.start_with? '<html>'
        parser = @android_html_parser ||= Nokogiri::HTML::SAX::Parser.new(Common::HTMLElements.new)
      else
        parser = @android_webview_parser ||= Nokogiri::XML::SAX::Parser.new(AndroidElements.new)
      end
      parser.document.reset
      parser.document.filter = class_name
      parser.parse source
      parser.document.result
    end

    # Intended for use with console.
    # Inspects and prints the current page.
    # Will return XHTML for Web contexts because of a quirk with Nokogiri.
    # @option class [Symbol] the class name to filter on. case insensitive include match.
    # if nil (default) then all classes will be inspected
    # @return [void]
    def page opts={}
      class_name = opts.is_a?(Hash) ? opts.fetch(:class, nil) : opts
      puts get_android_inspect class_name
      nil
    end

    # Lists package, activity, and adb shell am start -n value for current app.
    # Works on local host only (not remote).

    # example line:
    # "mFocusedApp=AppWindowToken{b1420058 token=Token{b128add0 ActivityRecord{b1264d10 u0 com.example.android.apis/.ApiDemos t23}}}"
    def current_app
      line = `adb shell dumpsys window windows`.each_line.grep(/mFocusedApp/).first.strip

      _parse_current_app_line line
    end

    # @private
    # noinspection RubyArgCount
    def _parse_current_app_line line
      match = line.match(/ ([^\/ ]+\/[^ }]+)[ }]/)
      return nil unless match && match[1]

      pair = match[1].split '/'
      pkg  = pair.first
      act  = pair.last
      OpenStruct.new(line:     line,
                     package:  pkg,
                     activity: act,
                     am_start: pkg + '/' + act)
    end

    # Find the first matching element by id
    # @param id [String] the id to search for
    # @return [Element]
    def id id
      # Android auto resolves strings.xml ids
      find_element :id, id
    end

    # Find all matching elements by id
    # @param id [String] the id to search for
    # @return [Element]
    def ids id
      # Android auto resolves strings.xml ids
      find_elements :id, value
    end

    # Find the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index class_name, index
      if index == 'last()'
        index = tags(class_name).length
        index -= 1 if index >= 0
      else
        raise 'Index must be >= 1' unless index >= 1
        index -= 1 if index >= 1
      end
      complex_find [[[4, class_name], [9, index]]]
    end

    # Find the first element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele class_name
      tag(class_name)
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
      find_element :class, class_name
    end

    # Find all elements of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags class_name
      find_elements :class, class_name
    end

    # @private
    # Returns a string that matches the first element that contains value
    #
    # example: complex_find_contains 'UIATextField', 'sign in'
    #
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains class_name, value
      #  4  = className(String className)
      # 29  = resourceId(String id
      #  7  = descriptionContains(String desc)
      #  3  = textContains(String text)
      # todo: textContains isn't case insensitive
      # descriptionContains is case insensitive

      if class_name == '*'
        return [
          # resourceId()
          [[29, value]],
          # descriptionContains()
          [[7, value]],
          # textContains()
          [[3, value]]
        ]
      end

      [
        # className().resourceId()
        [[4, class_name], [29, value]],
        # className().descriptionContains()
        [[4, class_name], [7, value]],
        # className().textContains()
        [[4, class_name], [3, value]]
      ]
    end

    # Find the first element that contains value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_contains element, value
      complex_find string_visible_contains element, value
    end

    # Find all elements containing value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def complex_finds_contains element, value
      complex_find mode: 'all', selectors: string_visible_contains(element, value)
    end

    # @private
    # Create an string to exactly match the first element with target value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact class_name, value
      #  4  = className(String className)
      # 29  = resourceId(String id
      #  5  = description(String desc)
      #  1  = text(String text)

      if class_name == '*'
        return [
          # resourceId()
          [[29, value]],
          # description()
          [[5, value]],
          # text()
          [[1, value]]
        ]
      end

      [
        # className().resourceId()
        [[4, class_name], [29, value]],
        # className().description()
        [[4, class_name], [5, value]],
        # className().text()
        [[4, class_name], [1, value]]
      ]
    end

    # Find the first element exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_exact class_name, value
      complex_find string_visible_exact class_name, value
    end

    # Find all elements exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_finds_exact class_name, value
      complex_find mode: 'all', selectors: string_visible_exact(class_name, value)
    end
  end # module Android
end # module Appium