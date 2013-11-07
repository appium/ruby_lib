##### [s_texts](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L10) 

> def s_texts text=nil

Get an array of text texts if text is nil else
Get all static textfields that include text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [s_texts_names](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L18) 

> def s_texts_names



--

##### [e_s_texts](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L24) 

> def e_s_texts

Get an array of text elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Text>] 

--

##### [first_s_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L30) 

> def first_s_text

Get the first text element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [last_s_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L36) 

> def last_s_text

Get the last text element

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [s_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L43) 

> def s_text text

Get the first element that includes text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to find. If int then the text at that index is returned.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [s_text_exact](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L51) 

> def s_text_exact text

Get the first textfield that matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text that the tag must match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [s_texts_exact](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/text.rb#L58) 

> def s_texts_exact text

Get all static textfields that matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text that the tag must match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Text>] 

--

##### [window_size](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/window.rb#L5) 

> def window_size

Get the window's size

--

##### [button](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L8) 

> def button text, number=0

Find a button by text and optionally number.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to exactly match. If int then the button at that index is returned.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] number - the occurrence of the button matching text. Defaults to the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] the button found with text and matching number

--

##### [buttons](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L19) 

> def buttons text=nil

Get an array of button texts or button elements if text is provided.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>, Array<Buttons>] either an array of button texts or an array of button elements if text is provided.

--

##### [first_button](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L26) 

> def first_button

Get the first button element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L32) 

> def last_button

Get the last button element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L39) 

> def button_exact text

Get the first button element that exactly matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L46) 

> def buttons_exact text

Get all button elements that exactly match text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [e_buttons](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L52) 

> def e_buttons

Get an array of button elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [button_num](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/element/button.rb#L72) 

> def button_num text, number=1

Expected to be called via button method.

Get the button element exactly matching text and
occurrence. number=2 means the 2nd occurrence.

find the second Sign In button

b = e_button 'Sign In', 2

Button order will change in iOS vs Android
so if there's no button found at number then
return the first button.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] number - the button occurance to return. 1 = first button

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] the button that matches text and number

--

##### [find_eles_attr](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L8) ios

> def find_eles_attr tag_name, attribute

iOS only. Android uses uiautomator instead of uiautomation.
Get an array of attribute values from elements exactly matching tag name.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attribute - the attribute to collect

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] an array of strings containing the attribute from found elements of type tag_name.

--

##### [find_2_eles_attr](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L29) ios

> def find_2_eles_attr tag_name_1, tag_name_2, attribute

iOS only. Android doesn't use find_2_eles_attr.
Get an array of attribute values from elements exactly matching tag name.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name_1 - the 1st tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name_2 - the 2nd tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attribute - the attribute to collect

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] an array of strings containing the attribute from found elements of type tag_name.

--

##### [password](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L50) ios

> def password length=1

iOS only. On Android uiautomator always returns an empty string for EditText password.

Password character returned from value of UIASecureTextField

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] length - the length of the password to generate

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the returned string is of size length

--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L55) ios

> def get_page_class

Returns a string of class counts.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L81) ios

> def page_class



--

##### [get_page](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L93) ios

> def get_page element=source_window(0)

Returns a string of interesting elements. iOS only.

Defaults to inspecting the 1st windows source only.
use get_page(get_source) for all window sources

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] element - the element to search. omit to search everything

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [page](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L154) ios

> def page window_number = -1

Prints a string of interesting elements to the console.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [source_window](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L169) ios

> def source_window window_number=0

Gets the JSON source of window number

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [page_window](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L176) ios

> def page_window window_number=0

Prints parsed page source to console.
example: page_window 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

--

##### [fast_duration](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L183) ios

> def fast_duration

The fastest duration that can be used on iOS.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] 

--

##### [id](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/helper.rb#L190) ios

> def id id

Find by id. Useful for selendroid

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [alert_click](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L14) ios

> def alert_click value

iOS only
Tap the alert button identified by value.

Click the ok button:
  alert_click 'OK'

Click the first button:
  alert_click 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer, String] value - either an integer index of the button or the button's name

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L21) ios

> def alert_text

Get the alert message text.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L30) ios

> def alert_accept

Accept the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L40) ios

> def alert_accept_text

Get the text of the alert's accept button.
The last button is considered "accept." on iOS 6
The first button is considered "accept." on iOS 7

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L64) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/alert.rb#L74) ios

> def alert_dismiss_text

Get the text of the alert's dismiss button.
The first button is considered "dismiss." on iOS 6
The last button is considered "dismiss." on iOS 7

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [find](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L61) ios

> def find text

Return the first element matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [finds](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L83) ios

> def finds text

Return all elements matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L97) ios

> def text text

Return the first element matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [texts](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L105) ios

> def texts text

