##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L70) 

> def self.load_appium_txt(opts = {})

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

##### [symbolize_keys](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L139) 

> def self.symbolize_keys(hash)

convert all keys (including nested) to symbols

based on deep_symbolize_keys & deep_transform_keys from rails
https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L160) 

> def self.promote_singleton_appium_methods(modules)

This method is intended to work with page objects that share
a common module. For example, Page::HomePage, Page::SignIn
those could be promoted on with Appium.promote_singleton_appium_methods Page

If you are promoting on an individual class then you should use
Appium.promote_appium_methods instead. The singleton method is intended
only for the shared module use case.

if modules is a module instead of an array, then the constants of
that module are promoted on.
otherwise, the array of modules will be used as the promotion target.

--

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L211) 

> def self.promote_appium_methods(class_array)

Promote appium methods to class instance methods

To promote methods to all classes:

```ruby
Appium.promote_appium_methods Object
```

It's better to promote on specific classes instead of Object

```ruby
# promote on rspec
Appium.promote_appium_methods RSpec::Core::ExampleGroup
```

```ruby
# promote on minispec
Appium.promote_appium_methods Minitest::Spec
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L245) 

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L245) 

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [caps](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L247) 

> def caps

Selenium webdriver capabilities

--

##### [caps=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L247) 

> def caps=(value)

Selenium webdriver capabilities

--

##### [custom_url](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L249) 

> def custom_url

Custom URL for the selenium server

--

##### [custom_url=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L249) 

> def custom_url=(value)

Custom URL for the selenium server

--

##### [export_session](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L251) 

> def export_session

Export session id to textfile in /tmp for 3rd party tools

--

##### [export_session=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L251) 

> def export_session=(value)

Export session id to textfile in /tmp for 3rd party tools

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L256) 

> def default_wait

Default wait time for elements to appear
Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [default_wait=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L256) 

> def default_wait=(value)

Default wait time for elements to appear
Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [last_waits](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L258) 

> def last_waits

Array of previous wait time values

--

##### [last_waits=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L258) 

> def last_waits=(value)

Array of previous wait time values

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L260) 

> def sauce_username

Username for use on Sauce Labs

--

##### [sauce_username=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L260) 

> def sauce_username=(value)

Username for use on Sauce Labs

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L262) 

> def sauce_access_key

Access Key for use on Sauce Labs

--

##### [sauce_access_key=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L262) 

> def sauce_access_key=(value)

Access Key for use on Sauce Labs

--

##### [appium_port](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L264) 

> def appium_port

Appium's server port

--

##### [appium_port=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L264) 

> def appium_port=(value)

Appium's server port

--

##### [appium_device](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L266) 

> def appium_device

Device type to request from the appium server

--

##### [appium_device=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L266) 

> def appium_device=(value)

Device type to request from the appium server

--

##### [appium_debug](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L268) 

> def appium_debug

Boolean debug mode for the Appium Ruby bindings

--

##### [appium_debug=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L268) 

> def appium_debug=(value)

Boolean debug mode for the Appium Ruby bindings

--

##### [driver](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L272) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [initialize](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L293) 

> def initialize(opts = {})

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
Appium::Driver.new(opts).start_driver
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [driver_attributes](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L359) 

> def driver_attributes

Returns a hash of the driver attributes

--

##### [device_is_android?](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L379) 

> def device_is_android?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [appium_server_version](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L395) 

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

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L407) 

> def self.absolute_app_path(opts)

Converts app_path to an absolute path.

opts is the full options hash (caps and appium_lib). If server_url is set
then the app path is used as is.

if app isn't set then an error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L440) 

> def server_url

Get the server url

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L451) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L462) 

> def screenshot(png_save_path)

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L469) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L478) 

> def start_driver

Creates a new global driver and quits the old one if it exists.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L506) 

> def no_wait

Set implicit wait and default_wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L525) 

> def set_wait(timeout = nil)

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

##### [exists](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L552) 

> def exists(pre_check = 0, post_check = @default_wait, &search_block)

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

##### [execute_script](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L576) 

> def execute_script(script, *args)

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - the script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L584) 

> def find_elements(*args)

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L592) 

> def find_element(*args)

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - the args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [set_location](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L605) 

> def set_location(opts = {})

Calls @driver.set_location

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - consisting of:

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Location] the location constructed by the selenium webdriver

--

##### [x](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/driver.rb#L615) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [logger=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/logger.rb#L13) 

> def logger=(value)

Sets the attribute logger

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value - the value to set the attribute logger to.

--

##### [logger](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/logger.rb#L17) 

> def logger



--

##### [NoArgMethods](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L7) 

> NoArgMethods = {



--

##### [app_strings](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L24) 

> def app_strings

Return the hash of all localization strings.
```ruby
app_strings #=> "TransitionsTitle"=>"Transitions", "WebTitle"=>"Web"
```

--

##### [background_app](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L30) 

> def background_app

Backgrounds the app for a set number of seconds.
This is a blocking application

--

##### [current_activity](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L35) 

> def current_activity



--

##### [launch_app](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L37) 

> def launch_app

Start the simulator and application configured with desired capabilities

--

##### [reset](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L40) 

> def reset

Reset the device, relaunching the application.

--

##### [shake](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L43) 

> def shake

Cause the device to shake

--

##### [toggle_flight_mode](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L46) 

> def toggle_flight_mode

Toggle flight mode on or off

--

##### [device_locked?](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L49) 

> def device_locked?



--

##### [hide_keyboard](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L51) 

> def hide_keyboard

Hide the onscreen keyboard

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] close_key - the name of the key which closes the keyboard.
Defaults to 'Done'.

--

##### [press_keycode](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L60) 

> def press_keycode

Press keycode on the device.
http://developer.android.com/reference/android/view/KeyEvent.html

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] key - The key to press.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] metastate - The state the metakeys should be in when pressing the key.

--

##### [long_press_keycode](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L66) 

> def long_press_keycode

Long press keycode on the device.
http://developer.android.com/reference/android/view/KeyEvent.html

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] key - The key to long press.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] metastate - The state the metakeys should be in when long pressing the key.

--

##### [push_file](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L72) 

> def push_file

Place a file in a specific location on the device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - The absolute path on the device to store data at.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] data - Raw file data to be sent to the device.

--

##### [pull_file](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L77) 

> def pull_file

Retrieve a file from the device.  This can retrieve an absolute path or
a path relative to the installed app (iOS only).
```ruby
pull_file '/local/data/some/path' #=> Get the file at that path
pull_file 'Shenanigans.app/some/file' #=> Get 'some/file' from the install location of Shenanigans.app
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - Either an absolute path OR, for iOS devices, a path relative to the app, as described.

