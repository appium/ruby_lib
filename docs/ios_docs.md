##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L71) 

> def self.load_appium_txt opts={}

Load appium.txt (toml format)
the basedir of this file + appium.txt is what's used

```
[caps]
app = "path/to/app"

[appium_lib]
port = 8080
```

:app is expanded
:require is expanded
all keys are converted to symbols

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--

##### [symbolize_keys](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L141) 

> def self.symbolize_keys hash

convert all keys (including nested) to symbols

based on deep_symbolize_keys & deep_transform_keys from rails
https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L151) 

> def self.promote_singleton_appium_methods main_module



--

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L180) 

> def self.promote_appium_methods class_array

Promote appium methods to class instance methods

To promote methods to all classes:

```ruby
Appium.promote_appium_methods Object
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L213) 

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L213) 

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [initialize](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L234) 

> def initialize opts={}

Creates a new driver

```ruby
require 'rubygems'
require 'appium_lib'

# platformName takes a string or a symbol.

# Start iOS driver
opts = { caps: { platformName: :ios, app: '/path/to/MyiOS.app' } }
Appium::Driver.new(opts).start_driver

# Start Android driver
opts = { caps: { platformName: :android, app: '/path/to/my.apk' } }
Appium::Driver.new(apk).start_driver
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [driver_attributes](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L308) 

> def driver_attributes

Returns a hash of the driver attributes

--

##### [device_is_android?](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L328) 

> def device_is_android?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [appium_server_version](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L344) 

> def appium_server_version

Returns the server's version info

```ruby
{
    "build" => {
        "version" => "0.18.1",
        "revision" => "d242ebcfd92046a974347ccc3a28f0e898595198"
    }
}
```

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L350) 

> def self.absolute_app_path app_path

Converts app_path to an absolute path.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L374) 

> def server_url

Get the server url

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L385) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [driver](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L392) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L402) 

> def screenshot png_save_path

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L409) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L417) 

> def start_driver

Creates a new global driver and quits the old one if it exists.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L443) 

> def no_wait

Set implicit wait and default_wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L462) 

> def set_wait timeout=nil

Set implicit wait and default_wait to timeout, defaults to 30.
if set_wait is called without a param then the second to last
wait will be used.

```ruby`
set_wait 2
set_wait 3
set_wait # 2

````

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L480) 

> def default_wait

Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L496) 

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

##### [execute_script](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L520) 

> def execute_script script, *args

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - the script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L528) 

> def find_elements *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L536) 

