##### [load_settings](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L75) 

> def self.load_settings(opts = {})

Load arbitrary text ([toml format](https://github.com/toml-lang/toml))
The toml is parsed by https://github.com/fbernier/tomlrb .

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

##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L111) 

> def self.load_settings(opts = {})

Load arbitrary text ([toml format](https://github.com/toml-lang/toml))
The toml is parsed by https://github.com/fbernier/tomlrb .

```
[caps]
app = "path/to/app"

[appium_lib]
port = 8080
```

:app is expanded
:require is expanded
all keys are converted to symbols
rubocop:disable Style/Alias

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--

##### [expand_required_files](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L117) 

> def self.expand_required_files(base_dir, file_paths)



__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] base_dir - parent directory of loaded appium.txt (toml)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] file_paths - 

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] list of require files as an array, nil if require doesn't exist

--

##### [symbolize_keys](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L149) 

> def self.symbolize_keys(hash)

convert all keys (including nested) to symbols

based on deep_symbolize_keys & deep_transform_keys from rails
https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L170) 

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

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L223) 

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

##### [init_caps_for_appium](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L258) 

> def self.init_caps_for_appium(opts_caps = {})

except for browser_name, default capability is equal to ::Selenium::WebDriver::Remote::Capabilities.firefox
Because Selenium::WebDriver::Remote::Bridge uses Capabilities.firefox by default
https://github.com/SeleniumHQ/selenium/blob/selenium-3.0.1/rb/lib/selenium/webdriver/remote/bridge.rb#L67

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts_caps - Capabilities for Appium server. All capability keys are converted to lowerCamelCase when
this client sends capabilities to Appium server as JSON format.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Remote::Capabilities] Return instance of Selenium::WebDriver::Remote::Capabilities

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L276) 

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L276) 

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [caps](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L278) 

> def caps

Selenium webdriver capabilities

--

##### [caps=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L278) 

> def caps=(value)

Selenium webdriver capabilities

--

##### [custom_url](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L280) 

> def custom_url

Custom URL for the selenium server

--

##### [custom_url=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L280) 

> def custom_url=(value)

Custom URL for the selenium server

--

##### [export_session](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L282) 

> def export_session

Export session id to textfile in /tmp for 3rd party tools

--

##### [export_session=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L282) 

> def export_session=(value)

Export session id to textfile in /tmp for 3rd party tools

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L287) 

> def default_wait

Default wait time for elements to appear
Returns the default client side wait.
This value is independent of what the server is using

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L289) 

> def sauce_username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.

--

##### [sauce_username=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L289) 

> def sauce_username=(value)

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L291) 

> def sauce_access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.

--

##### [sauce_access_key=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L291) 

> def sauce_access_key=(value)

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.

--

##### [sauce_endpoint](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L293) 

> def sauce_endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests

--

##### [sauce_endpoint=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L293) 

> def sauce_endpoint=(value)

Override the Sauce Appium endpoint to allow e.g. TestObject tests

--

##### [appium_port](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L295) 

> def appium_port

Appium's server port

--

##### [appium_port=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L295) 

> def appium_port=(value)

Appium's server port

--

##### [appium_device](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L297) 

> def appium_device

Device type to request from the appium server

--

##### [appium_device=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L297) 

> def appium_device=(value)

Device type to request from the appium server

--

##### [automation_name](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L300) 

> def automation_name

Automation name sent to appium server or received from server
If automation_name is nil, it is not set both client side and server side.

--

##### [appium_server_status](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L302) 

> def appium_server_status

Appium's server version

--

##### [appium_debug](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L304) 

> def appium_debug

Boolean debug mode for the Appium Ruby bindings

--

##### [appium_debug=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L304) 

> def appium_debug=(value)

Boolean debug mode for the Appium Ruby bindings

--

##### [listener](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L306) 

> def listener

instance of AbstractEventListener for logging support

--

##### [listener=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L306) 

> def listener=(value)

instance of AbstractEventListener for logging support

--

##### [driver](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L309) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [http_client](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L312) 

> def http_client

Return http client called in start_driver()

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Remote::Http::Default] the http client

--

##### [appium_wait_timeout](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L317) 

> def appium_wait_timeout