--

##### [pull_folder](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L87) 

> def pull_folder

Retrieve a folder from the device.
```ruby
pull_folder '/data/local/tmp' #=> Get the folder at that path
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - absolute path to the folder

--

##### [end_coverage](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L95) 

> def end_coverage

Android only;  Ends the test coverage and writes the results to the given path on device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - Path on the device to write too.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] intent - Intent to broadcast when ending coverage.

--

##### [get_settings](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L100) 

> def get_settings

Get appium Settings for current test session

--

##### [extend_search_contexts](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L351) 

> def extend_search_contexts



--

##### [accessiblity_id_find](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L351) 

> def accessiblity_id_find

find_element/s with their accessibility_id

```ruby
 find_elements :accessibility_id, 'Animation'
```

--

##### [add_touch_actions](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L357) 

> def add_touch_actions



--

##### [set_context](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L381) 

> def set_context

Change the context to the given context.
```ruby
set_context "NATIVE_APP"
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The - context to change to

--

##### [current_context](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L389) 

> def current_context



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The context currently being used.

--

##### [available_contexts](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L392) 

> def available_contexts



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] All usable contexts, as an array of strings.

--

##### [within_context](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L402) 

> def within_context(context)

Perform a block within the given context, then switch back to the starting context.
```ruby
within_context('NATIVE_APP') do
  find_element [:tag, "button"]
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] context - The context to switch to for the duration of the block.

--

##### [switch_to_default_context](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/device.rb#L410) 

> def switch_to_default_context

Change to the default context.  This is equivalent to `set_context nil`.

--

##### [pinch](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/multi_touch.rb#L28) 

> def pinch(percentage = 25, auto_perform = true)

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

##### [zoom](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/multi_touch.rb#L56) 

> def zoom(percentage = 200, auto_perform = true)

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

##### [initialize](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/multi_touch.rb#L77) 

> def initialize

Create a new multi-action

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MultiTouch] a new instance of MultiTouch

--

##### [add](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/multi_touch.rb#L83) 

> def add(chain)

Add a touch_action to be performed

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] chain - The action to add to the chain

--

##### [perform](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/multi_touch.rb#L88) 

> def perform

Ask Appium to perform the actions

--

##### [ACTIONS](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L11) 

> ACTIONS         = [:move_to, :long_press, :press, :release, :tap, :wait, :perform]



--

##### [COMPLEX_ACTIONS](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L12) 

> COMPLEX_ACTIONS = [:swipe]



--

##### [actions](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L26) 

> def actions

Returns the value of attribute actions

--

##### [initialize](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L28) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] a new instance of TouchAction

--

##### [move_to](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L36) 

> def move_to(opts)

Move to the given co-ordinates.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [long_press](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L46) 

> def long_press(opts)

Press down for a specific duration.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] element - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] x - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] y - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] duration - a customizable set of options

--

##### [press](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L58) 

> def press(opts)

Press a finger onto the screen.  Finger will stay down until you call
`release`.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [release](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L69) 

> def release(opts = nil)

Remove a finger from the screen.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [tap](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L80) 

> def tap(opts)

Touch a point on the screen

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L89) 

> def wait(milliseconds)

Pause for a number of milliseconds before the next action

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] milliseconds - Number of milliseconds to pause for

--

##### [swipe](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L103) 

> def swipe(opts)

Convenience method to peform a swipe.

Note that iOS 7 simulators have broken swipe.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [perform](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L118) 

> def perform

Ask the driver to perform all actions in this action chain.

--

##### [cancel](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L124) 

> def cancel

Does nothing, currently.

--

##### [chain_method](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L132) 

> def chain_method(method, args = nil)



--

##### [args_with_ele_ref](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/device/touch_actions.rb#L141) 

> def args_with_ele_ref(args)



--

##### [_generic_wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/wait.rb#L9) 

> def _generic_wait(opts = {}, &block)

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

--

##### [_process_wait_opts](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/wait.rb#L54) 

> def _process_wait_opts(opts)

process opts before calling _generic_wait

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/wait.rb#L75) 

> def wait_true(opts = {}, &block)

Check every interval seconds to see if block.call returns a truthy value.
Note this isn't a strict boolean true, any truthy value is accepted.
false and nil are considered failures.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - Options

--

##### [wait](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/wait.rb#L93) 

> def wait(opts = {}, &block)

Check every interval seconds to see if block.call doesn't raise an exception.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - Options

--

##### [ignore](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L24) 

> def ignore(&block)

Return block.call and ignore any exceptions.

--

##### [back](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L31) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L36) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L44) 

> def xpath(xpath_str)

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L52) 

> def xpaths(xpath_str)

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [_print_source](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L56) 

> def _print_source(source)



--

##### [result](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L69) 

> def result

Returns the value of attribute result

--

##### [initialize](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L71) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L75) 

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L80) 

> def start_element(name, attrs = [])

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [formatted_result](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L86) 

> def formatted_result



--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L97) 

> def get_page_class

Returns a string of class counts of visible elements.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L108) 

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L118) 

> def px_to_window_rel(opts = {})

Converts pixel values to window relative values

```ruby
px_to_window_rel x: 50, y: 150
```

--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L137) 

> def xml_keys(target)

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L145) 

> def xml_values(target)

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L153) 

> def resolve_id(id)

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [filter](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L159) 

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L162) 

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L168) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HTMLElements] a new instance of HTMLElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L173) 

> def reset



--

##### [result](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L179) 

> def result



--

##### [start_element](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L195) 

> def start_element(name, attrs = [])



--

##### [end_element](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L204) 

> def end_element(name)



--

##### [characters](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L210) 

> def characters(chars)



--

##### [_no_such_element](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/helper.rb#L217) 

> def _no_such_element



--

##### [window_size](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/element/window.rb#L5) 

> def window_size

Get the window's size

--

##### [ios_password](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L8) ios

> def ios_password(length = 1)

iOS only. On Android uiautomator always returns an empty string for EditText password.

Password character returned from value of UIASecureTextField

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] length - the length of the password to generate

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the returned string is of size length

--

##### [get_page](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L20) ios

> def get_page(element = source_window(0), class_name = nil)

Returns a string of interesting elements. iOS only.

Defaults to inspecting the 1st windows source only.
use get_page(get_source) for all window sources

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] element - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] class_name - a customizable set of options

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [page](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L129) ios

> def page(opts = {})

Prints a string of interesting elements to the console.

Example

```ruby
page class: :UIAButton # filter on buttons
page window: 1 # show source for window 1
page class: :UIAButton, window: 1
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] window - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] class - a customizable set of options

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [source_window](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L161) ios

