# TextView methods
module Appium
  module Android
    TextView = 'android.widget.TextView'

    # Find the first TextView that contains value or by index.
    # @param value [String, Integer] the value to find.
    # If int then the TextView at that index is returned.
    # @return [TextView]
    def s_text value
      return ele_index TextView, value if value.is_a? Numeric
      xpath_visible_contains TextView, value
    end

    # Find all TextViews containing value.
    # @param value [String] the value to search for
    # @return [Array<TextView>]
    def s_texts value
      xpaths_visible_contains TextView, value
    end

    # Find the first TextView.
    # @return [TextView]
    def first_s_text
      first_ele TextView
    end

    # Find the last TextView.
    # @return [TextView]
    def last_s_text
      last_ele TextView
    end

    # Find the first TextView that exactly matches value.
    # @param value [String] the value to match exactly
    # @return [TextView]
    def s_text_exact value
      xpath_visible_exact TextView, value
    end

    # Find all TextViews that exactly match value.
    # @param value [String] the value to match exactly
    # @return [Array<TextView>]
    def s_texts_exact value
      xpaths_visible_exact TextView, value
    end

    # Find all TextViews.
    # @return [Array<TextView>]
    def e_s_texts
      tags TextView
    end
  end # module Android
end # module Appium