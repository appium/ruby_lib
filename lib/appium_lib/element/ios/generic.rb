# encoding: utf-8
if $os == :ios
=begin
name, names, text, text should match substring and case insensitive.

iOS .name() is the accessibility attribute. If not defined, then .label() is used instead.
This differs from Android where name (the content description) is empty when not set.

name defaults to label when undefined. value is never a default so that must be
included in a new search.

Find - search everything.

The search order is:
1. name
2. label (implied by name)
3. value

Android name = iOS name & label
Android text = iOS value
=end

def first_ele_js predicate
  # returnElems requires a wrapped $(element).
  # set to empty array when length is zero to prevent hang.
  #
  # UIAElementNil when not matched
  #
  # 1. secureTextFields
  # 2. textFields
  # 3. buttons
  # 4. elements
  %Q(
    function isNil( a ) {
      return a.type() === 'UIAElementNil';
    }

    var w = au.mainWindow;
    var search = "#{predicate}";
    var a = w.secureTextFields().firstWithPredicate(search);
    if ( isNil(a) ) {
      a = w.textFields().firstWithPredicate(search);
      if ( isNil(a) ) {
        a = w.buttons().firstWithPredicate(search);
        if ( isNil(a) ) {
          a = w.elements().firstWithPredicate(search);
        }
      }
    }

    if ( a.length === 0 ) {
      a = [];
    }

    au._returnElems($(a));
  )
end

def all_ele_js predicate
  %Q(
    var w = au.mainWindow;
    var search = "#{predicate}";
    var a = w.elements().withPredicate(search).toArray();

    if ( a.length === 0 ) {
      a = [];
    }

    au._returnElems($(a));
  )
end

# Return the first element matching text.
# @param text [String] the text to search for
# @return [Element] the first matching element
def find text
  js = first_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}' || value contains[c] '#{text}'"

  execute_script(js).first
end

# Return all elements matching text.
# @param text [String] the text to search for
# @return [Array<Element>] all matching elements
def finds text
  # returnElems requires a wrapped $(element).
  # must call toArray when using withPredicate instead of firstWithPredicate.
  js = all_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}' || value contains[c] '#{text}'"

  execute_script js
end

# Return the first element matching text.
# @param text [String] the text to search for
# @return [Element] the first matching element
def text text
  # TODO: Use XPath index once it's implemented
  # https://github.com/appium/appium/issues/295
  js = first_ele_js "value contains[c] '#{text}'"

  execute_script(js).first
end

# Return all elements matching text.
# @param text [String] the text to search for
# @return [Array<Element>] all matching elements
def texts text
  # XPath //* is not implemented on iOS
  # https://github.com/appium/appium/issues/430
    js = all_ele_js "value contains[c] '#{text}'"

  execute_script js
end

# Return the first element matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Element] the first matching element
def name text
  js = first_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}'"

  execute_script(js).first
end

# Return all elements matching name.
# on Android name is content description
# on iOS name is the accessibility label or the text.
# @param name [String] the name to search for
# @return [Array<Element>] all matching elements
def names text
  # find_elements :name is not the same as on Android.
  # it's case sensitive and exact on iOS and not on Android.
  # https://github.com/appium/appium/issues/379
  js = all_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}''"

  execute_script js
end

end # if ios
