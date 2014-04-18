# encoding: utf-8
module Appium
  module Ios
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
       au.mainApp().getFirstWithPredicateWeighted("#{predicate}");
      JS
    end

    # @private
    # @param predicate [String] the predicate
    # @return [String] the completed JavaScript program
    def all_ele_js predicate
      (<<-JS).strip # remove trailing newline
      au.mainApp().getAllWithPredicate("#{predicate}");
      JS
    end

    # Return the first element matching text.
    # @param text [String] the text to search for
    # @return [Element] the first matching element
    def find text
      text = escape_single_quote text
      ele  = nil
      # prefer value search. this may error with:
      # Can't use in/contains operator with collection 1
      js   = first_ele_js "value contains[c] '#{text}'"
      ele  = ignore { execute_script js }

      # now search name and label if the value search didn't match.
      unless ele
        js  = first_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}'"
        ele = ignore { execute_script js }
      end

      # manually raise error if no element was found
      raise Selenium::WebDriver::Error::NoSuchElementError, 'An element could not be located on the page using the given search parameters.' unless ele

      ele
    end

    # Return all elements matching text.
    # @param text [String] the text to search for
    # @return [Array<Element>] all matching elements
    def finds text
      text = escape_single_quote text
      eles = []
      # value contains may error
      js   = all_ele_js "value contains[c] '#{text}'"
      eles = ignore { execute_script js }

      js   = all_ele_js "name contains[c] '#{text}' || label contains[c] '#{text}'"
      eles += ignore { execute_script js }
      eles
    end

    # Return the first element matching text.
    # @param text [String] the text to search for
    # @return [Element] the first matching element
    def text text
      text = escape_single_quote text
      js   = first_ele_js "value contains[c] '#{text}'"
      execute_script js
    end

    # Return all elements matching text.
    # @param text [String] the text to search for
    # @return [Array<Element>] all matching elements
    def texts text
      text = escape_single_quote text
      # XPath //* is not implemented on iOS
      # https://github.com/appium/appium/issues/430
      js   = all_ele_js "value contains[c] '#{text}'"
      execute_script js
    end

    # Return the first element matching name.
    # on Android name is content description
    # on iOS name is the accessibility label or the text.
    #
    # ```ruby
    # # find element with name or label containing example and access the name attribute.
    # name('example').name
    #
    # # find element with name or label containing example and access the label attribute.
    # name('example').label
    # ```
    #
    # @param name [String] the name to search for
    # @return [Element] the first matching element
    def name name
      name = escape_single_quote name
      mobile :findElementNameContains, name: name
    end

    def name_exact name
      name   = escape_single_quote name
      js     = all_ele_js "name == '#{name}'"
      result = execute_script js

      return result if result.kind_of? Selenium::WebDriver::Element

      if result.length > 0
        result.first
      else
        Appium::Common.raise_no_element_error
      end
    end

    # Return all elements matching name.
    # on Android name is content description
    # on iOS name is the accessibility label or the text.
    # @param name [String] the name to search for
    # @return [Array<Element>] all matching elements
    def names name
      name = escape_single_quote name
      # :name is not consistent across iOS and Android so use custom JavaScript
      # https://github.com/appium/appium/issues/379
      js   = all_ele_js "name contains[c] '#{name}' || label contains[c] '#{name}'"
      execute_script js
    end

    def escape_single_quote text_to_escape
      text_to_escape.gsub("'", '\\' * 4 + "'")
    end
  end # module Ios
end # module Appium