Return a time wait timeout
Wait time for ::Appium::Common.wait or ::Appium::Common.wait_true.
Provide Appium::Drive like { appium_lib: { wait_timeout: 20 } }

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [appium_wait_interval](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L322) 

> def appium_wait_interval

Return a time wait timeout
Wait interval time for ::Appium::Common.wait or ::Appium::Common.wait_true.
Provide Appium::Drive like { appium_lib: { wait_interval: 20 } }

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] 

--

##### [initialize](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L362) 

> def initialize(opts = {})

Creates a new driver

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [driver_attributes](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L440) 

> def driver_attributes

Returns a hash of the driver attributes

--

##### [device_is_android?](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L465) 

> def device_is_android?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_xcuitest?](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L471) 

> def automation_name_is_xcuitest?

Return true if automationName is 'XCUITest'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [check_server_version_xcuitest](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L478) 

> def check_server_version_xcuitest

Return true if the target Appium server is over REQUIRED_VERSION_XCUITEST.
If the Appium server is under REQUIRED_VERSION_XCUITEST, then error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [appium_server_version](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L497) 

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

##### [appium_client_version](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L510) 

> def appium_client_version

Returns the client's version info

```ruby
{
    "version" => "9.1.1"
}
```

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L522) 

> def self.absolute_app_path(opts)

Converts app_path to an absolute path.

opts is the full options hash (caps and appium_lib). If server_url is set
then the app path is used as is.

if app isn't set then an error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L555) 

> def server_url

Get the server url

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L566) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L577) 

> def screenshot(png_save_path)

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L584) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L594) 

> def start_driver

Creates a new global driver and quits the old one if it exists.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L632) 

> def no_wait

Set implicit wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L646) 

> def set_wait(timeout = nil)

Set implicit wait. Default to @default_wait.

```ruby`
set_wait 2
set_wait # @default_wait

````

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L663) 

> def exists(pre_check = 0, post_check = @default_wait)

Returns existence of element.

Example:

exists { button('sign in') } ? puts('true') : puts('false')

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] pre_check - The amount in seconds to set the
wait to before checking existence

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] post_check - The amount in seconds to set the
wait to after checking existence

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [execute_script](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L687) 

> def execute_script(script, *args)

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - The script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L695) 

> def find_elements(*args)

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L703) 

> def find_element(*args)

Calls @driver.find_elements

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [set_location](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L716) 

> def set_location(opts = {})

Calls @driver.set_location

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - consisting of:

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Location] the location constructed by the selenium webdriver

--

##### [x](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L726) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [set_automation_name_if_nil](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/driver.rb#L735) 

> def set_automation_name_if_nil

If "automationName" is set only server side, this method set "automationName" attribute into @automation_name.
Since @automation_name is set only client side before start_driver is called.

--

##### [logger=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/logger.rb#L13) 

> def logger=(value)

Sets the attribute logger

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value - the value to set the attribute logger to.

--

##### [logger](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/logger.rb#L17) 

> def logger



--

##### [app_strings](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L7) 

> def app_strings

Return the hash of all localization strings.
```ruby
app_strings #=> "TransitionsTitle"=>"Transitions", "WebTitle"=>"Web"
```

--

##### [background_app](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L13) 

> def background_app

Backgrounds the app for a set number of seconds.
This is a blocking application

--

##### [current_activity](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L24) 

> def current_activity



--

##### [get_system_bars](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L26) 

> def get_system_bars

Get system bar's information
```ruby
get_system_bars
```

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] System bar

--

##### [get_display_density](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L34) 

> def get_display_density

Get connected device's density.
```ruby
get_display_density # 320
```

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] The size of density

--

##### [is_keyboard_shown](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L42) 

> def is_keyboard_shown

Get whether keyboard is displayed or not.
```ruby
is_keyboard_shown # false
```

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] Return true if keyboard is shown. Return false if keyboard is hidden.

--

##### [launch_app](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L50) 

> def launch_app

Start the simulator and application configured with desired capabilities

--

##### [reset](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L53) 

> def reset

Reset the device, relaunching the application.

--

##### [shake](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L56) 

> def shake

Cause the device to shake

--

##### [toggle_flight_mode](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L59) 

> def toggle_flight_mode

Toggle flight mode on or off

--

##### [device_locked?](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L62) 

> def device_locked?



--

##### [hide_keyboard](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L64) 

> def hide_keyboard

