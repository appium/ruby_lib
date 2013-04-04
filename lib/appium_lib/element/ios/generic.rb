# encoding: utf-8
if $os == :ios
=begin
name, names, text, text should match substring and case insensitive.

iOS .name() is the accessibility attribute. If not defined, then .label() is used instead.
This differs from Android where name (the content description) is empty when not set.
=end

# Return the first element matching text.
# @param text [String] the text to search for
# @return [Element] the first matching element
def text text
  # returnElems requires a wrapped $(element).
  js = %Q(
    var element = $(au.mainWindow.elements().firstWithPredicate("name contains[c] '#{text}'"));
    au._returnElems(element);
  )

  execute_script(js).first
end

# Return all elements matching text.
# @param text [String] the text to search for
# @return [Array<Element>] all matching elements
def texts text
  # returnElems requires a wrapped $(element).
  # must call toArray when using withPredicate instead of firstWithPredicate.
  js = %Q(
    var a = au.mainWindow.elements().withPredicate("name contains[c] '#{text}'").toArray();
    au._returnElems($(a));
  )

  execute_script js
end

# Return the first element matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Element] the first matching element
def name name
  text name
end

# Return all elements matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Array<Element>] all matching elements
def names name
  texts name
end

end # if ios