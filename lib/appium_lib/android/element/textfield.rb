# encoding: utf-8
module Appium
  module Android
    # UIATextField methods

    # Get an array of textfield texts.
    # @return [Array<String>]
    def textfields
      find_eles_attr :textfield, :text
    end

    # Get an array of textfield elements.
    # @return [Array<Textfield>]
    def e_textfields
      find_eles :textfield
    end

    # Get the first textfield element.
    # @return [Textfield]
    def first_textfield
      first_ele :textfield
    end

    # Get the last textfield element.
    # @return [Textfield]
    def last_textfield
      last_ele :textfield
    end

    # Get the first textfield that includes text or name (content description).
    # @param text [String, Integer] the text to search for. If int then the textfield at that index is returned.
    # @return [Textfield]
    def textfield text
      return ele_index :textfield, text if text.is_a? Numeric

      # s.className('android.widget.EditText').descriptionContains(value);
      args = [[4, 'android.widget.EditText'], [7, text]],
          # s.className('android.widget.EditText').textContains(value);
          [[4, 'android.widget.EditText'], [3, text]]
      mobile :find, args
    end

    # Get the first textfield that matches text.
    # @param text [String] the text to match
    # @return [Textfield]
    def textfield_exact text
      find_ele_by_text :textfield, text
    end
  end # module Android
end # module Appium