Hide the onscreen keyboard

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] close_key - The name of the key which closes the keyboard.
Defaults to 'Done'.

--

##### [press_keycode](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L73) 

> def press_keycode

Press keycode on the device.
http://developer.android.com/reference/android/view/KeyEvent.html

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] key - The key to press.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] metastate - The state the metakeys should be in when pressing the key.

--

##### [long_press_keycode](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L79) 

> def long_press_keycode

Long press keycode on the device.
http://developer.android.com/reference/android/view/KeyEvent.html

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] key - The key to long press.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] metastate - The state the metakeys should be in when long pressing the key.

--

##### [push_file](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L85) 

> def push_file

Place a file in a specific location on the device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - The absolute path on the device to store data at.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] data - Raw file data to be sent to the device.

--

##### [pull_file](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L90) 

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

##### [pull_folder](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L100) 

> def pull_folder

Retrieve a folder from the device.
```ruby
pull_folder '/data/local/tmp' #=> Get the folder at that path
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - absolute path to the folder

--

##### [touch_id](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L108) 

> def touch_id

iOS only;  Simulate Touch ID with either valid (match == true) or invalid (match == false) fingerprint.
```ruby
touch_id true #=> Simulate valid fingerprint
touch_id false #=> Simulate invalid fingerprint
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] match - fingerprint validity
Defaults to true.

--

##### [toggle_touch_id_enrollment](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L117) 

> def toggle_touch_id_enrollment

iOS Simulator only:  Toggle touch id enrollment on an iOS Simulator.

--

##### [end_coverage](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L120) 

> def end_coverage

Android only;  Ends the test coverage and writes the results to the given path on device.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - Path on the device to write too.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] intent - Intent to broadcast when ending coverage.

--

##### [get_settings](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L125) 

> def get_settings

Get appium Settings for current test session

--

##### [update_settings](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L128) 

> def update_settings

Update appium Settings for current test session

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] settings - Settings to update, keys are settings, values to value to set each setting to

--

##### [start_activity](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L132) 

> def start_activity

Start a new activity within the current app or launch a new app and start the target activity.

Android only.
```ruby
start_activity app_package: 'io.appium.android.apis',
  app_activity: '.accessibility.AccessibilityNodeProviderActivity'
```

--

##### [get_network_connection](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L146) 

> def get_network_connection

Get the device network connection current status
See set_network_connection method for return value

--

##### [set_network_connection](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L150) 

> def set_network_connection

Set the device network connection mode
Value (Alias)      | Data | Wifi | Airplane Mode
-------------------------------------------------
1 (Airplane Mode)  | 0    | 0    | 1
6 (All network on) | 1    | 1    | 0
4 (Data only)      | 1    | 0    | 0
2 (Wifi only)      | 0    | 1    | 0
0 (None)           | 0    | 0    | 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] path - Bit mask that represent the network mode

--

##### [set_immediate_value](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L163) 

> def set_immediate_value

Set the value to element directly
for iOS; setValue is called in XCUITest instead because XCUITest doesn't provide set value directly.
https://github.com/appium/appium-xcuitest-driver/blob/793cdc7d5e84bd553e375076e1c6dc7e242c9cde/lib/commands/element.js#L123

```ruby
set_immediate_value element, 'hello'
```

--

##### [get_performance_data_types](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L172) 

> def get_performance_data_types

Get the information type of the system state which is supported to read such as
cpu, memory, network, battery via adb commands.
https://github.com/appium/appium-base-driver/blob/be29aec2318316d12b5c3295e924a5ba8f09b0fb/lib/mjsonwp/routes.js#L300

```ruby
get_performance_data_types #=> ["cpuinfo", "batteryinfo", "networkinfo", "memoryinfo"]
```

--

##### [extend_search_contexts](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L434) 

> def extend_search_contexts



--

##### [find_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L434) 

> def find_element



--

##### [find_elements](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L434) 

> def find_elements

find_element/s with their accessibility_id

```ruby
 find_elements :accessibility_id, 'Animation'
```

--

##### [add_touch_actions](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L465) 

> def add_touch_actions



--

##### [add_ime_actions](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L488) 

> def add_ime_actions



--

##### [set_context](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L563) 

> def set_context

