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

# Get the element of type tag_name at matching index.
# @param tag_name [String] the tag name to find
# @param index [Integer] the index
# @return [Element] the found element of type tag_name
def ele_index tag_name, index
  $driver.find_element :xpath, %Q(#{tag_name}[@index=#{index}])
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
end

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
end

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
  tag = find_eles tag_name
  tag = tag.first unless tag.nil?
end

# Get the last tag that matches tag_name
# @param tag_name [String] the tag to match
# @return [Element]
def last_ele tag_name
  tag = find_eles tag_name
  tag = tag.last unless tag.nil?
end

# Prints a JSON view of the current page
# @return [void]
def source
  ap JSON.parse($driver.page_source)
end

# iOS only. On Android uiautomator always returns an empty string for EditText password.
#
# Password character returned from value of UIASecureTextField
# @param length [Integer] the length of the password to generate
# @return [String] the returned string is of size length
def password length=1
  '•' * length
end
