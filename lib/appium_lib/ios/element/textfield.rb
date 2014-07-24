module Appium
  module Ios
    UITextField       = 'UITextField'
    UISecureTextField = 'UISecureTextField'

    private
=begin
contains only works with strings. will fail if used on non-string
value may randomly be a number so value contains is going to randomly fail
must use [cd] for case and diacritic insensitivity.

@interface CustomTextField : UITextField

The predicate type will always be CustomTextField even though element.type() in uiautomation
returns UIATextField and UIASecureTextField. There's no way to identify the underlying predicate
 type without reading the source or brute force.
https://github.com/appium/ruby_lib/issues/226#issuecomment-50036962
=end

    # @private
    def _textfield_visible_pred
      # type refers to the underlying app specific class for the textfield which
      # could be anything. we're assuming that textfields contain the string
      # textfield in the type.
      "type contains[cd] 'textfield'"
    end

    # @private
    def _textfield_exact_pred value
      value.gsub!("'", "\\\\'") # escape '
      "#{_textfield_visible_pred} && value == '#{value}'"
    end

    # @private
    def _textfield_contains_pred value
      value.gsub!("'", "\\\\'") # escape '
      # c - case insensitive
      # d - diacritic insensitive
      "#{_textfield_visible_pred}  && value contains[cd] '#{value}'"
    end

    public

    # Find the first TextField that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield value
      # Don't use ele_index because that only works on one element type.
      # iOS needs to combine textfield and secure to match Android.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid index. Must be >= 1" if index <= 0
        index -= 1 # predicates are 0 indexed.
        return eles_with_pred(_textfield_visible_pred)[index]
      end

      ele_with_pred(_textfield_contains_pred(value))
    end

    # Find all TextFields containing value.
    # If value is omitted, all TextFields are returned.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields value=false
      return eles_with_pred(_textfield_visible_pred) unless value
      eles_with_pred(_textfield_contains_pred(value))
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      ele_with_pred(_textfield_visible_pred)
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      eles_with_pred(_textfield_visible_pred).last
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact value
      ele_with_pred(_textfield_exact_pred(value))
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact value
      eles_with_pred(_textfield_exact_pred(value))
    end
  end # module Ios
end # module Appium