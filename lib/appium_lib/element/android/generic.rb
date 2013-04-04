# encoding: utf-8
if $os == :android
=begin
name, names, text, text should match substring and case insensitive.

In Android //* is used to find partial case insensitive text matches.
//* is not currently implemented in iOS.

find_element :name by default uses a partial case insensitive match.
On iOS the default is an exact name match.
=end

# Return the first element matching text.
# @param text [String] the text to search for
# @return [Element] the first matching element
def text text
  # TODO: Use XPath index once it's implemented
  # https://github.com/appium/appium/issues/295
  texts(text).first
end

# Return all elements matching text.
# @param text [String] the text to search for
# @return [Array<Element>] all matching elements
def texts text
  $driver.find_elements :xpath, "//*[contains(@text, '#{text}')]"
end

# Return the first element matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Element] the first matching element
def name name
  $driver.find_element :name, name
end

# Return all elements matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Array<Element>] all matching elements
def names name
  $driver.find_elements :name, name
end

end # if $os == :android