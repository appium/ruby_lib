# TextView methods
module Appium
  module Android
    TextView = 'android.widget.TextView'

    # Find the first TextView that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the TextView at that index is returned.
    # @return [TextView]
    def text(value)
      return ele_index TextView, value if value.is_a? Numeric
      complex_find_contains TextView, value
    end

    # Find all TextViews containing value.
    # If value is omitted, all texts are returned.
    # @param value [String] the value to search for
    # @return [Array<TextView>]
    def texts(value = false)
      return tags TextView unless value
      complex_finds_contains TextView, value
    end

    # Find the first TextView.
    # @return [TextView]
    def first_text
      first_ele TextView
    end

    # Find the last TextView.
    # @return [TextView]
    def last_text
      last_ele TextView
    end

    # Find the first TextView that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextView]
    def text_exact(value)
      complex_find_exact TextView, value
    end

    # Find all TextViews that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextView>]
    def texts_exact(value)
      complex_finds_exact TextView, value
    end
  end # module Android
end # module Appium