Change the context to the given context.
```ruby
set_context "NATIVE_APP"
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The - context to change to

--

##### [current_context](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L571) 

> def current_context



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] The context currently being used.

--

##### [available_contexts](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L574) 

> def available_contexts



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<String>] All usable contexts, as an array of strings.

--

##### [within_context](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L584) 

> def within_context(context)

Perform a block within the given context, then switch back to the starting context.
```ruby
within_context('NATIVE_APP') do
  find_element [:tag, "button"]
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] context - The context to switch to for the duration of the block.

--

##### [switch_to_default_context](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/device.rb#L592) 

> def switch_to_default_context

Change to the default context.  This is equivalent to `set_context nil`.

--

##### [pinch](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L28) 

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

##### [zoom](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L57) 

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

##### [pinch_for_xcuitest](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L79) 

> def pinch_for_xcuitest(rate)



--

##### [pinch_android](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L94) 

> def pinch_android(rate)



--

##### [pinch_ios](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L108) 

> def pinch_ios(rate)



--

##### [zoom_for_xcuitest](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L122) 

> def zoom_for_xcuitest(rate)



--

##### [zoom_android](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L137) 

> def zoom_android(rate)



--

##### [zoom_ios](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L151) 

> def zoom_ios(rate)



--

##### [actions](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L166) 

> def actions

self

--

##### [initialize](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L169) 

> def initialize

Create a new multi-action

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MultiTouch] a new instance of MultiTouch

--

##### [add](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L175) 

> def add(chain)

Add a touch_action to be performed

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] chain - The action to add to the chain

--

##### [perform](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/multi_touch.rb#L180) 

> def perform

Ask Appium to perform the actions

--

##### [ACTIONS](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L20) 

> ACTIONS         = [:move_to, :long_press, :double_tap, :two_finger_tap, :press, :release, :tap, :wait, :perform].freeze



--

##### [COMPLEX_ACTIONS](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L21) 

> COMPLEX_ACTIONS = [:swipe].freeze



--

##### [actions](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L35) 

> def actions

Returns the value of attribute actions

--

##### [initialize](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L37) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] a new instance of TouchAction

--

##### [move_to](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L48) 

> def move_to(opts)

Move to the given co-ordinates.

`move_to`'s `x` and `y` have two case. One is working as coordinate, the other is working as offset.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [long_press](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L62) 

> def long_press(opts)

Press down for a specific duration.
Alternatively, you can use `press(...).wait(...).release()` instead of `long_press` if duration doesn't work well.
https://github.com/appium/ruby_lib/issues/231#issuecomment-269895512
e.g. Appium::TouchAction.new.press(x: 280, y: 530).wait(2000).release.perform

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] element - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] x - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] y - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] duration - a customizable set of options

--

##### [press](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L74) 

> def press(opts)

Press a finger onto the screen.  Finger will stay down until you call
`release`.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [release](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L85) 

> def release(opts = nil)

Remove a finger from the screen.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [tap](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L97) 

> def tap(opts)

Touch a point on the screen.
Alternatively, you can use `press(...).release.perform` instead of `tap(...).perform`.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [double_tap](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L110) 

> def double_tap(opts)

Double tap an element on the screen

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [two_finger_tap](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L121) 

> def two_finger_tap(opts)

Two finger tap an element on the screen

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L129) 

> def wait(milliseconds)

Pause for a number of milliseconds before the next action

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[integer] milliseconds - Number of milliseconds to pause for

--

##### [swipe](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L152) 

> def swipe(opts, ele = nil)

Convenience method to peform a swipe.

Note that iOS 7 simulators have broken swipe.

For iOS: Use `offset_x` and `offset_y` to define the end point.

For Android: Use `end_x` and `end_y` to define the end point.

If you'd like more details, please read tests and its log samples in
`ios_tests/lib/ios/specs/device/touch_actions.rb` and `ios_tests/lib/ios/specs/device/touch_actions.rb`

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--

##### [perform](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L177) 

> def perform

Ask the driver to perform all actions in this action chain.

--

##### [cancel](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L184) 

> def cancel

Does nothing, currently.

--

##### [swipe_coordinates](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L190) 

> def swipe_coordinates(end_x: nil, end_y: nil, offset_x: nil, offset_y: nil)



--

##### [chain_method](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L208) 

> def chain_method(method, args = nil)



--

##### [args_with_ele_ref](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/device/touch_actions.rb#L214) 

