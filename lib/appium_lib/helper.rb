# encoding: utf-8
# Generic helper methods not specific
# to a particular tag name

# json and ap are required for the source method.
require 'json'
require 'ap' # awesome print
require 'timeout' # for wait

# iOS .name returns the accessibility attribute if it's set. if not set, the string value is used.
# Android .name returns the accessibility attribute and nothing if it's not set.
#
# .text should be cross platform so prefer that over name, unless both
# Android and iOS have proper accessibility attributes.
# .text and .value should be the same so use .text over .value.
#
# secure tag_name is iOS only because it can't be implemented using uiautomator for Android.
#
# find_element :text doesn't work so use XPath to find by text.

# Check every 0.5 seconds to see if block.call is true.
# Give up after 30 seconds.
# @param block [Block] the block to call
# @return [Object] the result of block.call
def wait &block
  # Rescue Timeout::Error: execution expired
  result = nil
  timeout(30) { while(!(result = begin;block.call;rescue;end)) do; sleep(0.5) end }
  result
end

# Presses the back button on Android.
# @return [void]
def back
  $driver.navigate.back
end

def xpath xpath_str
  find_element :xpath, xpath_str
end

def xpaths xpath_str
  find_elements :xpath, xpath_str
end

# Get the element of type tag_name at matching index.
# @param tag_name [String] the tag name to find
# @param index [Integer] the index
# @return [Element] the found element of type tag_name
def ele_index tag_name, index
  # XPath index starts at 1. ruby_lib index starts at 0
  find_element :xpath, "//#{tag_name}[#{index + 1}]"
end

# Get all elements exactly matching tag name
# @param tag_name [String] the tag name to find
# @return [Array<Element>] the found elements of type tag_name
def find_eles tag_name
  $driver.find_elements :tag_name, tag_name
end

# iOS only. Android uses uiautomator instead of uiautomation.
# Get an array of attribute values from elements exactly matching tag name.
# @param tag_name [String] the tag name to find
# @param attribute [String] the attribute to collect
# @result [Array<String>] an array of strings containing the attribute from found elements of type tag_name.
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

  $driver.execute_script js
end if $os == :ios

# Returns an array of android classes that match the tag name
def tag_name_to_android tag_name
  tag_name = tag_name.to_s.downcase.strip

  def prefix *tags
    tags.map!{ |tag| "android.widget.#{tag}" }
  end

  # must match names in AndroidElementClassMap (Appium's Java server)
  case tag_name
    when 'button'
      prefix 'Button', 'ImageButton'
    when 'text'
      prefix 'TextView'
    when 'list'
      prefix 'ListView'
    when 'frame'
      prefix 'FrameLayout'
    when 'linear'
      prefix 'LinearLayout'
    when 'textfield'
      prefix 'EditText'
  end # return result of case
end

def find_eles_attr tag_name, attribute
=begin
sel1 = [ [4, 'android.widget.Button'], [100] ]
sel2 = [ [4, 'android.widget.ImageButton'], [100] ]

args = [ 'all', sel1, sel2 ]

mobile :find, args
=end
  array = ['all']

  tag_name_to_android(tag_name).each do |name|
    # on android, assume the attr is name (which falls back to text).
    # sel.className(name).getStringAttribute("name")
    array.push [ [4, name], [100] ]
  end

  mobile :find, array
end if $os == :android

# iOS only. Android uses uiautomator instead of uiautomation.
# Get an array of attribute values from elements exactly matching tag name.
# @param tag_name_1 [String] the 1st tag name to find
# @param tag_name_2 [String] the 2nd tag name to find
# @param attribute [String] the attribute to collect
# @result [Array<String>] an array of strings containing the attribute from found elements of type tag_name.
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

  $driver.execute_script js
end if $os == :ios # Android doesn't use find_2_eles_attr

