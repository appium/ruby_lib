# encoding: utf-8
module Appium::Ios
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

  # @private
  # returnElems requires a wrapped $(element).
  # set to empty array when length is zero to prevent hang.
  #
  # UIAElementNil when not matched
  #
  # 1. secureTextFields
  # 2. textFields
  # 3. buttons
  # 4. elements
  #
  # search takes the window to search.
  # start searching webview first.
  # window 0 is the main window.
  # window 1 is the 1st webview (if it exists)
  # must break instead of return because it's not a function.
  #
  # single element length is undefined when found and 0 when not found.
  # @param predicate [String] the predicate
  # @return [String] the completed JavaScript program
  def first_ele_js predicate
    (<<-JS).strip # remove trailing newline
       au.mainApp.getFirstWithPredicateWeighted("#{predicate}");
    JS
  end

  # @private
  # @param predicate [String] the predicate
  # @return [String] the completed JavaScript program
  def all_ele_js predicate
    (<<-JS).strip # remove trailing newline
      au.mainApp.getAllWithPredicate("#{predicate}");
    JS
  end

  # Return the first element matching text.
  # @param text [String] the text to search for
  # @return [Element] the first matching element
  def find text
    js = first_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}' || value contains[c] '#{text}'"
    execute_script js
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
    js = first_ele_js "value contains[c] '#{text}'"
    execute_script js
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
  def name name
    mobile :findElementNameContains, name: name
  end

  # Return all elements matching name.
  # on Android name is content description
  # on iOS name is the accessibility label or the text.
  # @param name [String] the name to search for
  # @return [Array<Element>] all matching elements
  def names name
    # :name is not consistent across iOS and Android so use custom JavaScript
    # https://github.com/appium/appium/issues/379
    js = all_ele_js "name contains[c] '#{name}' || label contains[c] '#{name}'"
    execute_script js
  end
end # module Appium::Ios