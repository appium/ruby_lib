# encoding: utf-8
# UIAButton methods

=begin
 Method Signatures:

   button( text, number = -1 )
   buttons( text = nil )
   button_include( text )
   buttons_include( text )
   first_button
   last_button

 Examples:

   button 'text'    # 1st button exactly matching text
   button 'text', 2 # 2nd button exactly matching text

   buttons          # text of all buttons.
   buttons 'text'   # all buttons exactly matching text

   button_include  'text' # the first button that includes text
   buttons_include 'text' # all buttons that include text

   first_button     # the first button
   last_button      # the last button
=end

# Find a button by text and optionally number.
# @param text [String] the text to exactly match
# @param number [Integer] the occurance of the button matching text. Defaults to the first button.
# @return [Button] the button found with text and matching number
def button text, number=0
  number >= 1 ? button_text_num( text, number ) :
  button_text( text )
end

# Get an array of button texts or button elements if text is provided.
# @param text [String] the text to exactly match
# @return [Array<String>, Array<Buttons>] either an array of button texts or an array of button elements if text is provided.
def buttons text=nil
  text == nil ? find_eles_attr(:button, :text) :
                find_ele_by_text(:button, text)
end

# Get the first button that includes text.
# @param text [String] the text that the element must include
# @return [Button]
def button_include text
  find_ele_by_text_include :button, text
end

# Get all buttons that include text.
# @param text [String] the text that the element must include
# @return [Array<Button>]
def buttons_include text
  find_eles_by_text_include :button, text
end

# Get the first button element.
# @return [Button]
def first_button
  first_ele :button
end

# Get the last button element.
# @return [Button]
def last_button
  last_ele :button
end

# -- prefer above methods before using these.
private

# Get the first button element that exactly matches text.
# @param text [String] the text to match exactly
# @return [Button]
def button_text text
  find_ele_by_text :button, text
end

# Get the button element exactly matching text and
# occurrence. number=2 means the 2nd occurrence.
#
# find the second Sign In button
#
# b = e_button 'Sign In', 2
#
# Button order will change in iOS vs Android
# so if there's no button found at number then
# return the first button.
#
# @param text [String] the text to match exactly
# @param number [Integer] the button occurance to return. 1 = first button
# @return [Button] the button that exactly matches text and number
def button_text_num text, number=1
  raise "Number must be >= 1" if number <= 0
  number = number - 1 # zero indexed

  result = nil

  elements = find_eles_by_text :button, text
  elements.size > number ? result = elements[number]
                         : result = elements.first

  result
end

# Get an array of button elements.
# @return [Array<Button>]
def e_buttons
  find_eles :button
end
