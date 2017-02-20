module Appium
  module Ios
    class UITestElementsPrinter < Nokogiri::XML::SAX::Document
      attr_accessor :filter

      def start_element(type, attrs = [])
        return if filter && !filter.eql?(type)
        page = attrs.inject({}) do |hash, attr|
          hash[attr[0]] = attr[1] if %w(name label value hint).include?(attr[0])
          hash
        end
        _print_attr(type, page['name'], page['label'], page['value'], page['hint'])
      end

      def _print_attr(type, name, label, value, hint)
        if name == label && name == value
          puts type.to_s if name || label || value || hint
          puts "   name, label, value: #{name}" if name
        elsif name == label
          puts type.to_s if name || label || value || hint
          puts "   name, label: #{name}" if name
          puts "   value: #{value}" if value
        elsif name == value
          puts type.to_s if name || label || value || hint
          puts "   name, value: #{name}" if name
          puts "  label: #{label}" if label
        else
          puts type.to_s if name || label || value || hint
          puts "   name: #{name}" if name
          puts "  label: #{label}" if label
          puts "  value: #{value}" if value
        end
        puts "   hint: #{hint}" if hint
      end
    end
    # iOS only. On Android uiautomator always returns an empty string for EditText password.
    #
    # Password character returned from value of UIASecureTextField
    # @param length [Integer] the length of the password to generate
    # @return [String] the returned string is of size length
    def ios_password(length = 1)
      8226.chr('UTF-8') * length
    end

    # Returns a string of interesting elements. iOS only.
    #
    # Defaults to inspecting the 1st windows source only.
    # use get_page(get_source) for all window sources
    #
    # @option element [Object] the element to search. omit to search everything
    # @option class_name [String,Symbol] the class name to filter on. case insensitive include match.
    # @return [String]
    def get_page(element = source_window(0), class_name = nil)
      lazy_load_strings # populate @strings_xml
      class_name = class_name.to_s.downcase

      # @private
      def empty(ele)
        (ele['name'] || ele['label'] || ele['value']).nil?
      end

      # @private
      def fix_space(s)
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
        s.empty? ? nil : s.force_encoding('UTF-8')
      end

      unless empty(element) || element['visible'] == false
        name    = fix_space element['name']
        label   = fix_space element['label']
        value   = fix_space element['value']
        hint    = fix_space element['hint']
        visible = fix_space element['visible']
        type    = fix_space element['type']

        # if class_name is set, mark non-matches as invisible
        visible = (type.downcase.include? class_namet).to_s if class_name
        if visible && visible == 'true'

          _print_attr(type, name, label, value, hint)

          # there may be many ids with the same value.
          # output all exact matches.
          attributes = [name, label, value, hint].select { |attr| !attr.nil? }
          partial    = {}
          id_matches = @strings_xml.select do |key, val|
            next if val.nil? || val.empty?
            partial[key] = val if attributes.detect { |attr| attr.include?(val) }
            attributes.detect { |attr| val == attr }
          end

          # If there are no exact matches, display partial matches.
          id_matches = partial if id_matches.empty?

          unless id_matches.empty?
            match_str = ''
            max_len   = id_matches.keys.max_by(&:length).length

            # [0] = key, [1] = val
            id_matches.each do |key, val|
              arrow_space = ' ' * (max_len - key.length).to_i
              match_str += ' ' * 7 + "#{key} #{arrow_space}=> #{val}\n"
            end
            puts "   id: #{match_str.strip}\n"
          end
        end
      end

      children = element['children']
      children.each { |c| get_page c, class_name } if children
      nil
    end

    # Prints a string of interesting elements to the console.
    #
    # Example
    #
    # ```ruby
    # page class: :UIAButton # filter on buttons
    # page window: 1 # show source for window 1
    # page class: :UIAButton, window: 1
    # ```
    #
    # @option window [Integer] window index. -1 for default
    # @option class [Symbol] class name to filter on
    #
    # @return [void]
    def page(opts = {})
      if opts.is_a?(Hash)
        window_number = opts.fetch :window, -1
        class_name    = opts.fetch :class, nil
      else
        window_number = -1
        class_name    = opts
      end
      # current_context may be nil which breaks start_with
      if current_context && current_context.start_with?('WEBVIEW')
        s      = get_source
        parser = @android_html_parser ||= Nokogiri::HTML::SAX::Parser.new(Common::HTMLElements.new)
        parser.document.reset
        parser.document.filter = class_name
        parser.parse s
        parser.document.result
      else

        s = source_window(window_number || 0)
        parser = Nokogiri::XML::SAX::Parser.new(UITestElementsPrinter.new)
        if class_name
          parser.document.filter = class_name.is_a?(Symbol) ? class_name.to_s : class_name
        end
        parser.parse s
        nil
      end
    end

    # Gets the JSON source of window number
    # @param [Integer] _window_number The int index of the target window
    # @return [JSON]
    def source_window(_window_number = 0)
      # TODO: update comments
      # appium 1.0 still returns JSON when getTree() is invoked so this
      # doesn't need to change to XML. If getTree() is removed then
      # source_window will need to parse the elements of getTreeForXML()\
      # https://github.com/appium/appium-uiauto/blob/247eb71383fa1a087ff8f8fc96fac25025731f3f/uiauto/appium/element.js#L145
      get_source
    end

    # Prints parsed page source to console.
    #
    # example: page_window 0
    #
    # @param window_number [Integer] the int index of the target window
    # @return [void]
    def page_window(window_number = 0)
      get_page source_window window_number
      nil
    end

    # Find by id
    # @param id [String] the id to search for
    # @return [Element]
    def id(id)
      find_element(:id, id)
    end

    # Return the iOS version as an array of integers
    # @return [Array<Integer>]
    def ios_version
      if automation_name_is_xcuitest?
        @driver.capabilities['platformVersion']
      else
        ios_version = execute_script 'UIATarget.localTarget().systemVersion()'
        ios_version.split('.').map(&:to_i)
      end
    end

    # Get the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element]
    def ele_index(class_name, index)
      raise 'Index must be >= 1' unless index == 'last()' || (index.is_a?(Integer) && index >= 1)
      elements = tags(class_name)

      if index == 'last()'
        result = elements.last
      else
        # elements array is 0 indexed
        index -= 1
        result = elements[index]
      end

      raise _no_such_element if result.nil?
      result
    end

    # @private
    def string_attr_exact(class_name, attr, value)
      if automation_name_is_xcuitest?
        if attr == '*'
          %((//#{class_name})[@*[.="#{value}"]])
        else
          %((//#{class_name})[@#{attr}="#{value}"])
        end
      else
        %(//#{class_name}[@visible="true" and @#{attr}="#{value}"])
      end
    end

    # Find the first element exactly matching class and attribute value.
    # Note: Uses XPath
    # Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.
    # @param class_name [String] the class name to search for
    # @param attr [String] the attribute to inspect
    # @param value [String] the expected value of the attribute
    # @return [Element]
    def find_ele_by_attr(class_name, attr, value)
      @driver.find_element :xpath, string_attr_exact(class_name, attr, value)
    end

    # Find all elements exactly matching class and attribute value.
    # Note: Uses XPath
    # Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.
    # @param class_name [String] the class name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must have
    # @return [Array<Element>]
    def find_eles_by_attr(class_name, attr, value)
      @driver.find_elements :xpath, string_attr_exact(class_name, attr, value)
    end

    # @private
    def string_attr_include(class_name, attr, value)
      if automation_name_is_xcuitest?
        if attr == '*'
          %((//#{class_name})[@*[contains(translate(., "#{value.upcase}", "#{value}"), "#{value}")]])
        else
          %((//#{class_name})[contains(translate(@#{attr}, "#{value.upcase}", "#{value}"), "#{value}")])
        end
      else
        %(//#{class_name}[@visible="true" and contains(translate(@#{attr},"#{value.upcase}", "#{value}"), "#{value}")])
      end
    end

    # Get the first tag by attribute that exactly matches value.
    # Note: Uses XPath
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Element] the element of type tag who's attribute includes value
    def find_ele_by_attr_include(class_name, attr, value)
      @driver.find_element :xpath, string_attr_include(class_name, attr, value)
    end

    # Get tags by attribute that include value.
    # Note: Uses XPath
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Array<Element>] the elements of type tag who's attribute includes value
    def find_eles_by_attr_include(class_name, attr, value)
      @driver.find_elements :xpath, string_attr_include(class_name, attr, value)
    end

    # Get the first tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele(class_name)
      ele_index class_name, 1
    end

    # Get the last tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele(class_name)
      if automation_name_is_xcuitest?
        visible_elements = tags class_name
        raise _no_such_element if visible_elements.empty?
        visible_elements.last
      else
        ele_index class_name, 'last()'
      end
    end

    # Returns the first **visible** element matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag(class_name)
      if automation_name_is_xcuitest?
        raise_error_if_no_element tags(class_name).first
      else
        ele_by_json(typeArray: [class_name], onlyVisible: true)
      end
    end

    # Returns all visible elements matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags(class_name)
      if automation_name_is_xcuitest?
        elements = @driver.find_elements :class, class_name
        select_visible_elements elements
      else
        eles_by_json(typeArray: [class_name], onlyVisible: true)
      end
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

      class_names.flat_map do |class_name|
        if automation_name_is_xcuitest?
          visible_elements = tags(class_name)
          value ? elements_include(visible_elements, value) : visible_elements
        else
          value ? eles_by_json_visible_contains(class_name, value) : tags(class_name)
        end
      end
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

      class_names.flat_map do |class_name|
        if automation_name_is_xcuitest?
          visible_elements = tags(class_name)
          value ? elements_exact(visible_elements, value) : visible_elements
        else
          value ? eles_by_json_visible_exact(class_name, value) : tags(class_name)
        end
      end
    end

    # @private
    # Returns an object that matches the first element that contains value
    #
    # example: ele_by_json_visible_contains 'UIATextField', 'sign in'
    #
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains(element, value)
      contains = {
        target:      value,
        substring:   true,
        insensitive: true
      }

      {
        typeArray:   [element],
        onlyVisible: true,
        name:        contains,
        label:       contains,
        value:       contains
      }
    end

    # Find the first element that contains value.
    # For Appium(automation name), not XCUITest
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def ele_by_json_visible_contains(element, value)
      ele_by_json string_visible_contains element, value
    end

    # Find all elements containing value
    # For Appium(automation name), not XCUITest
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def eles_by_json_visible_contains(element, value)
      eles_by_json string_visible_contains element, value
    end

    # @private
    # Create an object to exactly match the first element with target value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact(element, value)
      exact = {
        target:      value,
        substring:   false,
        insensitive: false
      }

      {
        typeArray:   [element],
        onlyVisible: true,
        name:        exact,
        label:       exact,
        value:       exact
      }
    end

    # Find the first element exactly matching value
    # For Appium(automation name), not XCUITest
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def ele_by_json_visible_exact(element, value)
      ele_by_json string_visible_exact element, value
    end

    # Find all elements exactly matching value
    # For Appium(automation name), not XCUITest
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def eles_by_json_visible_exact(element, value)
      eles_by_json string_visible_exact element, value
    end

    # @private
    # For Appium(automation name), not XCUITest
    # If there's no keyboard, then do nothing.
    # If there's no close key, fallback to window tap.
    # If close key is present then tap it.
    # @param close_key [String] close key to tap. Default value is 'Done'
    # @return [void]
    def hide_ios_keyboard(close_key = 'Done')
      #
      # TODO: there are many various ways to hide the keyboard that work in different
      # app specific circumstances. webview keyboard will require a window.tap for example.
      #
      # Find the top left corner of the keyboard and move up 10 pixels (origin.y - 10)
      # now swipe down until the end of the window - 10 pixels.
      # -10 to ensure we're not going outside the window bounds.
      #
      # Swiping inside the keyboard will not dismiss it.
      #
      # If the 'Done' key exists then that should be pressed to dismiss the keyboard
      # because swiping to dismiss works only if such key doesn't exist.
      #
      # Don't use window.tap. See https://github.com/appium/appium-uiauto/issues/28
      #
      dismiss_keyboard = <<-JS.strip
      if (!au.mainApp().keyboard().isNil()) {
        var key = au.mainApp().keyboard().buttons()['#{close_key}']
        if (key.isNil()) {
          var startY = au.mainApp().keyboard().rect().origin.y - 10;
          var endY = au.mainWindow().rect().size.height - 10;
          au.flickApp(0, startY, 0, endY);
        } else {
          key.tap();
        }
        au.delay(1000);
      }
      JS

      ignore do
        # wait 5 seconds for a wild keyboard to appear. if the textfield is disabled
        # then setValue will work, however the keyboard will never display
        # because users are normally not allowed to type into it.
        wait_true(5) do
          execute_script '!au.mainApp().keyboard().isNil()'
        end

        # dismiss keyboard
        execute_script dismiss_keyboard
      end

      # wait 5 seconds for keyboard to go away.
      # if the keyboard isn't dismissed then wait_true will error.
      wait_true(5) do
        execute_script 'au.mainApp().keyboard().isNil()'
      end
    end

    #
    # predicate - the predicate to evaluate on the main app
    #
    # visible - if true, only visible elements are returned. default true
    #
    def _all_pred(opts)
      predicate = opts[:predicate]
      raise 'predicate must be provided' unless predicate
      visible = opts.fetch :visible, true
      %($.mainApp().getAllWithPredicate("#{predicate}", #{visible});)
    end

    # returns element matching predicate contained in the main app
    #
    # predicate - the predicate to evaluate on the main app
    #
    # visible - if true, only visible elements are returned. default true
    # @return [Element]
    def ele_with_pred(opts)
      # true = return only visible
      find_element(:uiautomation, _all_pred(opts))
    end

    # returns elements matching predicate contained in the main app
    #
    # predicate - the predicate to evaluate on the main app
    #
    # visible - if true, only visible elements are returned. default true
    # @return [Array<Element>]
    def eles_with_pred(opts)
      find_elements(:uiautomation, _all_pred(opts))
    end

    # Prints xml of the current page
    # @return [void]
    def source
      _print_source get_source
    end

    def _validate_object(*objects)
      raise 'objects must be an array' unless objects.is_a? Array
      objects.each do |obj|
        next unless obj # obj may be nil. if so, ignore.

        valid_keys   = [:target, :substring, :insensitive]
        unknown_keys = obj.keys - valid_keys
        raise "Unknown keys: #{unknown_keys}" unless unknown_keys.empty?

        target = obj[:target]
        raise 'target must be a string' unless target.is_a? String

        substring = obj[:substring]
        raise 'substring must be a boolean' unless [true, false].include? substring

        insensitive = obj[:insensitive]
        raise 'insensitive must be a boolean' unless [true, false].include? insensitive
      end
    end

    # For Appium(automation name), not XCUITest
    # typeArray - array of string types to search for. Example: ["UIAStaticText"]
    # onlyFirst - boolean. returns only the first result if true. Example: true
    # onlyVisible - boolean. returns only visible elements if true. Example: true
    # target - string. the target value to search for. Example: "Buttons, Various uses of UIButton"
    # substring - boolean. matches on substrings if true otherwise an exact mathc is required. Example: true
    # insensitive - boolean. ignores case sensitivity if true otherwise it's case sensitive. Example: true
    #
    # opts = {
    #   typeArray: ["UIAStaticText"],
    #   onlyFirst: true,
    #   onlyVisible: true,
    #   name: {
    #     target: "Buttons, Various uses of UIButton",
    #     substring: false,
    #     insensitive: false,
    #   },
    #   label: {
    #     target: "Buttons, Various uses of UIButton",
    #     substring: false,
    #     insensitive: false,
    #   },
    #   value: {
    #     target: "Buttons, Various uses of UIButton",
    #     substring: false,
    #     insensitive: false,
    #   }
    # }
    #
    def _by_json(opts)
      valid_keys   = [:typeArray, :onlyFirst, :onlyVisible, :name, :label, :value]
      unknown_keys = opts.keys - valid_keys
      raise "Unknown keys: #{unknown_keys}" unless unknown_keys.empty?

      type_array = opts[:typeArray]
      raise 'typeArray must be an array' unless type_array.is_a? Array

      only_first = opts[:onlyFirst]
      raise 'onlyFirst must be a boolean' unless [true, false].include? only_first

      only_visible = opts[:onlyVisible]
      raise 'onlyVisible must be a boolean' unless [true, false].include? only_visible

      # name/label/value are optional. when searching for class only, then none
      # will be present.
      _validate_object opts[:name], opts[:label], opts[:value]

      # note that mainWindow is sometimes nil so it's passed as a param
      # $._elementOrElementsByType will validate that the window isn't nil
      element_or_elements_by_type = <<-JS
        (function() {
          var opts = #{opts.to_json};
          var result = false;

          try {
            result = $._elementOrElementsByType($.mainWindow(), opts);
          } catch (e) {
          }

          return result;
        })();
      JS

      res = execute_script element_or_elements_by_type
      res ? res : raise(Appium::Ios::CommandError, 'mainWindow is nil')
    end

    # For Appium(automation name), not XCUITest
    # example usage:
    #
    # eles_by_json({
    #   typeArray: ["UIAStaticText"],
    #   onlyVisible: true,
    #   name: {
    #     target: "Buttons, Various uses of UIButton",
    #     substring: false,
    #     insensitive: false,
    #   },
    # })
    def eles_by_json(opts)
      opts[:onlyFirst] = false
      _by_json opts
    end

    # see eles_by_json
    def ele_by_json(opts)
      opts[:onlyFirst] = true
      result           = _by_json(opts).first
      raise _no_such_element if result.nil?
      result
    end

    # Returns XML string for the current page
    # Same as driver.page_source
    # @return [String]
    def get_source
      @driver.page_source
    end
  end # module Ios
end # module Appium