> def find_element *args

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [x](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/driver.rb#L543) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [NoArgMethods](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L7) 

> NoArgMethods = {



--

##### [app_strings](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L22) 

> def app_strings

Return the hash of all localization strings.
```ruby
app_strings #=> "TransitionsTitle"=>"Transitions", "WebTitle"=>"Web"
```

--

##### [background_app](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L28) 

> def background_app

Backgrounds the app for a set number of seconds.
This is a blocking application

--

##### [current_activity](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L33) 

> def current_activity



--

##### [launch](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L35) 

> def launch

Start the simulator and applicaton configured with desired capabilities

--

##### [reset](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L38) 

> def reset

Reset the device, relaunching the application.

--

##### [shake](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L41) 

> def shake

Cause the device to shake

--

##### [complex_find](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L44) 

> def complex_find

Find an element by a complex array of criteria.  Available criteria
are listed in [link here].  Criteria are formed by creating an array
of arrays, each containing a selector and that selector's value.

```ruby
complex_find [[[2, 'Sau'], [14, true]]] # => Find a clickable element
                                        #    whose names starts with 'Sau'
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Symbol] mod - If present, will be the 0th element in the selector array.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Object>] selectors - The selectors to find elements with.

--

##### [hide_keyboard](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L56) 

> def hide_keyboard

Hide the onscreen keyboard

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] close_key - the name of the key which closes the keyboard.
Defaults to 'Done'.

--

##### [key_event](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L65) 

> def key_event

Send a key event to the device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] key - The key to send.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] metastate - The state the metakeys should be in when sending the key.

--

##### [push_file](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L70) 

> def push_file

Place a file in a specific location on the device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - The absolute path on the device to store data at.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] data - Raw file data to be sent to the device.

--

##### [extend_search_contexts](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L254) 

> def extend_search_contexts



--

##### [accessiblity_id_find](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L254) 

> def accessiblity_id_find

find_element/s with their accessibility_id

```ruby
 find_elements :accessibility_id, 'Animation'
```

--

##### [add_touch_actions](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L260) 

> def add_touch_actions



--

##### [current_context=](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L284) 

> def current_context=

Change the context to the given context.
```ruby
current_context= "NATIVE_APP"
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The - context to change to

--

##### [current_context](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L292) 

> def current_context



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The context currently being used.

--

##### [available_contexts](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L295) 

> def available_contexts



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] All usable contexts, as an array of strings.

--

##### [within_context](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L305) 

> def within_context(context)

Perform a block within the given context, then switch back to the starting context.
```ruby
within_context('NATIVE_APP') do
  find_element [:tag, "button"]
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] context - The context to switch to for the duration of the block.

--

##### [switch_to_default_context](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/device.rb#L312) 

> def switch_to_default_context

Change to the default context.  This is equivalent to `current_context= nil`.

--

##### [pinch](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/multi_touch.rb#L30) 

> def pinch(percentage=25, auto_perform=true)

Convenience method for pinching the screen.
Places two fingers at the edges of the screen and brings them together.
```ruby
action = pinch 75 #=> Pinch the screen from the top right and bottom left corners
action.perform    #=> to 25% of its size.
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

--

##### [zoom](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/multi_touch.rb#L58) 

> def zoom(percentage=200, auto_perform=true)

Convenience method for zooming the screen.
Places two fingers at the edges of the screen and brings them together.
```ruby
action = zoom 200 #=> Zoom in the screen from the center until it doubles in size.
action.perform
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

--

##### [initialize](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/multi_touch.rb#L79) 

> def initialize

Create a new multi-action

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MultiTouch] a new instance of MultiTouch

--

##### [add](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/multi_touch.rb#L85) 

> def add(chain)

Add a touch_action to be performed

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] chain - The action to add to the chain

--

##### [perform](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/multi_touch.rb#L90) 

> def perform

Ask Appium to perform the actions

--

##### [ACTIONS](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L12) 

> ACTIONS = [:move_to, :press_for_duration, :press, :release, :tap, :wait, :perform]



--

##### [COMPLEX_ACTIONS](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L13) 

> COMPLEX_ACTIONS = [:swipe]



--

##### [actions](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L27) 

> def actions

Returns the value of attribute actions

--

##### [initialize](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L29) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] a new instance of TouchAction

--

##### [move_to](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L37) 

> def move_to(opts)

Move to the given co-ordinates.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [press_for_duration](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L47) 

> def press_for_duration(element, x, y, duration)

Press down for a specific duration.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[WebDriver::Element] element - the element to press.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] x - x co-ordinate to press on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] y - y co-ordinate to press on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] duration - Number of seconds to press.

--

##### [press](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L58) 

> def press(opts)

Press a finger onto the screen.  Finger will stay down until you call
`release`.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [release](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L69) 

> def release(opts=nil)

Remove a finger from the screen.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [tap](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L80) 

> def tap(opts)

Touch a point on the screen

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [wait](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L88) 

> def wait(seconds)

Pause for a number of seconds before the next action

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] seconds - Number of seconds to pause for

--

##### [swipe](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L99) 

> def swipe(opts)

Convenience method to peform a swipe.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [perform](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L114) 

> def perform

Ask the driver to perform all actions in this action chain.

--

##### [cancel](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L120) 

> def cancel

Does nothing, currently.

--

##### [chain_method](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L128) 

> def chain_method(method, args=nil)



--

##### [args_with_ele_ref](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/device/touch_actions.rb#L137) 

> def args_with_ele_ref(args)



--

##### [wait](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L33) 

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

##### [ignore](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L49) 

> def ignore &block

Return block.call and ignore any exceptions.

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L64) 

> def wait_true max_wait=30, interval=0.5, &block

Check every 0.5 seconds to see if block.call returns a truthy value.
Note this isn't a strict boolean true, any truthy value is accepted.
false and nil are considered failures.
Give up after 30 seconds.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] max_wait - the maximum time in seconds to wait for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] interval - the time in seconds to wait after calling the block

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Block] block - the block to call

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] the result of block.call

--

##### [back](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L81) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L86) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L94) 

> def xpath xpath_str

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L102) 

> def xpaths xpath_str

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [source](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L108) 

> def source

Prints xml of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [get_source](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L118) 

> def get_source

Returns XML string for the current page
Same as driver.page_source

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [result](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L125) 

> def result

Returns the value of attribute result

--

##### [initialize](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L127) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L131) 

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L136) 

> def start_element name, attrs = []

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [formatted_result](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L140) 

> def formatted_result



--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L151) 

> def get_page_class

Returns a string of class counts.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L162) 

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L172) 

> def px_to_window_rel opts={}

Converts pixel values to window relative values

```ruby
px_to_window_rel x: 50, y: 150
```

--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L189) 

> def xml_keys target

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L197) 

> def xml_values target

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/helper.rb#L205) 

> def resolve_id id

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [window_size](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/element/window.rb#L5) 

> def window_size

Get the window's size

--

##### [UIAStaticText](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L4) ios

> UIAStaticText = 'UIAStaticText'



--

##### [s_text](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L10) ios

> def s_text value

Find the first UIAStaticText that contains value or by index.
If int then the UIAStaticText at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [s_texts](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L18) ios

> def s_texts value

Find all UIAStaticText containing value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText>] 

--

##### [first_s_text](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L24) ios

> def first_s_text

Find the first UIAStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [last_s_text](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L30) ios

> def last_s_text

Find the last UIAStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [s_text_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L37) ios

> def s_text_exact value

Find the first UIAStaticText that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [s_texts_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L44) ios

> def s_texts_exact value

Find all UIAStaticTexts that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText>] 

--

##### [e_s_texts](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/text.rb#L50) ios

> def e_s_texts

Find all UIAStaticTexts.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText>] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/alert.rb#L5) ios

> def alert_accept

Accept the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/alert.rb#L13) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [uiautomation_find](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/mobile_methods.rb#L10) ios

> def uiautomation_find

find_element/s can be used with a [UIAutomation command](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Reference/UIAWindowClassReference/UIAWindow/UIAWindow.html#//apple_ref/doc/uid/TP40009930).

```ruby
 find_elements :uiautomation, 'elements()
```

--

##### [UIAButton](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L4) ios

> UIAButton = 'UIAButton'



--

##### [button](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L10) ios

> def button value

Find the first UIAButton that contains value or by index.
If int then the UIAButton at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L19) ios

> def buttons value

Find all UIAButtons containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L25) ios

> def first_button

Find the first UIAButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L31) ios

> def last_button

Find the last UIAButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L38) ios

> def button_exact value

Find the first UIAButton that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L45) ios

> def buttons_exact value

Find all UIAButtons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton>] 

--

##### [e_buttons](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/button.rb#L51) ios

> def e_buttons

Find all UIAButtons.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton>] 

--

##### [find](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/generic.rb#L7) ios

> def find value

Find the first element containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/generic.rb#L14) ios

> def finds value

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/generic.rb#L21) ios

> def find_exact value

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/generic.rb#L28) ios

> def finds_exact value

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [UIATextField](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L3) ios

> UIATextField       = 'UIATextField'



--

##### [UIASecureTextField](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L4) ios

> UIASecureTextField = 'UIASecureTextField'



--

##### [textfield](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L38) ios

> def textfield value

Find the first TextField that contains value or by index.
If int then the TextField at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L54) ios

> def textfields value

Find all TextFields containing value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L60) ios

> def first_textfield

Find the first TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L66) ios

> def last_textfield

Find the last TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L73) ios

> def textfield_exact value

Find the first TextField that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields_exact](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L80) ios

> def textfields_exact value

Find all TextFields that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [e_textfields](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/ios/element/textfield.rb#L86) ios

> def e_textfields

Find all TextFields.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [value](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/patch.rb#L10) 

> def value

Returns the value attribute

Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element

--

##### [name](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/patch.rb#L17) 

> def name

Returns the name attribute

Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element

--

##### [location_rel](https://github.com/appium/ruby_lib/blob/b5414b7885804ccabddb53315a12c3b525924654/lib/appium_lib/common/patch.rb#L29) 

> def location_rel

For use with mobile tap.

```ruby
execute_script 'mobile: tap', :x => 0.0, :y => 0.98
```

https://github.com/appium/appium/wiki/Automating-mobile-gestures

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }

--