> def source_window(window_number = 0)

Gets the JSON source of window number

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [page_window](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L175) ios

> def page_window(window_number = 0)

Prints parsed page source to console.

example: page_window 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [id](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L183) ios

> def id(id)

Find by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ios_version](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L189) ios

> def ios_version

Return the iOS version as an array of integers

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Integer>] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L198) ios

> def ele_index(class_name, index)

Get the element of type class_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_ele_by_attr](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L225) ios

> def find_ele_by_attr(class_name, attr, value)

Find the first element exactly matching class and attribute value.
Note: Uses XPath

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to inspect

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the expected value of the attribute

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_eles_by_attr](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L235) ios

> def find_eles_by_attr(class_name, attr, value)

Find all elements exactly matching class and attribute value.
Note: Uses XPath

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must have

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_ele_by_attr_include](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L250) ios

> def find_ele_by_attr_include(class_name, attr, value)

Get the first tag by attribute that exactly matches value.
Note: Uses XPath

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--

##### [find_eles_by_attr_include](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L260) ios

> def find_eles_by_attr_include(class_name, attr, value)

Get tags by attribute that include value.
Note: Uses XPath

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L267) ios

> def first_ele(class_name)

Get the first tag that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L275) ios

> def last_ele(class_name)

Get the last tag that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L283) ios

