module Appium
  module Ios
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

        # TODO: Rubocop warning cleanup
        # rubocop:disable Metrics/BlockNesting

        # if class_name is set, mark non-matches as invisible
        visible = (type.downcase.include?(class_name)).to_s if class_name
        if visible && visible == 'true'
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
          end
          # rubocop:enable Metrics/BlockNesting

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
    end

    # Gets the JSON source of window number
    # @param window_number [Integer] the int index of the target window
    # @return [JSON]
    def source_window(window_number = 0)
      # appium 1.0 still returns JSON when getTree() is invoked so this
      # doesn't need to change to XML. If getTree() is removed then
      # source_window will need to parse the elements of getTreeForXML()\
      # https://github.com/appium/appium-uiauto/blob/247eb71383fa1a087ff8f8fc96fac25025731f3f/uiauto/appium/element.js#L145
      execute_script "UIATarget.localTarget().frontMostApp().windows()[#{window_number}].getTree()"
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
      find_element :id, id
    end

    # Return the iOS version as an array of integers
    # @return [Array<Integer>]
    def ios_version
      ios_version = execute_script 'UIATarget.localTarget().systemVersion()'
      ios_version.split('.').map(&:to_i)
    end

    # Get the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element]
    def ele_index(class_name, index)
      fail 'Index must be >= 1' unless index == 'last()' || (index.is_a?(Integer) && index >= 1)
      elements = tags(class_name)

      if index == 'last()'
        result = elements.last
      else
        # elements array is 0 indexed
        index -= 1
        result = elements[index]
      end

      fail _no_such_element if result.nil?
      result
    end

    # @private
    def string_attr_exact(class_name, attr, value)
      %(//#{class_name}[@visible="true" and @#{attr}='#{value}'])
    end

    # Find the first element exactly matching class and attribute value.
    # Note: Uses XPath
    # @param class_name [String] the class name to search for
    # @param attr [String] the attribute to inspect
    # @param value [String] the expected value of the attribute
    # @return [Element]
    def find_ele_by_attr(class_name, attr, value)
      @driver.find_element :xpath, string_attr_exact(class_name, attr, value)
    end

    # Find all elements exactly matching class and attribute value.
    # Note: Uses XPath
    # @param class_name [String] the class name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must have
    # @return [Array<Element>]
    def find_eles_by_attr(class_name, attr, value)
      @driver.find_elements :xpath, string_attr_exact(class_name, attr, value)
    end

    # @private
    def string_attr_include(class_name, attr, value)
      %(//#{class_name}[@visible="true" and contains(translate(@#{attr},'#{value.upcase}', '#{value}'), '#{value}')])
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
      # XPath index starts at 1
      ele_index class_name, 1
    end

    # Get the last tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele(class_name)
      ele_index class_name, 'last()'
    end

    # Returns the first visible element matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag(class_name)
      ele_by_json(
        typeArray:   [class_name],
        onlyVisible: true
      )
    end

    # Returns all visible elements matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags(class_name)
      eles_by_json(
        typeArray:   [class_name],
        onlyVisible: true
      )
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

    # Find the first element that contains value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def ele_by_json_visible_contains(element, value)
      ele_by_json string_visible_contains element, value
    end

    # Find all elements containing value
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
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def ele_by_json_visible_exact(element, value)
      ele_by_json string_visible_exact element, value
    end

    # Find all elements exactly matching value
    # @param element [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def eles_by_json_visible_exact(element, value)
      eles_by_json string_visible_exact element, value
    end

    # @private
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
      dismiss_keyboard = (<<-JS).strip
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
      fail 'predicate must be provided' unless predicate
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
      fail 'objects must be an array' unless objects.is_a? Array
      objects.each do |obj|
        next unless obj # obj may be nil. if so, ignore.

        valid_keys   = [:target, :substring, :insensitive]
        unknown_keys = obj.keys - valid_keys
        fail "Unknown keys: #{unknown_keys}" unless unknown_keys.empty?

        target = obj[:target]
        fail 'target must be a string' unless target.is_a? String

        substring = obj[:substring]
        fail 'substring must be a boolean' unless [true, false].include? substring

        insensitive = obj[:insensitive]
        fail 'insensitive must be a boolean' unless [true, false].include? insensitive
      end
    end

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
      fail "Unknown keys: #{unknown_keys}" unless unknown_keys.empty?

      type_array = opts[:typeArray]
      fail 'typeArray must be an array' unless type_array.is_a? Array

      only_first = opts[:onlyFirst]
      fail 'onlyFirst must be a boolean' unless [true, false].include? only_first

      only_visible = opts[:onlyVisible]
      fail 'onlyVisible must be a boolean' unless [true, false].include? only_visible

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
      res ? res : fail(Selenium::Client::CommandError, 'mainWindow is nil')
    end

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
      fail _no_such_element if result.nil?
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
