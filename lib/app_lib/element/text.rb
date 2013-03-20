# encoding: utf-8
# UIAStaticText methods

# Get an array of text texts.
# @return [Array<String>]
def texts
  find_eles_attr :text, :text
end

# Get an array of text elements.
# @return [Array<Text>]
def e_texts
  find_eles :text
end

# Get the first text element.
# @return [Text]
def first_text
  first_ele :text
end

# Get the last text element
# @return [Text]
def last_text
  last_ele :text
end

# Get the first element that matches text.
# @param text [String, Integer] the text to find exactly. If int then the text at that index is returned.
# @return [Text]
def text text
  return ele_index :text, text if text.is_a? Numeric
  find_ele_by_text :text, text
end

# Get the first textfield that includes text.
# @param text [String] the text that the tag must include
# @return [Text]
def text_include text
  find_ele_by_text_include :text, text
end