> def tag(class_name)

Returns the first visible element matching class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tags](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L294) ios

> def tags(class_name)

Returns all visible elements matching class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ele_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L329) ios

> def ele_by_json_visible_contains(element, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L337) ios

> def eles_by_json_visible_contains(element, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [ele_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L366) ios

> def ele_by_json_visible_exact(element, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L374) ios

> def eles_by_json_visible_exact(element, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [_all_pred](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L438) ios

> def _all_pred(opts)

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

--

##### [ele_with_pred](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L451) ios

> def ele_with_pred(opts)

returns element matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_with_pred](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L462) ios

> def eles_with_pred(opts)

returns elements matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [source](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L468) ios

> def source

Prints xml of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [_validate_object](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L472) ios

> def _validate_object(*objects)



--

##### [_by_json](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L520) ios

> def _by_json(opts)

typeArray - array of string types to search for. Example: ["UIAStaticText"]
onlyFirst - boolean. returns only the first result if true. Example: true
onlyVisible - boolean. returns only visible elements if true. Example: true
target - string. the target value to search for. Example: "Buttons, Various uses of UIButton"
substring - boolean. matches on substrings if true otherwise an exact mathc is required. Example: true
insensitive - boolean. ignores case sensitivity if true otherwise it's case sensitive. Example: true

opts = {
  typeArray: ["UIAStaticText"],
  onlyFirst: true,
  onlyVisible: true,
  name: {
    target: "Buttons, Various uses of UIButton",
    substring: false,
    insensitive: false,
  },
  label: {
    target: "Buttons, Various uses of UIButton",
    substring: false,
    insensitive: false,
  },
  value: {
    target: "Buttons, Various uses of UIButton",
    substring: false,
    insensitive: false,
  }
}

--

##### [eles_by_json](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L569) ios

> def eles_by_json(opts)

example usage:

eles_by_json({
  typeArray: ["UIAStaticText"],
  onlyVisible: true,
  name: {
    target: "Buttons, Various uses of UIButton",
    substring: false,
    insensitive: false,
  },
})

--

##### [ele_by_json](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L575) ios

> def ele_by_json(opts)

see eles_by_json

--

##### [get_source](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/helper.rb#L585) ios

> def get_source

Returns XML string for the current page
Same as driver.page_source

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [UIAStaticText](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L4) ios

> UIAStaticText = 'UIAStaticText'



--

##### [text](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L10) ios

> def text(value)

Find the first UIAStaticText that contains value or by index.
If int then the UIAStaticText at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [texts](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L19) ios

> def texts(value = false)

Find all UIAStaticText containing value.
If value is omitted, all UIAStaticTexts are returned

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText>] 

