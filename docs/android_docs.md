##### [load_settings](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L45) 

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

##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L81) 

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

##### [expand_required_files](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L87) 

> def self.expand_required_files(base_dir, file_paths)



__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] base_dir - parent directory of loaded appium.txt (toml)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] file_paths - 

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] list of require files as an array, nil if require doesn't exist

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L126) 

> def self.promote_singleton_appium_methods(modules, driver = $driver)

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

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L179) 

> def self.promote_appium_methods(class_array, driver = $driver)

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

##### [selenium_webdriver_version_more?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/appium.rb#L206) 

> def self.selenium_webdriver_version_more?(version)



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L24) 

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L24) 

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [sauce](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L27) 

> def sauce

SauceLab's settings

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L30) 

> def sauce_username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
same as @sauce.username

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L33) 

> def sauce_access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
same as @sauce.access_key

--

##### [sauce_endpoint](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L36) 

> def sauce_endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests
same as @sauce.endpoint

--

##### [caps](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L39) 

> def caps

from Core

--

##### [custom_url](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L40) 

> def custom_url

Returns the value of attribute custom_url

--

##### [export_session](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L41) 

> def export_session

Returns the value of attribute export_session

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L42) 

> def default_wait

Returns the value of attribute default_wait

--

##### [appium_port](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L43) 

> def appium_port

Returns the value of attribute appium_port

--

##### [appium_device](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L44) 

> def appium_device

Returns the value of attribute appium_device

--

##### [automation_name](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L45) 

> def automation_name

Returns the value of attribute automation_name

--

##### [listener](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L46) 

> def listener

Returns the value of attribute listener

--

##### [http_client](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L47) 

> def http_client

Returns the value of attribute http_client

--

##### [appium_wait_timeout](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L48) 

> def appium_wait_timeout

Returns the value of attribute appium_wait_timeout

--

##### [appium_wait_interval](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L49) 

> def appium_wait_interval

Returns the value of attribute appium_wait_interval

--

##### [appium_server_status](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L52) 

> def appium_server_status

Appium's server version

--

##### [appium_debug](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L54) 

> def appium_debug

Boolean debug mode for the Appium Ruby bindings

--

##### [driver](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L57) 

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [core](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L59) 

> def core

Instance of Appium::Core::Driver

--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L113) 

> def initialize(opts = {}, global_driver = nil)

Creates a new driver. The driver is defined as global scope by default.
We can avoid defining global driver.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] global_driver - A bool require global driver before initialize.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [driver_attributes](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L218) 

> def driver_attributes

Returns a hash of the driver attributes

--

##### [device_is_android?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L237) 

> def device_is_android?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [device_is_ios?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L241) 

> def device_is_ios?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [device_is_windows?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L245) 

> def device_is_windows?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_uiautomator2?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L251) 

> def automation_name_is_uiautomator2?

Return true if automationName is 'uiautomator2'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_espresso?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L257) 

> def automation_name_is_espresso?

Return true if automationName is 'Espresso'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_xcuitest?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L263) 

> def automation_name_is_xcuitest?

Return true if automationName is 'XCUITest'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [check_server_version_xcuitest](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L270) 

> def check_server_version_xcuitest

Return true if the target Appium server is over REQUIRED_VERSION_XCUITEST.
If the Appium server is under REQUIRED_VERSION_XCUITEST, then error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [appium_server_version](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L292) 

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

##### [platform_version](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L302) 

> def platform_version

Return the platform version as an array of integers

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Integer>] 

--

##### [appium_client_version](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L321) 

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

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L333) 

> def self.absolute_app_path(opts)

Converts app_path to an absolute path.

opts is the full options hash (caps and appium_lib). If server_url is set
then the app path is used as is.

if app isn't set then an error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L366) 

> def server_url

Get the server url

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L374) 

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L385) 

> def screenshot(png_save_path)

Takes a png screenshot and saves to the target path.

Example: screenshot '/tmp/hi.png'

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L391) 

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [quit_driver](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L396) 

> def driver_quit

Quits the driver
Alias for driver_quit

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L424) 

> def start_driver(http_client_ops = { http_client: nil, open_timeout: 999_999, read_timeout: 999_999 })

Creates a new global driver and quits the old one if it exists.
You can customise http_client as the following

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] http_client_ops - a customizable set of options

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [set_implicit_wait](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L447) 

