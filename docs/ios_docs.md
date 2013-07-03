##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L12) 

> def load_appium_txt opts

Load appium.txt (toml format) into system ENV
the basedir of this file + appium.txt is what's used

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L354) 

> def default_wait

Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [app_path](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def app_path

Returns the value of attribute app_path

--

##### [app_name](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def app_name

Returns the value of attribute app_name

--

##### [selendroid](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def selendroid

Returns the value of attribute selendroid

--

##### [app_package](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def app_package

Returns the value of attribute app_package

--

##### [app_activity](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def app_activity

Returns the value of attribute app_activity

--

##### [app_wait_activity](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def app_wait_activity

Returns the value of attribute app_wait_activity

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def sauce_username

Returns the value of attribute sauce_username

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def sauce_access_key

Returns the value of attribute sauce_access_key

--

##### [port](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def port

Returns the value of attribute port

--

##### [os](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def os

Returns the value of attribute os

--

##### [debug](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L87) 

> def debug

Returns the value of attribute debug

--

##### [initialize](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L117) 

> def initialize opts={}

Creates a new driver.

```ruby
# Options include:
:app_path, :app_name, :app_package, :app_activity,
:app_wait_activity, :sauce_username, :sauce_access_key,
:port, :os, :debug

require 'rubygems'
require 'appium_lib'

# Start iOS driver
app = { app_path: '/path/to/MyiOS.app'}
Appium::Driver.new(app).start_driver

# Start Android driver
apk = { app_path: '/path/to/the.apk',
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

##### [status](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L212) 

> def status

Returns the status payload

--

##### [server_version](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L218) 

> def server_version

Returns the server's version string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L259) 

> def absolute_app_path

Converts environment variable APP_PATH to an absolute path.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L275) 

> def server_url

Get the server url for sauce or local based on env vars.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L285) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [driver](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L292) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L302) 

> def screenshot png_save_path

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L308) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L316) 

> def start_driver

Creates a new global driver and quits the old one if it exists.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L340) 

> def no_wait

Set implicit wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L347) 

> def set_wait timeout=@default_wait

Set implicit wait to timeout, defaults to 30.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L370) 

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

##### [execute_script](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L392) 

> def execute_script script, *args

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - the script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [mobile](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L408) 

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

##### [find_elements](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L419) 

> def find_elements *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L427) 

> def find_element *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [x](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/driver.rb#L434) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [wait](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L33) 

> def wait max_wait=30, interval=0.5, &block

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

##### [ignore](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L45) 

> def ignore &block

Return block.call and ignore any exceptions.

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L55) 

> def wait_true max_wait=30, interval=0.5, &block

Check every 0.5 seconds to see if block.call returns true. nil is considered a failure.
Give up after 30 seconds.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] max_wait - the maximum time in seconds to wait for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] interval - the time in seconds to wait after calling the block

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Block] block - the block to call

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] the result of block.call

--

##### [id](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L69) 

> def id id

Find by id. Useful for selendroid

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [back](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L75) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L80) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L88) 

> def xpath xpath_str

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L96) 

> def xpaths xpath_str

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L104) 

> def ele_index tag_name, index

Get the element of type tag_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the found element of type tag_name

--

##### [find_eles](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L112) 

> def find_eles tag_name

Get all elements exactly matching tag name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the found elements of type tag_name

--

##### [find_ele_by_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L120) 

> def find_ele_by_text tag, text

Get the first tag that exactly matches tag and text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag exactly matching text

--

##### [find_eles_by_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L128) 

> def find_eles_by_text tag, text

Get all tags that exactly match tag and text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag exactly matching text

--

##### [find_ele_by_attr_include](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L137) 

> def find_ele_by_attr_include tag, attr, value

Get the first tag by attribute that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--

##### [find_eles_by_attr_include](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L146) 

> def find_eles_by_attr_include tag, attr, value

Get tags by attribute that include value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--

##### [find_ele_by_text_include](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L155) 

> def find_ele_by_text_include tag, text

Get the first tag that includes text.
element.attribute(:text).include? text

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag that includes text

--

##### [find_eles_by_text_include](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L164) 

> def find_eles_by_text_include tag, text

Get the tags that include text.
element.attribute(:text).include? text

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag that includes text

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L171) 

> def first_ele tag_name

Get the first tag that matches tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L179) 

> def last_ele tag_name

Get the last tag that matches tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [source](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L185) 

> def source

Prints a JSON view of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [get_source](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L191) 

> def get_source

Gets a JSON view of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [find_name](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L200) 

> def find_name name

Returns the first element that exactly matches name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_names](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L208) 

> def find_names name

Returns all elements that exactly match name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/helper.rb#L216) 

> def tag tag_name

Returns the first element matching tag_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [s_texts](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L8) 

> def s_texts

Get an array of text texts.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] 

--

##### [e_s_texts](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L14) 

> def e_s_texts

Get an array of text elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Text>] 

--

##### [first_s_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L20) 

> def first_s_text

Get the first text element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [last_s_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L26) 

> def last_s_text

Get the last text element

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [s_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L33) 

> def s_text text

Get the first element that includes text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to find. If int then the text at that index is returned.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [s_text_exact](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/text.rb#L41) 

> def s_text_exact text

Get the first textfield that matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text that the tag must match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Text] 

--

##### [window_size](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/window.rb#L5) 

> def window_size

Get the window's size

--

##### [button](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L8) 

> def button text, number=0

Find a button by text and optionally number.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to exactly match. If int then the button at that index is returned.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] number - the occurrence of the button matching text. Defaults to the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] the button found with text and matching number

--

##### [buttons](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L19) 

> def buttons text=nil

Get an array of button texts or button elements if text is provided.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>, Array<Buttons>] either an array of button texts or an array of button elements if text is provided.

--

##### [first_button](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L26) 

> def first_button

Get the first button element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L32) 

> def last_button

Get the last button element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L39) 

> def button_exact text

Get the first button element that exactly matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L46) 

> def buttons_exact text

Get all button elements that exactly match text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [e_buttons](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L52) 

> def e_buttons

Get an array of button elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [button_num](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/element/button.rb#L72) 

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

##### [find_eles_attr](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L8) ios

> def find_eles_attr tag_name, attribute

iOS only. Android uses uiautomator instead of uiautomation.
Get an array of attribute values from elements exactly matching tag name.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] tag_name - the tag name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attribute - the attribute to collect

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] an array of strings containing the attribute from found elements of type tag_name.

--

##### [find_2_eles_attr](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L29) ios

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

##### [password](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L50) ios

> def password length=1

iOS only. On Android uiautomator always returns an empty string for EditText password.

Password character returned from value of UIASecureTextField

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] length - the length of the password to generate

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the returned string is of size length

--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L55) ios

> def get_page_class

Returns a string of class counts.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L81) ios

> def page_class



--

##### [get_page](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L90) ios

> def get_page element=get_source

Returns a string of interesting elements. iOS only.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] element - the element to search. omit to search everything

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [page](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L135) ios

> def page

Prints a string of interesting elements to the console.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [source_window](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L143) ios

> def source_window window_number=0

Gets the JSON source of window number

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [page_window](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L150) ios

> def page_window window_number=0

Prints parsed page source to console.
example: page_window 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

--

##### [fast_duration](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/helper.rb#L157) ios

> def fast_duration

The fastest duration that can be used on iOS.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] 

--

##### [alert_click](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L14) ios

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

##### [alert_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L21) ios

> def alert_text

Get the alert message text.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L30) ios

> def alert_accept

Accept the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L39) ios

> def alert_accept_text

Get the text of the alert's accept button.
The last button is considered "accept."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L48) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss_text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/alert.rb#L57) ios

> def alert_dismiss_text

Get the text of the alert's dismiss button.
The first button is considered "dismiss."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [find](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L61) ios

> def find text

Return the first element matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [finds](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L83) ios

> def finds text

Return all elements matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [text](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L97) ios

> def text text

Return the first element matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [texts](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L105) ios

> def texts text

Return all elements matching text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [name](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L117) ios

> def name name

Return the first element matching name.
on Android name is content description
on iOS name is the accessibility label or the text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the first matching element

--

##### [names](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/generic.rb#L126) ios

> def names name

Return all elements matching name.
on Android name is content description
on iOS name is the accessibility label or the text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] name - the name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] all matching elements

--

##### [textfields](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L10) ios

> def textfields

Get an array of textfield texts.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] 

--

##### [e_textfields](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L16) ios

> def e_textfields

Get an array of textfield elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Textfield>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L22) ios

> def first_textfield

Get the first textfield element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L29) ios

> def last_textfield

Get the last textfield element.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L37) ios

> def textfield text

Get the first textfield that matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] text - the text to match exactly. If int then the textfield at that index is returned.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield_include](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L51) ios

> def textfield_include text

Get the first textfield that includes text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the textfield must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/ios/element/textfield.rb#L64) ios

> def textfield_exact text

Get the first textfield that exactly matches text.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text the textfield must exactly match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Textfield] 

--

##### [value](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/patch.rb#L32) 

> def value

Returns the value attribute

Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element

--

##### [name](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/patch.rb#L39) 

> def name

Returns the name attribute

Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element

--

##### [tag_name](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/patch.rb#L46) 

> def tag_name

Returns the type attribute

Fixes Selenium::WebDriver::Error::UnknownError: Not yet implemented

--

##### [location_rel](https://github.com/appium/ruby_lib/blob/734fe6887f36aa1ad59ef7ce992ba2e2f4c8c7d3/lib/appium_lib/common/patch.rb#L58) 

> def location_rel

For use with mobile tap.

```ruby
execute_script 'mobile: tap', :x => 0.0, :y => 0.98
```

https://github.com/appium/appium/wiki/Automating-mobile-gestures

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }

--