# Get the first tag that exactly matches tag and text.
# @param tag [String] the tag name to match
# @param text [String] the text to exactly match
# @return [Element] the element of type tag exactly matching text
def find_ele_by_text tag, text
  $driver.find_element :xpath, %Q(#{tag}[@text='#{text}'])
end

# Get all tags that exactly match tag and text.
# @param tag [String] the tag name to match
# @param text [String] the text to exactly match
# @return [Array<Element>] the elements of type tag exactly matching text
def find_eles_by_text tag, text
  $driver.find_elements :xpath, %Q(#{tag}[@text='#{text}'])
end

# Get the first tag by attribute that exactly matches value.
# @param tag [String] the tag name to match
# @param attr [String] the attribute to compare
# @param value [String] the value of the attribute that the element must include
# @return [Element] the element of type tag who's attribute includes value
def find_ele_by_attr_include tag, attr, value
  $driver.find_element :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
end

# Get tags by attribute that include value.
# @param tag [String] the tag name to match
# @param attr [String] the attribute to compare
# @param value [String] the value of the attribute that the element must include
# @return [Array<Element>] the elements of type tag who's attribute includes value
def find_eles_by_attr_include tag, attr, value
  $driver.find_elements :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
end

# Get the first tag that includes text.
# @param tag [String] the tag name to match
# @param text [String] the text the element must include
# @return [Element] the element of type tag that includes text
# element.attribute(:text).include? text
def find_ele_by_text_include tag, text
  find_ele_by_attr_include tag, :text, text
end

# Get the tags that include text.
# @param tag [String] the tag name to match
# @param text [String] the text the element must include
# @return [Array<Element>] the elements of type tag that includes text
# element.attribute(:text).include? text
def find_eles_by_text_include tag, text
  find_eles_by_attr_include tag, :text, text
end

# Get the first tag that matches tag_name
# @param tag_name [String] the tag to match
# @return [Element]
def first_ele tag_name
  # XPath index starts at 1
  find_element :xpath, "//#{tag_name}[1]"
end

# Get the last tag that matches tag_name
# @param tag_name [String] the tag to match
# @return [Element]
def last_ele tag_name
  xpath "//#{tag_name}[last()]"
end

# Prints a JSON view of the current page
# @return [void]
def source
  ap JSON.parse($driver.page_source)
end

# Gets a JSON view of the current page
# @return [JSON]
def get_source
  JSON.parse($driver.page_source)
end

# iOS only. On Android uiautomator always returns an empty string for EditText password.
#
# Password character returned from value of UIASecureTextField
# @param length [Integer] the length of the password to generate
# @return [String] the returned string is of size length
def password length=1
  '•' * length
end

# Android only.
def get_inspect
  def run node
    r = []

    run_internal = lambda do |node|
      if node.kind_of? Array
        node.each { |node| run_internal.call node }
        return
      end

      keys = node.keys
      return if keys.empty?
      
      obj = {}
      obj.merge!( { desc: node["@content-desc"] } ) if keys.include?("@content-desc") && !node["@content-desc"].empty?
      obj.merge!( { text: node["@text"] } ) if keys.include?("@text") && !node["@text"].empty?
      obj.merge!( { class: node["@class"] } ) if keys.include?("@class") && !obj.empty?

      r.push obj if !obj.empty?
      run_internal.call node['node'] if keys.include?('node')
    end

    run_internal.call node
    r
  end

  json = JSON.parse($driver.page_source)
  node = json['hierarchy']
  results = run node

  out = ''
  results.each { |e|
    out += e[:class].split('.').last + "\n"

    out += "  class: #{e[:class]}\n"
    if ( e[:text] == e[:desc] )
      out += "  text, name: #{e[:text]}\n" unless e[:text].nil?
    else
      out += "  text: #{e[:text]}\n" unless e[:text].nil?
      out += "  name: #{e[:desc]}\n" unless e[:desc].nil?
    end
  }
  out
end if $os == :android

# Android only. Intended for use with console.
# Inspects and prints the current page.
def page
  puts get_inspect
  nil
end if $os == :android

def page element

  def empty ele
    (ele['name'] || ele['label'] || ele['value']) == nil
  end

  def fix_space s
    # char code 160 (name, label) vs 32 (value) will break comparison.
    # convert string to binary and remove 160.
    # \xC2\xA0
    s.force_encoding('binary').gsub("\xC2\xA0".force_encoding('binary'), ' ') if s
  end

  if ! empty( element )
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
  children.each { |c| page c } if children
  nil
end if $os == :ios

# JavaScript code from https://github.com/appium/appium/blob/master/app/android.js
#
# Math.round((duration * 1000) / 200)
# (.20 * 1000) / 200 = 1
#
# We want steps to be exactly 1. If it's zero then a tap is used instead of a swipe.
def fast_duration
  0.20
end