> def set_implicit_wait(wait)

To ignore error for Espresso Driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L457) 

> def no_wait

Set implicit wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L471) 

> def set_wait(timeout = nil)

Set implicit wait. Default to @core.default_wait.

```ruby
set_wait 2
set_wait # @core.default_wait

```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L488) 

> def exists(pre_check = 0, post_check = @core.default_wait)

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

##### [execute_script](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L512) 

> def execute_script(script, *args)

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - The script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L536) 

> def find_elements(*args)

Calls @driver.find_elements_with_appium

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L552) 

> def find_element(*args)

Calls @driver.find_element

If you call `Appium.promote_appium_methods`, you can call `find_element` directly.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [set_location](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L565) 

> def set_location(opts = {})

Calls @driver.set_location

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - consisting of:

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Location] the location constructed by the selenium webdriver

--

##### [x](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/driver.rb#L575) 

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [username](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L4) 

> def username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.

--

##### [access_key](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L6) 

> def access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.

--

##### [endpoint](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L8) 

> def endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests

--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L10) 

> def initialize(appium_lib_opts)



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[SauceLabs] a new instance of SauceLabs

--

##### [sauce_server_url?](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L21) 

> def sauce_server_url?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [server_url](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/sauce_labs.rb#L25) 

> def server_url



--

##### [get_log](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/log.rb#L3) 

> def get_log(type)



--

##### [get_available_log_types](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/log.rb#L7) 

> def get_available_log_types



--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/wait.rb#L6) 

> def initialize(opts = {})



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Wait] a new instance of Wait

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/wait.rb#L34) 

> def wait_true(opts = {})

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

##### [wait](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/wait.rb#L57) 

> def wait(opts = {})

Check every interval seconds to see if yield doesn't raise an exception.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - Options

--

##### [ignore](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L17) 

> def ignore

Return yield and ignore any exceptions.

--

##### [back](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L24) 

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L29) 

> def session_id

For Sauce Labs reporting. Returns the current session id.

--

##### [xpath](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L37) 

> def xpath(xpath_str)

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L45) 

> def xpaths(xpath_str)

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [result](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L56) 

> def result

Returns the value of attribute result

--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L58) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L62) 

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L67) 

> def start_element(name, attrs = [], driver = $driver)

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [formatted_result](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L73) 

> def formatted_result



--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L84) 

> def get_page_class

Returns a string of class counts of visible elements.

--

##### [page_class](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L95) 

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L105) 

> def px_to_window_rel(opts = {}, driver = $driver)

Converts pixel values to window relative values

```ruby
px_to_window_rel x: 50, y: 150
```

--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L124) 

> def xml_keys(target)

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L132) 

> def xml_values(target)

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L140) 

> def resolve_id(id)

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [filter](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L146) 

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L149) 

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L155) 

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HTMLElements] a new instance of HTMLElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L160) 

> def reset



--

##### [result](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L166) 

> def result



--

##### [start_element](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L182) 

> def start_element(name, attrs = [])



--

##### [end_element](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L191) 

> def end_element(name)



--

##### [characters](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/common/helper.rb#L197) 

> def characters(chars)



--

##### [for](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/android.rb#L15) android

> def self.for(target)



--

##### [TextView](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L4) android

> TextView = 'android.widget.TextView'.freeze



--

##### [text](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L10) android

> def text(value)

Find the first TextView that contains value or by index.
If int then the TextView at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--

##### [texts](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L19) android

> def texts(value = false)

Find all TextViews containing value.
If value is omitted, all texts are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextView>] 

--

##### [first_text](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L26) android

> def first_text

Find the first TextView.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--

##### [last_text](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L32) android

> def last_text

Find the last TextView.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--

##### [text_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L39) android

> def text_exact(value)

Find the first TextView that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--

##### [texts_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/text.rb#L46) android

> def texts_exact(value)

Find all TextViews that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextView>] 

--

##### [result](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L6) android

> def result

Returns the value of attribute result

--

##### [keys](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L6) android

> def keys

Returns the value of attribute keys

--

##### [filter](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L6) android

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L9) android

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L15) android

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[AndroidElements] a new instance of AndroidElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L20) android

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L26) android

> def start_element(name, attrs = [], driver = $driver)

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [source](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L76) android

> def source

Prints xml of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [get_android_inspect](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L86) android

