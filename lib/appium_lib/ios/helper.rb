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

  # Returns a string of interesting elements. iOS only.
  #
  # @param element [Object] the element to search. omit to search everything
  # @return [String]
  def get_page element=get_source

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
    end

    children = element['children']
    children.each { |c| get_page c } if children
    nil
  end

  # Prints a string of interesting elements to the console.
  # @return [void]
  def page
    get_page
    nil
  end

  # The fastest duration that can be used on iOS.
  # @return [Float]
  def fast_duration
    0.5
  end
end # module Appium::Ios