# encoding: utf-8
module Appium::Ios
  # iOS only. Android uses uiautomator instead of uiautomation.
  # Get an array of attribute values from elements exactly matching tag name.
  # @param tag_name [String] the tag name to find
  # @param attribute [String] the attribute to collect
  # @return [Array<String>] an array of strings containing the attribute from found elements of type tag_name.
  def find_eles_attr tag_name, attribute
    # Use au.lookup(tag_name) instead of $(tag_name)
    # See https://github.com/appium/appium/issues/214
    js = %Q(
        var eles = au.lookup('#{tag_name}');
        var result = [];
        for (var a = 0, length = eles.length; a < length; a++) {
          result.push(eles[a].#{attribute}());
        }
        result
      )

    @driver.execute_script js
  end

  # iOS only. Android doesn't use find_2_eles_attr.
  # Get an array of attribute values from elements exactly matching tag name.
  # @param tag_name_1 [String] the 1st tag name to find
  # @param tag_name_2 [String] the 2nd tag name to find
  # @param attribute [String] the attribute to collect
  # @return [Array<String>] an array of strings containing the attribute from found elements of type tag_name.
  def find_2_eles_attr tag_name_1, tag_name_2, attribute
    # Use au.lookup(tag_name) instead of $(tag_name)
    # See https://github.com/appium/appium/issues/214
    js = %Q(
        var eles = au.lookup('#{tag_name_1}');
        eles = $(eles.concat(au.lookup('#{tag_name_2}')));
        var result = [];
        for (var a = 0, length = eles.length; a < length; a++) {
          result.push(eles[a].#{attribute}());
        }
        result
      )

    @driver.execute_script js
  end

  # iOS only. On Android uiautomator always returns an empty string for EditText password.
  #
  # Password character returned from value of UIASecureTextField
  # @param length [Integer] the length of the password to generate
  # @return [String] the returned string is of size length
  def password length=1
    '•' * length
  end

  # Returns a string of class counts.
  def get_page_class
    r = []
    run_internal = lambda do |node|
      if node.kind_of? Array
        node.each { |node| run_internal.call node }
        return
      end

      keys = node.keys
      return if keys.empty?
      r.push node['type'] if keys.include?('type')

      run_internal.call node['children'] if keys.include?('children')
    end
    json = get_source
    run_internal.call json['children']

    res = []
    r = r.sort
    r.uniq.each do |ele|
      res.push "#{r.count(ele)}x #{ele}\n"
    end
    count_sort = ->(one, two) { two.match(/(\d+)x/)[1].to_i <=> one.match(/(\d+)x/)[1].to_i }
    res.sort(&count_sort).join ''
  end

  def page_class
    puts get_page_class
    nil
  end

  # Returns a string of interesting elements. iOS only.
  #
  # Defaults to inspecting the 1st windows source only.
  # use get_page(get_source) for all window sources
  #
  # @param element [Object] the element to search. omit to search everything
  # @return [String]
  def get_page element=source_window(0)
    lazy_load_strings

    # @private
    def empty ele
      (ele['name'] || ele['label'] || ele['value']) == nil
    end

    # @private
    def fix_space s
      # ints don't respond to force encoding
      return s unless s.respond_to? :force_encoding
      # char code 160 (name, label) vs 32 (value) will break comparison.
      # convert string to binary and remove 160.
      # \xC2\xA0
      s.force_encoding('binary').gsub("\xC2\xA0".force_encoding('binary'), ' ') if s
    end

    unless empty(element)
      puts "#{element['type']}"
      name = fix_space element['name']
      label = fix_space element['label']
      value = fix_space element['value']

      if name == label && name == value
        puts "   name, label, value: #{name}" if name
      elsif name == label
        puts "   name, label: #{name}" if name
        puts "   value: #{value}" if value
      elsif name == value
        puts "   name, value: #{name}" if name
        puts "  label: #{label}" if label
      else
        puts "   name: #{name}" if name
        puts "  label: #{label}" if label
        puts "  value: #{value}" if value
      end

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
    children.each { |c| get_page c } if children
    nil
  end

  # Prints a string of interesting elements to the console.
  # @return [void]
  def page window_number = -1
    if window_number == -1
      # if the 0th window has no children, find the next window that does.
      target_window = source_window 0
      target_window = source_window 1 if target_window['children'].empty?
      get_page target_window
    else
      get_page source_window window_number || 0
    end
    nil
  end

  # Gets the JSON source of window number
  # @param window_number [Integer] the int index of the target window
  # @return [JSON]
  def source_window window_number=0
    execute_script "UIATarget.localTarget().frontMostApp().windows()[#{window_number}].getTree()"
  end

  # Prints parsed page source to console.
  # @param window_number [Integer] the int index of the target window
  # example: page_window 0
  def page_window window_number=0
    get_page source_window window_number
    nil
  end

  # The fastest duration that can be used on iOS.
  # @return [Float]
  def fast_duration
    0.5
  end

  # Find by id. Useful for selendroid
  # @param id [String] the id to search for
  # @return [Element]
  def id id
    lazy_load_strings
    raise "Invalid id `#{id}`" unless @strings_xml[id]
    find_element :id, id
  end
end # module Appium::Ios