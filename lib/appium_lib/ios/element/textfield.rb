module Appium
  module Ios
    UIATextField       = 'UIATextField'
    UIASecureTextField = 'UIASecureTextField'

    private

    # @private
    def _textfield_visible
      {
        typeArray:   [UIATextField, UIASecureTextField],
        onlyVisible: true
      }
    end

    # @private
    def _textfield_exact_string(value)
      exact     = {
        target:      value,
        substring:   false,
        insensitive: false
      }
      exact_obj = {
        name:  exact,
        label: exact,
        value: exact
      }
      _textfield_visible.merge(exact_obj)
    end

    # @private
    def _textfield_contains_string(value)
      contains     = {
        target:      value,
        substring:   true,
        insensitive: true
      }
      contains_obj = {
        name:  contains,
        label: contains,
        value: contains
      }
      _textfield_visible.merge(contains_obj)
    end

    public

    # Find the first TextField that contains value or by index.
    # @param value [String, Integer] the text to match exactly.
    # If int then the TextField at that index is returned.
    # @return [TextField]
    def textfield(value)
      # Don't use ele_index because that only works on one element type.
      # iOS needs to combine textfield and secure to match Android.
      if value.is_a? Numeric
        index = value
        fail "#{index} is not a valid index. Must be >= 1" if index <= 0
        index -= 1 # eles_by_json is 0 indexed.

        result = eles_by_json(_textfield_visible)[index]
        fail _no_such_element if result.nil?
        return result
      end

      ele_by_json _textfield_contains_string value
    end

    # Find all TextFields containing value.
    # If value is omitted, all TextFields are returned.
    # @param value [String] the value to search for
    # @return [Array<TextField>]
    def textfields(value = false)
      return eles_by_json _textfield_visible unless value
      eles_by_json _textfield_contains_string value
    end

    # Find the first TextField.
    # @return [TextField]
    def first_textfield
      ele_by_json _textfield_visible
    end

    # Find the last TextField.
    # @return [TextField]
    def last_textfield
      result = eles_by_json(_textfield_visible).last
      fail _no_such_element if result.nil?
      result
    end

    # Find the first TextField that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextField]
    def textfield_exact(value)
      ele_by_json _textfield_exact_string value
    end

    # Find all TextFields that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextField>]
    def textfields_exact(value)
      eles_by_json _textfield_exact_string value
    end
  end # module Ios
end # module Appium