> def args_with_ele_ref(args)



--

##### [_generic_wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/wait.rb#L9) 

> def _generic_wait(opts = {})

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

--

##### [_process_wait_opts](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/wait.rb#L48) 

> def _process_wait_opts(opts)

process opts before calling _generic_wait

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/wait.rb#L69) 

> def wait_true(opts = {}, &block)

Check every interval seconds to see if yield returns a truthy value.
Note this isn't a strict boolean true, any truthy value is accepted.
false and nil are considered failures.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - Options

--

##### [wait](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/wait.rb#L87) 

> def wait(opts = {}, &block)

Check every interval seconds to see if yield doesn't raise an exception.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - Options

--

##### [ignore](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L24) 

> def ignore

Return yield and ignore any exceptions.

--

##### [back](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L31) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L36) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L44) 

> def xpath(xpath_str)

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L52) 

> def xpaths(xpath_str)

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [_print_source](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L56) 

> def _print_source(source)



--

##### [result](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L69) 

> def result

Returns the value of attribute result

--

##### [initialize](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L71) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L75) 

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L80) 

> def start_element(name, attrs = [])

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [formatted_result](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L86) 

> def formatted_result



--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L97) 

> def get_page_class

Returns a string of class counts of visible elements.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L108) 

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L118) 

> def px_to_window_rel(opts = {})

Converts pixel values to window relative values

```ruby
px_to_window_rel x: 50, y: 150
```

--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L137) 

> def xml_keys(target)

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L145) 

> def xml_values(target)

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L153) 

> def resolve_id(id)

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [filter](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L159) 

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L162) 

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L168) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HTMLElements] a new instance of HTMLElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L173) 

> def reset



--

##### [result](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L179) 

> def result



--

##### [start_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L195) 

> def start_element(name, attrs = [])



--

##### [end_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L204) 

> def end_element(name)



--

##### [characters](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L210) 

> def characters(chars)



--

##### [_no_such_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/helper.rb#L217) 

> def _no_such_element



--

##### [COMMAND_NO_ARG](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/command.rb#L4) 

> COMMAND_NO_ARG = {



--

##### [COMMAND](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/command.rb#L27) 

> COMMAND = {



--

##### [window_size](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/element/window.rb#L5) 

> def window_size

Get the window's size

--

##### [FINDERS](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/search_context.rb#L5) 

> FINDERS = {

rubocop:disable Style/MutableConstant

--

##### [filter](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L4) ios

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L4) ios

> def filter=(value)

Sets the attribute filter

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value - the value to set the attribute filter to.

--

##### [start_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L6) ios

> def start_element(type, attrs = [])



--

##### [_print_attr](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L15) ios

> def _print_attr(type, name, label, value, hint)



--

##### [ios_password](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L41) ios

> def ios_password(length = 1)

iOS only. On Android uiautomator always returns an empty string for EditText password.

Password character returned from value of UIASecureTextField

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] length - the length of the password to generate

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the returned string is of size length

--

##### [get_page](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L53) ios

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

##### [page](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L139) ios

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

##### [source_window](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L170) ios

> def source_window(_window_number = 0)

Gets the JSON source of window number

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] _window_number - The int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[JSON] 

--

##### [page_window](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L185) ios

> def page_window(window_number = 0)

Prints parsed page source to console.

example: page_window 0

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] window_number - the int index of the target window

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [id](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L193) ios

> def id(id)

Find by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ios_version](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L199) ios

> def ios_version

Return the iOS version as an array of integers

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Integer>] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L212) ios

> def ele_index(class_name, index)

Get the element of type class_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_ele_by_attr](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L248) ios

> def find_ele_by_attr(class_name, attr, value)

Find the first element exactly matching class and attribute value.
Note: Uses XPath
Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to inspect

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the expected value of the attribute

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_eles_by_attr](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L259) ios

> def find_eles_by_attr(class_name, attr, value)

Find all elements exactly matching class and attribute value.
Note: Uses XPath
Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must have

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_ele_by_predicate](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L280) ios

> def find_ele_by_predicate(class_name: '*', value:)

Find the first element exactly matching attribute case insensitive value.
Note: Uses Predicate

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the expected value of the attribute

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_eles_by_predicate](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L291) ios

> def find_eles_by_predicate(class_name: '*', value:)