> def get_android_inspect(class_name = false)

Android only.
Returns a string containing interesting elements.
The text, content description, and id are returned.
if false (default) then all classes will be inspected

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to filter on.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [page](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L112) android

> def page(opts = {})

Intended for use with console.
Inspects and prints the current page.
Will return XHTML for Web contexts because of a quirk with Nokogiri.
if nil (default) then all classes will be inspected

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] class - a customizable set of options

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [current_app](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L124) android

> def current_app

example line:
"mFocusedApp=AppWindowToken{b1420058 token=Token{b128add0
 ActivityRecord{b1264d10 u0 com.example.android.apis/.ApiDemos t23}}}"

--

##### [id](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L148) android

> def id(id)

Find the first matching element by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ids](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L156) android

> def ids(id)

Find all matching elements by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L165) android

> def ele_index(class_name, index)

Find the element of type class_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the found element of type class_name

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L183) android

> def first_ele(class_name)

Find the first element that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L190) android

> def last_ele(class_name)

Find the last element that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L198) android

> def tag(class_name)

Find the first element of type class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tags](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L206) android

> def tags(class_name)

Find all elements of type class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [string_visible_contains_xpath](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L249) android

> def string_visible_contains_xpath(class_name, value)

Returns a string that matches the first element that contains value
For automationName is uiautomator2
example: string_visible_contains_xpath 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L269) android

> def string_visible_contains(class_name, value)

Returns a string that matches the first element that contains value
For automationName is Appium
example: string_visible_contains 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L287) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L295) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L339) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L347) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [get_source](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/common/helper.rb#L353) android

> def get_source

Returns XML string for the current page via `page_source`

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_click](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/alert.rb#L6) android

> def alert_click(value)

Click the first alert button that contains value or by index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer, String] value - either an integer index of the button or the button's name

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/alert.rb#L13) android

> def alert_accept

Accept the alert.
The last button is considered "accept."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept_text](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/alert.rb#L20) android

> def alert_accept_text

Get the text of the alert's accept button.
The last button is considered "accept."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/alert.rb#L27) android

> def alert_dismiss

Dismiss the alert.
The first button is considered "dismiss."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss_text](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/alert.rb#L34) android

> def alert_dismiss_text

Get the text of the alert's dismiss button.
The first button is considered "dismiss."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [Button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L3) android

> Button      = 'android.widget.Button'.freeze



--

##### [ImageButton](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L4) android

> ImageButton = 'android.widget.ImageButton'.freeze



--

##### [button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L10) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L27) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L34) android

> def first_button

Find the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L40) android

> def last_button

Find the last button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L56) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/button.rb#L63) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [find](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L6) android

> def find(value)

Find the first element containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L13) android

> def finds(value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L20) android

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L27) android

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [scroll_to](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L40) android

> def scroll_to(text, scrollable_index = 0)

Scroll to the first element containing target text or description.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [scroll_to_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/generic.rb#L58) android

> def scroll_to_exact(text, scrollable_index = 0)

Scroll to the first element with the exact target text or description.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [EditText](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L3) android

> EditText = 'android.widget.EditText'.freeze



--

##### [textfield](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L9) android

> def textfield(value)

Find the first EditText that contains value or by index.
If int then the EditText at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--

##### [textfields](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L18) android

> def textfields(value = false)

Find all EditTexts containing value.
If value is omitted, all EditTexts are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EditText>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L25) android

> def first_textfield

Find the first EditText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L31) android

> def last_textfield

Find the last EditText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L38) android

> def textfield_exact(value)

Find the first EditText that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--

##### [textfields_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/element/textfield.rb#L45) android

> def textfields_exact(value)

Find all EditTexts that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EditText>] 

--

##### [for](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/bridge.rb#L7) android

> def self.for(target)



--

##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/helper.rb#L13) android

> def string_visible_contains(class_name, value)

Returns a string that matches the first element that contains value
For automationName is Appium
example: string_visible_contains 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/helper.rb#L31) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/helper.rb#L41) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/helper.rb#L69) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/helper.rb#L79) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L9) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L29) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L36) android

> def first_button

Find the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L43) android

> def last_button

Find the last button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L60) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/2c7720ed0d6608768f44888d288f0aca87ab3dfb/lib/appium_lib/android/uiautomator2/element/button.rb#L68) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