Return all elements matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [name](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L117) ios

> def name name

Return the first element matching name.
on Android name is content description
on iOS name is the accessibility label or the text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [names](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/generic.rb#L126) ios

> def names name

Return all elements matching name.
on Android name is content description
on iOS name is the accessibility label or the text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [locate_single_textfield](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L8) ios

> def locate_single_textfield js

UIATextField & UIASecureTextField methods

Find textfield and then secure elements in one server call
to match Android.

--

##### [textfields](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L18) ios

> def textfields

Get an array of textfield texts.
Does not respect implicit wait because we're using execute_script.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] 

--

##### [e_textfields](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L24) ios

> def e_textfields

Get an array of textfield elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Textfield>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L30) ios

> def first_textfield

Get the first textfield element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L36) ios

> def last_textfield

Get the last textfield element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L43) ios

> def textfield text

Get the first textfield that matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to match exactly. If int then the textfield at that index is returned.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield_include](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L57) ios

> def textfield_include text

Get the first textfield that includes text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the textfield must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/ios/element/textfield.rb#L64) ios

> def textfield_exact text

Get the first textfield that exactly matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the textfield must exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [wait](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L33) 

> def wait max_wait=-1, interval=0.5, &block

Check every 0.5 seconds to see if block.call doesn't raise an exception.
if .call raises an exception then it will be tried again.
if .call doesn't raise an exception then it will stop waiting.

Example: wait { name('back').click }

Give up after 30 seconds.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] max_wait - the maximum time in seconds to wait for.
Note that max wait 0 means infinity.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] interval - the time in seconds to wait after calling the block

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Block] block - the block to call

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] the result of block.call

--

##### [ignore](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L53) 

> def ignore &block

Return block.call and ignore any exceptions.

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L63) 

> def wait_true max_wait=-1, interval=0.5, &block

Check every 0.5 seconds to see if block.call returns true. nil is considered a failure.
Give up after 30 seconds.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] max_wait - the maximum time in seconds to wait for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] interval - the time in seconds to wait after calling the block

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Block] block - the block to call

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] the result of block.call

--

##### [back](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L84) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L89) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L97) 

> def xpath xpath_str

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L105) 

> def xpaths xpath_str

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L113) 

> def ele_index tag_name, index

Get the element of type tag_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the found element of type tag_name

--

##### [find_eles](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L122) 

> def find_eles tag_name

Get all elements exactly matching tag name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the found elements of type tag_name

--

##### [find_ele_by_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L130) 

> def find_ele_by_text tag, text

Get the first tag that exactly matches tag and text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag exactly matching text

--

##### [find_eles_by_text](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L138) 

> def find_eles_by_text tag, text

Get all tags that exactly match tag and text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag exactly matching text

--

##### [find_ele_by_attr_include](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L147) 

> def find_ele_by_attr_include tag, attr, value

Get the first tag by attribute that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--

##### [find_eles_by_attr_include](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L156) 

> def find_eles_by_attr_include tag, attr, value

Get tags by attribute that include value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--

##### [find_ele_by_text_include](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L165) 

> def find_ele_by_text_include tag, text

Get the first tag that includes text.
element.attribute(:text).include? text

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag that includes text

--

##### [find_eles_by_text_include](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L174) 

> def find_eles_by_text_include tag, text

Get the tags that include text.
element.attribute(:text).include? text

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag that includes text

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L181) 

> def first_ele tag_name

Get the first tag that matches tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L189) 

> def last_ele tag_name

Get the last tag that matches tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [source](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L195) 

> def source

Prints a JSON view of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [get_source](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L201) 

> def get_source

Gets a JSON view of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [find_name](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L210) 

> def find_name name

Returns the first element that exactly matches name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_names](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L218) 

> def find_names name

Returns all elements that exactly match name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L226) 

> def tag tag_name

Returns the first element matching tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L236) 

> def px_to_window_rel opts={}

Converts pixel values to window relative values

```ruby
px_to_window_rel x: 50, y: 150
```

--

##### [lazy_load_strings](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L246) 

> def lazy_load_strings



--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L253) 

> def xml_keys target

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L261) 

> def xml_values target

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L269) 

> def resolve_id id

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [raise_no_element_error](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/helper.rb#L275) 

> def raise_no_element_error

Used to error when finding a single element fails.

--

##### [value](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/patch.rb#L32) 

> def value

Returns the value attribute

Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element

--

##### [name](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/patch.rb#L39) 

> def name

Returns the name attribute

Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element

--

##### [tag_name](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/patch.rb#L46) 

> def tag_name

Returns the type attribute

Fixes Selenium::WebDriver::Error::UnknownError: Not yet implemented

--

##### [location_rel](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/common/patch.rb#L58) 

> def location_rel

For use with mobile tap.

```ruby
execute_script 'mobile: tap', :x => 0.0, :y => 0.98
```

https://github.com/appium/appium/wiki/Automating-mobile-gestures

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }

--

##### [CORE](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L16) 

> CORE = [ :array, :hash, :class, :file, :dir, :bigdecimal, :rational, :struct, :openstruct, :method, :unboundmethod ]



--

##### [awesome_openstruct](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L18) 

> def awesome_openstruct target



--

##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L28) 

> def load_appium_txt opts

Load appium.txt (toml format) into system ENV
the basedir of this file + appium.txt is what's used

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] the require files. nil if require doesn't exist

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L154) 

> def self.promote_singleton_appium_methods main_module



--

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L184) 

> def self.promote_appium_methods class_array

Promote appium methods to class instance methods

To promote methods to all classes:

```ruby
Appium.promote_appium_methods Object
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L515) 

> def default_wait

Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [app_path](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def app_path

Returns the value of attribute app_path

--

##### [app_name](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def app_name

Returns the value of attribute app_name

--

##### [device](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def device

Returns the value of attribute device

--

##### [app_package](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def app_package

Returns the value of attribute app_package

--

##### [app_activity](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def app_activity

Returns the value of attribute app_activity

--

##### [app_wait_activity](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def app_wait_activity

Returns the value of attribute app_wait_activity

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def sauce_username

Returns the value of attribute sauce_username

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def sauce_access_key

Returns the value of attribute sauce_access_key

--

##### [port](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def port

Returns the value of attribute port

--

##### [debug](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def debug

Returns the value of attribute debug

--

##### [export_session](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def export_session

Returns the value of attribute export_session

--

##### [device_cap](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def device_cap

Returns the value of attribute device_cap

--

##### [compress_xml](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def compress_xml

Returns the value of attribute compress_xml

--

##### [custom_url](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L213) 

> def custom_url

Returns the value of attribute custom_url

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L219) 

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L219) 

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [initialize](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L249) 

> def initialize opts={}

Creates a new driver.
:device is :android, :ios, or :selendroid

```ruby
# Options include:
:app_path, :app_name, :app_package, :app_activity,
:app_wait_activity, :sauce_username, :sauce_access_key,
:port, :os, :debug

require 'rubygems'
require 'appium_lib'

# Start iOS driver
app = { device: :ios, app_path: '/path/to/MyiOS.app'}
Appium::Driver.new(app).start_driver

# Start Android driver
apk = { device: :android
        app_path: '/path/to/the.apk',
        app_package: 'com.example.pkg',
        app_activity: 'act.Start',
        app_wait_activity: 'act.Start'
}

Appium::Driver.new(apk).start_driver
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [status](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L356) 

> def status

Returns the status payload

```ruby
{"status"=>0,
 "value"=>
  {"build"=>
    {"version"=>"0.8.2",
     "revision"=>"f2a2bc3782e4b0370d97a097d7e04913cf008995"}},
 "sessionId"=>"8f4b34a7-a9a9-4ac5-b125-36258143446a"}
```

 Discover the Appium rev running on the server.

`status["value"]["build"]["revision"]`
`f2a2bc3782e4b0370d97a097d7e04913cf008995`

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [server_version](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L362) 

> def server_version

Returns the server's version string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L402) 

> def absolute_app_path

Converts environment variable APP_PATH to an absolute path.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L422) 

> def server_url

Get the server url for sauce or local based on env vars.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L433) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [driver](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L440) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L450) 

> def screenshot png_save_path

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L457) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L465) 

> def start_driver

Creates a new global driver and quits the old one if it exists.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L499) 

> def no_wait

Set implicit wait and default_wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L507) 

> def set_wait timeout=@default_wait

Set implicit wait and default_wait to timeout, defaults to 30.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L531) 

> def exists pre_check=0, post_check=@default_wait, &search_block

Returns existence of element.

Example:

exists { button('sign in') } ? puts('true') : puts('false')

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] pre_check - the amount in seconds to set the
wait to before checking existance

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] post_check - the amount in seconds to set the
wait to after checking existance

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Block] search_block - the block to call

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [execute_script](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L553) 

> def execute_script script, *args

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - the script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [mobile](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L569) 

> def mobile method, *args

Helper method for mobile gestures

https://github.com/appium/appium/wiki/Automating-mobile-gestures

driver.execute_script 'mobile: swipe', endX: 100, endY: 100, duration: 0.01

becomes

mobile :swipe, endX: 100, endY: 100, duration: 0.01

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Symbol] method - the method to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to pass to the method

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L580) 

> def find_elements *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L588) 

> def find_element *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [x](https://github.com/appium/ruby_lib/blob/c92bd3710be09731aa8ba4547a3e19af9eeaceab/lib/appium_lib/driver.rb#L595) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