Find all elements exactly matching attribute case insensitive value.
Note: Uses Predicate

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must have

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_ele_by_attr_include](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L307) ios

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

##### [find_eles_by_attr_include](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L317) ios

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

##### [find_ele_by_predicate_include](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L325) ios

> def find_ele_by_predicate_include(class_name: '*', value:)

Get the first elements that include insensitive value.
Note: Uses Predicate

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--

##### [find_eles_by_predicate_include](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L336) ios

> def find_eles_by_predicate_include(class_name: '*', value:)

Get elements that include case insensitive value.
Note: Uses Predicate

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L349) ios

> def first_ele(class_name)

Get the first tag that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L356) ios

> def last_ele(class_name)

Get the last tag that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L370) ios

> def tag(class_name)

Returns the first **visible** element matching class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tags](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L382) ios

> def tags(class_name)

Returns all visible elements matching class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tags_include](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L398) ios

> def tags_include(class_names:, value: nil)

Returns all visible elements matching class_names and value
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--

##### [tags_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L427) ios

> def tags_exact(class_names:, value: nil)

Returns all visible elements matching class_names and value.
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--

##### [ele_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L478) ios

> def ele_by_json_visible_contains(element, value)

Find the first element that contains value.
For Appium(automation name), not XCUITest

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L487) ios

> def eles_by_json_visible_contains(element, value)

Find all elements containing value
For Appium(automation name), not XCUITest

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [ele_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L517) ios

> def ele_by_json_visible_exact(element, value)

Find the first element exactly matching value
For Appium(automation name), not XCUITest

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L526) ios

> def eles_by_json_visible_exact(element, value)

Find all elements exactly matching value
For Appium(automation name), not XCUITest

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [_all_pred](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L591) ios

> def _all_pred(opts)

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

--

##### [ele_with_pred](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L604) ios

> def ele_with_pred(opts)

returns element matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [eles_with_pred](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L615) ios

> def eles_with_pred(opts)

returns elements matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [source](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L621) ios

> def source

Prints xml of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [_validate_object](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L625) ios

> def _validate_object(*objects)



--

##### [_by_json](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L674) ios

> def _by_json(opts)

For Appium(automation name), not XCUITest
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

##### [eles_by_json](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L724) ios

> def eles_by_json(opts)

For Appium(automation name), not XCUITest
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

##### [ele_by_json](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L730) ios

> def ele_by_json(opts)

see eles_by_json

--

##### [get_source](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/helper.rb#L740) ios

> def get_source

Returns XML string for the current page
Same as driver.page_source

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [UIAStaticText](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L4) ios

> UIAStaticText = 'UIAStaticText'.freeze



--

##### [XCUIElementTypeStaticText](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L5) ios

> XCUIElementTypeStaticText = 'XCUIElementTypeStaticText'.freeze



--

##### [static_text_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L8) ios

> def static_text_class



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text

--

##### [text](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L16) ios

> def text(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--

##### [texts](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L30) ios

> def texts(value = false)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--

##### [first_text](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L43) ios

> def first_text

Find the first UIAStaticText|XCUIElementTypeStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--

##### [last_text](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L49) ios

> def last_text

Find the last UIAStaticText|XCUIElementTypeStaticText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--

##### [text_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L56) ios

> def text_exact(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--

##### [texts_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/text.rb#L67) ios

> def texts_exact(value)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/alert.rb#L5) ios

> def alert_accept

Accept the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/alert.rb#L13) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [UIAButton](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L4) ios

> UIAButton = 'UIAButton'.freeze



--

##### [XCUIElementTypeButton](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L5) ios

> XCUIElementTypeButton = 'XCUIElementTypeButton'.freeze



--

##### [button_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L8) ios

> def button_class



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for button

--

##### [button](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L16) ios

> def button(value)

Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
If int then the UIAButton|XCUIElementTypeButton at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L31) ios

> def buttons(value = false)

Find all UIAButtons|XCUIElementTypeButtons containing value.
If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L44) ios

> def first_button

Find the first UIAButton|XCUIElementTypeButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L52) ios

> def last_button

TODO: add documentation regarding previous element.
      Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
Find the last UIAButton|XCUIElementTypeButton.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L59) ios

> def button_exact(value)

