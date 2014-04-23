# encoding: utf-8
# UIAStaticText methods
module Appium
  module Ios
    # s_ prefix for static_text to avoid conflict with generic text methods.

    # Get an array of text texts if text is nil else
    # Get all static textfields that include text.
    # @param text [String] the text to find.
    # @return [Array]
    def s_texts text=nil
      if text
        find_eles_by_name_include :text, text
      else
        find_eles_attr :text, :name
      end
    end

    def s_texts_names
      find_eles_attr :text, :name
    end

    # Get an array of text elements.
    # @return [Array<Text>]
    def e_s_texts
      find_eles :text
    end

    # Get the first text element.
    # @return [Text]
    def first_s_text
      first_ele :text
    end

    # Get the last text element
    # @return [Text]
    def last_s_text
      last_ele :text
    end

    # Get the first element that includes text.
    # @param text [String, Integer] the text to find. If int then the text at that index is returned.
    # @return [Text]
    def s_text text
      return ele_index :text, text if text.is_a? Numeric
      find_ele_by_name_include :text, text
    end

    # Get the first textfield that matches text.
    # @param text [String] the text that the tag must match
    # @return [Text]
    def s_text_exact text
      find_ele_by_name :text, text
    end

    # Get all static textfields that matches text.
    # @param text [String] the text that the tag must match
    # @return [Array<Text>]
    def s_texts_exact text
      find_eles_by_name :text, text
    end
  end # module Common
end # module Appium