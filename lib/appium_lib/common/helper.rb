# encoding: utf-8
# Generic helper methods not specific
# to a particular tag name
module Appium::Common
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
  # @param max_wait [Integer] the maximum time in seconds to wait for
  # @param interval [Float] the time in seconds to wait after calling the block
  # @param block [Block] the block to call
  # @return [Object] the result of block.call
  def wait max_wait=30, interval=0.5, &block
    # Rescue Timeout::Error: execution expired
    result = nil
    timeout(max_wait) { until (result = begin; block.call; rescue; end) do; sleep interval end }
    result
  end

  # Presses the back button on Android.
  # @return [void]
  def back
    @driver.navigate.back
  end

  # For Sauce Labs reporting
  def session_id
    @driver.session_id
  end

  def sauce_username
    @sauce_username
  end

  def sauce_access_key
    @sauce_access_key
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
    @driver.find_elements :tag_name, tag_name
  end

  # Get the first tag that exactly matches tag and text.
  # @param tag [String] the tag name to match
  # @param text [String] the text to exactly match
  # @return [Element] the element of type tag exactly matching text
  def find_ele_by_text tag, text
    @driver.find_element :xpath, %Q(#{tag}[@text='#{text}'])
  end

  # Get all tags that exactly match tag and text.
  # @param tag [String] the tag name to match
  # @param text [String] the text to exactly match
  # @return [Array<Element>] the elements of type tag exactly matching text
  def find_eles_by_text tag, text
    @driver.find_elements :xpath, %Q(#{tag}[@text='#{text}'])
  end

  # Get the first tag by attribute that exactly matches value.
  # @param tag [String] the tag name to match
  # @param attr [String] the attribute to compare
  # @param value [String] the value of the attribute that the element must include
  # @return [Element] the element of type tag who's attribute includes value
  def find_ele_by_attr_include tag, attr, value
    @driver.find_element :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
  end

  # Get tags by attribute that include value.
  # @param tag [String] the tag name to match
  # @param attr [String] the attribute to compare
  # @param value [String] the value of the attribute that the element must include
  # @return [Array<Element>] the elements of type tag who's attribute includes value
  def find_eles_by_attr_include tag, attr, value
    @driver.find_elements :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
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
    ap get_source
  end

  # Gets a JSON view of the current page
  # @return [JSON]
  def get_source
    JSON.parse(@driver.page_source)
  end

  def find_name name
    find_element :name, name
  end

  def find_names name
    find_elements :name, name
  end
end # module Appium::Common