Find the first UIAButton|XCUIElementTypeButton that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/button.rb#L70) ios

> def buttons_exact(value)

Find all UIAButtons|XCUIElementTypeButtons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--

##### [uiautomation_find](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/mobile_methods.rb#L32) ios

> def uiautomation_find

find_element/s can be used with a [UIAutomation command](https://developer.apple.com/library/ios/documentation/ToolsLanguages/Reference/UIAWindowClassReference/UIAWindow/UIAWindow.html#//apple_ref/doc/uid/TP40009930).

```ruby
 find_elements :uiautomation, 'elements()
```

--

##### [ios_predicate_string_find](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/mobile_methods.rb#L32) ios

> def ios_predicate_string_find

find_element/s can be used with a [Predicates](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/AdditionalChapters/Introduction.html)

```ruby
 find_elements :predicate, "isWDVisible == 1"
 find_elements :predicate, 'wdName == "Buttons"'
 find_elements :predicate, 'wdValue == "SearchBar" AND isWDDivisible == 1'
```

--

##### [ios_class_chain_find](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/mobile_methods.rb#L32) ios

> def ios_class_chain_find

Only for XCUITest(WebDriverAgent)
find_element/s can be used with a [class chain]( https://github.com/facebook/WebDriverAgent/wiki/Queries)

```ruby
 # select the third child button of the first child window element
 find_elements :class_chain, 'XCUIElementTypeWindow/XCUIElementTypeButton[3]'
 # select all the children windows
 find_elements :class_chain, 'XCUIElementTypeWindow'
 # select the second last child of the second child window
 find_elements :class_chain, 'XCUIElementTypeWindow[2]/XCUIElementTypeAny[-2]'
```

--

##### [find](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L6) ios

> def find(value)

Find the first element containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L17) ios

> def finds(value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L29) ios

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L40) ios

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [raise_error_if_no_element](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L51) ios

> def raise_error_if_no_element(element)



--

##### [select_visible_elements](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/generic.rb#L58) ios

> def select_visible_elements(elements)

Return visible elements.

--

##### [UIATextField](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L3) ios

> UIATextField = 'UIATextField'.freeze



--

##### [UIASecureTextField](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L4) ios

> UIASecureTextField = 'UIASecureTextField'.freeze



--

##### [XCUIElementTypeTextField](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L6) ios

> XCUIElementTypeTextField = 'XCUIElementTypeTextField'.freeze



--

##### [XCUIElementTypeSecureTextField](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L7) ios

> XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'.freeze



--

##### [text_field_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L10) ios

> def text_field_class



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text field

--

##### [secure_text_field_class](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L15) ios

> def secure_text_field_class



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for secure text field

--

##### [_textfield_visible](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L35) ios

> def _textfield_visible

Appium

--

##### [_textfield_exact_string](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L40) ios

> def _textfield_exact_string(value)

Appium

--

##### [_textfield_contains_string](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L47) ios

> def _textfield_contains_string(value)

Appium

--

##### [textfield](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L60) ios

> def textfield(value)

Find the first TextField that contains value or by index.
Note: Uses XPath
If int then the TextField at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L86) ios

> def textfields(value = false)

Find all TextFields containing value.
If value is omitted, all TextFields are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L100) ios

> def first_textfield

Find the first TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L110) ios

> def last_textfield

Find the last TextField.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L123) ios

> def textfield_exact(value)

Find the first TextField that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--

##### [textfields_exact](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/ios/element/textfield.rb#L134) ios

> def textfields_exact(value)

Find all TextFields that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--

##### [value](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/patch.rb#L12) 

> def value

Returns the value attribute

Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element

--

##### [name](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/patch.rb#L19) 

> def name

Returns the name attribute

Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element

--

##### [location_rel](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/patch.rb#L31) 

> def location_rel

For use with mobile tap.

```ruby
execute_script 'mobile: tap', :x => 0.0, :y => 0.98
```

https://github.com/appium/appium/wiki/Automating-mobile-gestures

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }

--

##### [DEFAULT_HEADERS](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/patch.rb#L152) 

> DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze



--

##### [patch_remote_driver_commands](https://github.com/appium/ruby_lib/blob/32bfee99bba89cfc2621b1770f14a796e5ac43ad/lib/appium_lib/common/patch.rb#L155) 

> def patch_remote_driver_commands



--