--

##### [first_text](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L26) ios

> def first_text

Find the first UIAStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [last_text](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L32) ios

> def last_text

Find the last UIAStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [text_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L39) ios

> def text_exact(value)

Find the first UIAStaticText that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText] 

--

##### [texts_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/text.rb#L46) ios

> def texts_exact(value)

Find all UIAStaticTexts that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText>] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/alert.rb#L5) ios

> def alert_accept

Accept the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/alert.rb#L13) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [uiautomation_find](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/mobile_methods.rb#L10) ios

> def uiautomation_find

find_element/s can be used with a [UIAutomation command](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Reference/UIAWindowClassReference/UIAWindow/UIAWindow.html#//apple_ref/doc/uid/TP40009930).

```ruby
 find_elements :uiautomation, 'elements()
```

--

##### [UIAButton](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L4) ios

> UIAButton = 'UIAButton'



--

##### [button](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L10) ios

> def button(value)

Find the first UIAButton that contains value or by index.
If int then the UIAButton at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L20) ios

> def buttons(value = false)

Find all UIAButtons containing value.
If value is omitted, all UIAButtons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L27) ios

> def first_button

Find the first UIAButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L33) ios

> def last_button

Find the last UIAButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L40) ios

> def button_exact(value)

Find the first UIAButton that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/button.rb#L47) ios

> def buttons_exact(value)

Find all UIAButtons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton>] 

--

##### [find](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/generic.rb#L6) ios

> def find(value)

Find the first element containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/generic.rb#L13) ios

> def finds(value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/generic.rb#L20) ios

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/generic.rb#L27) ios

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [UIATextField](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L3) ios

> UIATextField       = 'UIATextField'



--

##### [UIASecureTextField](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L4) ios

> UIASecureTextField = 'UIASecureTextField'



--

##### [textfield](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L52) ios

> def textfield(value)

Find the first TextField that contains value or by index.
If int then the TextField at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L72) ios

> def textfields(value = false)

Find all TextFields containing value.
If value is omitted, all TextFields are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L79) ios

> def first_textfield

Find the first TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L85) ios

> def last_textfield

Find the last TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L94) ios

> def textfield_exact(value)

Find the first TextField that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields_exact](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/ios/element/textfield.rb#L101) ios

> def textfields_exact(value)

Find all TextFields that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [value](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/patch.rb#L12) 

> def value

Returns the value attribute

Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element

--

##### [name](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/patch.rb#L19) 

> def name

Returns the name attribute

Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element

--

##### [location_rel](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/patch.rb#L31) 

> def location_rel

For use with mobile tap.

```ruby
execute_script 'mobile: tap', :x => 0.0, :y => 0.98
```

https://github.com/appium/appium/wiki/Automating-mobile-gestures

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }

--

##### [DEFAULT_HEADERS](https://github.com/appium/ruby_lib/blob/af838966d0724793d3dbfa35798ca6dd9f8a3143/lib/appium_lib/common/patch.rb#L147) 

> DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }



--

