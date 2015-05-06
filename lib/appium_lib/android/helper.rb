module Appium
  module Android
    # @private
    # http://nokogiri.org/Nokogiri/XML/SAX.html
    class AndroidElements < Nokogiri::XML::SAX::Document
      attr_reader :result, :keys, :instance, :filter

      # convert to string to support symbols
      def filter=(value)
        # nil and false disable the filter
        return @filter = false unless value
        @filter = value.to_s.downcase
      end

      def initialize
        reset
        @filter   = false
        @instance = Hash.new(-1)
      end

      def reset
        @result   = ''
        @keys     = %w(text resource-id content-desc)
        @instance = Hash.new(-1)
      end

      # http://nokogiri.org/Nokogiri/XML/SAX/Document.html
      def start_element(name, attrs = [])
        return if filter && !name.downcase.include?(filter)

        # instance numbers start at 0.
        number = instance[name] += 1

        attributes = {}

        attrs.each do |key, value|
          attributes[key] = value if keys.include?(key) && !value.empty?
        end

        # scoped to: text resource-id content-desc
        attributes_values = attributes.values
        strings           = $driver.lazy_load_strings
        id_matches        = []

        unless strings.empty?
          id_matches = strings.select do |_key, value|
            attributes_values.include? value
          end
        end

        string_ids = nil

        if id_matches && id_matches.length > 0
          space_suffix = ' ' * '  strings.xml: '.length
          string_ids   = ''

          # add first
          string_ids += "#{id_matches.shift[0]}\n"

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
        string += "  id: #{id}\n" unless id.nil?
        string += "  strings.xml: #{string_ids}" unless string_ids.nil?

        @result += "\n#{name} (#{number})\n#{string}" unless attributes.empty?
      end
    end # class AndroidElements

    # Fix uiautomator's xml dump.
    # https://github.com/appium/appium/issues/2822
    # https://code.google.com/p/android/issues/detail?id=74143
    def _fix_android_native_source(source)
      # <android.app.ActionBar$Tab
      # <android.app.ActionBar  $  Tab

      # find each closing tag that contains a dollar sign.
      source.scan(/<\/([^>]*\$[^>]*)>/).flatten.uniq.each do |problem_tag|
        # "android.app.ActionBar$Tab"
        before, after = problem_tag.split('$')
        before.strip!
        after.strip!

        fixed = "#{before}.#{after}"

        # now escape . in before/after because they're used in regex
        before.gsub!('.', '\.')
        after.gsub!('.', '\.')

        #  <android.app.ActionBar$Tab   => <android.app.ActionBar.Tab
        # </android.app.ActionBar$Tab> => </android.app.ActionBar.Tab>
        source = source.gsub(/<#{before}\s*\$\s*#{after}/,
                             "<#{fixed}").gsub(/<\/#{before}\s*\$\s*#{after}>/, "</#{fixed}>")
      end

      source
    end

    # Prints xml of the current page
    # @return [void]
    def source
      _print_source get_source
    end

    # Android only.
    # Returns a string containing interesting elements.
    # The text, content description, and id are returned.
    # @param class_name [String] the class name to filter on.
    # if false (default) then all classes will be inspected
    # @return [String]
    def get_android_inspect(class_name = false)
      source = get_source

      doctype_string = '<!doctyp'
      source_header  = source[0..doctype_string.length].downcase
      source_is_html = source_header.start_with?(doctype_string, '<html')

      if source_is_html # parse html from webview
        parser = @android_html_parser ||= Nokogiri::HTML::SAX::Parser.new(Common::HTMLElements.new)
      else
        parser = @android_native_parser ||= Nokogiri::XML::SAX::Parser.new(AndroidElements.new)
      end
      parser.document.reset # ensure document is reset before parsing
      parser.document.filter = class_name
      parser.parse source
      result = parser.document.result
      parser.document.reset # clean up any created objects after parsing
      result
    end

    # Intended for use with console.
    # Inspects and prints the current page.
    # Will return XHTML for Web contexts because of a quirk with Nokogiri.
    # @option class [Symbol] the class name to filter on. case insensitive include match.
    # if nil (default) then all classes will be inspected
    # @return [void]
    def page(opts = {})
      class_name = opts.is_a?(Hash) ? opts.fetch(:class, nil) : opts
      puts get_android_inspect class_name
      nil
    end

    # Lists package, activity, and adb shell am start -n value for current app.
    # Works on local host only (not remote).

    # example line:
    # "mFocusedApp=AppWindowToken{b1420058 token=Token{b128add0
    #  ActivityRecord{b1264d10 u0 com.example.android.apis/.ApiDemos t23}}}"
    def current_app
      line = `adb shell dumpsys window windows`.each_line.grep(/mFocusedApp/).first.strip

      _parse_current_app_line line
    end

    # @private
    # noinspection RubyArgCount
    def _parse_current_app_line(line)
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
    def id(id)
      # Android auto resolves strings.xml ids
      find_element :id, id
    end

    # Find all matching elements by id
    # @param id [String] the id to search for
    # @return [Element]
    def ids(id)
      # Android auto resolves strings.xml ids
      find_elements :id, id
    end

    # Find the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index(class_name, index)
      results = tags(class_name)
      if index == 'last()'
        index = results.length
        index -= 1 if index >= 0
      else
        fail 'Index must be >= 1' unless index >= 1
        index -= 1 if index >= 1
      end

      # uiautomator has issues with index/instance so calculate the index
      # client side.
      results[index]
    end

    # Find the first element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele(class_name)
      tag(class_name)
    end

    # Find the last element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele(class_name)
      ele_index class_name, 'last()'
    end

    # Find the first element of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag(class_name)
      find_element :class, class_name
    end

    # Find all elements of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags(class_name)
      find_elements :class, class_name
    end

    # @private
    # Detects if the string represents a resourceId
    # resourceId is only supported on API >= 18 devices
    #
    # @param string [String] the string check for a resourceId
    #                        value will be auto unquoted
    # @param on_match [String] the string to return on resourceId match
    #
    # @return [String] empty string on failure, on_match on successful match
    def _resource_id(string, on_match)
      return '' unless string

      # unquote the string
      # "com.example.Test:id/enter" -> com.example.Test:id/enter
      unquote = string.match(/"(.+)"/)
      string = unquote[1] if unquote

      # java_package : type / name
      #
      # com.example.Test:id/enter
      #
      # ^[a-zA-Z_]      - Java package must start with letter or underscore
      # [a-zA-Z0-9\._]* - Java package may contain letters, numbers, periods and underscores
      # :               - : ends the package and starts the type
      # [^\/]+          - type is made up of at least one non-/ characters
      # \\/             - / ends the type and starts the name
      # [\S]+$          - the name contains at least one non-space character and then the line is ended
      resource_id = /^[a-zA-Z_][a-zA-Z0-9\._]*:[^\/]+\/[\S]+$/
      string.match(resource_id) ? on_match : ''
    end

    # Returns a string that matches the first element that contains value
    #
    # example: complex_find_contains 'UIATextField', 'sign in'
    #
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains(class_name, value)
      value = %("#{value}")

      if class_name == '*'
        return _resource_id(value, "new UiSelector().resourceId(#{value});") +
          "new UiSelector().descriptionContains(#{value});" \
          "new UiSelector().textContains(#{value});"
      end

      class_name = %("#{class_name}")

      _resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
        "new UiSelector().className(#{class_name}).descriptionContains(#{value});" \
        "new UiSelector().className(#{class_name}).textContains(#{value});"
    end

    # Find the first element that contains value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_contains(element, value)
      find_element :uiautomator, string_visible_contains(element, value)
    end

    # Find all elements containing value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def complex_finds_contains(element, value)
      find_elements :uiautomator, string_visible_contains(element, value)
    end

    # @private
    # Create an string to exactly match the first element with target value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact(class_name, value)
      value = %("#{value}")

      if class_name == '*'
        return _resource_id(value, "new UiSelector().resourceId(#{value});") +
          "new UiSelector().description(#{value});" \
          "new UiSelector().text(#{value});"
      end

      class_name = %("#{class_name}")

      _resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
        "new UiSelector().className(#{class_name}).description(#{value});" \
        "new UiSelector().className(#{class_name}).text(#{value});"
    end

    # Find the first element exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_exact(class_name, value)
      find_element :uiautomator, string_visible_exact(class_name, value)
    end

    # Find all elements exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_finds_exact(class_name, value)
      find_elements :uiautomator, string_visible_exact(class_name, value)
    end

    # Returns XML string for the current page
    # Fixes uiautomator's $ in node names.
    # `android.app.ActionBar$Tab` becomes `android.app.ActionBar.Tab`
    # @return [String]
    def get_source
      src = @driver.page_source
      src = _fix_android_native_source src unless src && src.start_with?('<html>')
      src
    end
  end # module Android
end # module Appium
