##### [load_settings](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/appium.rb#L46) common

> def load_settings(opts = {})

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

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--\n\n##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/appium.rb#L82) common

> def load_settings(opts = {})

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

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--\n\n##### [expand_required_files](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/appium.rb#L87) common

> def expand_required_files(base_dir, file_paths)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] base_dir - parent directory of loaded appium.txt (toml)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] file_paths - 

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] list of require files as an array, nil if require doesn't exist

--\n\n##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/appium.rb#L129) common

> def promote_singleton_appium_methods(modules, driver = $driver)

This method is intended to work with page objects that share
a common module. For example, Page::HomePage, Page::SignIn
those could be promoted on with Appium.promote_singleton_appium_methods Page

If you are promoting on an individual class then you should use
Appium.promote_appium_methods instead. The singleton method is intended
only for the shared module use case.

if modules is a module instead of an array, then the constants of
that module are promoted on.
otherwise, the array of modules will be used as the promotion target.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Module>] modules - An array of modules

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - A driver to extend for

--\n\n##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/appium.rb#L185) common

> def promote_appium_methods(class_array, driver = $driver)

Promote appium methods to class instance methods

To promote methods to all classes:

It's better to promote on specific classes instead of Object

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - A driver to extend for

--\n\n##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L37) common

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--\n\n##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L37) common

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--\n\n##### [sauce](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L40) common

> def sauce

SauceLab's settings

--\n\n##### [sauce_username](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L43) common

> def sauce_username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
same as @sauce.username

--\n\n##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L46) common

> def sauce_access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
same as @sauce.access_key

--\n\n##### [sauce_endpoint](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L49) common

> def sauce_endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests
same as @sauce.endpoint

--\n\n##### [caps](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L53) common

> def caps

from Core
read http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Driver

--\n\n##### [custom_url](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L54) common

> def custom_url

Returns the value of attribute custom_url

--\n\n##### [export_session](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L55) common

> def export_session

Returns the value of attribute export_session

--\n\n##### [export_session_path](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L56) common

> def export_session_path

Returns the value of attribute export_session_path

--\n\n##### [default_wait](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L57) common

> def default_wait

Returns the value of attribute default_wait

--\n\n##### [appium_port](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L58) common

> def appium_port

Returns the value of attribute appium_port

--\n\n##### [appium_device](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L59) common

> def appium_device

Returns the value of attribute appium_device

--\n\n##### [automation_name](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L60) common

> def automation_name

Returns the value of attribute automation_name

--\n\n##### [listener](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L61) common

> def listener

Returns the value of attribute listener

--\n\n##### [http_client](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L62) common

> def http_client

Returns the value of attribute http_client

--\n\n##### [appium_wait_timeout](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L63) common

> def appium_wait_timeout

Returns the value of attribute appium_wait_timeout

--\n\n##### [appium_wait_interval](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L64) common

> def appium_wait_interval

Returns the value of attribute appium_wait_interval

--\n\n##### [appium_server_status](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L67) common

> def appium_server_status

Appium's server version

--\n\n##### [appium_debug](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L69) common

> def appium_debug

Boolean debug mode for the Appium Ruby bindings

--\n\n##### [driver](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L72) common

> def driver

Returns the driver

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--\n\n##### [core](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L74) common

> def core

Instance of Appium::Core::Driver

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L142) common

> def initialize(opts = {}, global_driver = nil)

Creates a new driver. The driver is defined as global scope by default.
We can avoid defining global driver.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] global_driver - A bool require global driver before initialize.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--\n\n##### [driver_attributes](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L256) common

> def driver_attributes

Returns a hash of the driver attributes

--\n\n##### [device_is_android?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L278) common

> def device_is_android?



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [device_is_ios?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L282) common

> def device_is_ios?



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [device_is_windows?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L286) common

> def device_is_windows?



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [automation_name_is_uiautomator2?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L292) common

> def automation_name_is_uiautomator2?

Return true if automationName is 'uiautomator2'

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [automation_name_is_espresso?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L298) common

> def automation_name_is_espresso?

Return true if automationName is 'Espresso'

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [automation_name_is_xcuitest?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L304) common

> def automation_name_is_xcuitest?

Return true if automationName is 'XCUITest'

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [dialect](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L324) common

> def dialect

Get the dialect value whether current driver is OSS or W3C

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[:oss | :w3c] @example

    if dialect == :w3c
      driver.action
            .move_to_location(500, 500).pointer_down(:left)
            .move_to_location(0, 700)
            .release.perform
    else
      action = TouchAction.new(driver).press(x: 500, y: 500).move_to(500, 700).release
      action.perform
    end

--\n\n##### [check_server_version_xcuitest](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L331) common

> def check_server_version_xcuitest

Return true if the target Appium server is over REQUIRED_VERSION_XCUITEST.
If the Appium server is under REQUIRED_VERSION_XCUITEST, then error is raised.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [appium_server_version](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L353) common

> def appium_server_version

Returns the server's version info

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--\n\n##### [remote_status](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L361) common

> def appium_server_version

Returns the server's version info

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--\n\n##### [platform_version](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L365) common

> def platform_version

Return the platform version as an array of integers

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Integer>] 

--\n\n##### [appium_client_version](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L378) common

> def appium_client_version

Returns the client's version info

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--\n\n##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L390) common

> def self.absolute_app_path(opts)

Converts app_path to an absolute path.

opts is the full options hash (caps and appium_lib). If server_url is set
then the app path is used as is.

if app isn't set then an error is raised.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--\n\n##### [server_url](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L413) common

> def server_url

Get the server url

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--\n\n##### [restart](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L422) common

> def restart

Restarts the driver

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--\n\n##### [screenshot](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L435) common

> def screenshot(png_save_path)

Takes a png screenshot and saves to the target path.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[File] 

--\n\n##### [element_screenshot](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L449) common

> def element_screenshot(element, png_save_path)

Takes a png screenshot of particular element's area

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - Element take a screenshot

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[File] 

--\n\n##### [driver_quit](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L456) common

> def driver_quit

Quits the driver

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [quit_driver](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L459) common

> def driver_quit

Quits the driver

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [window_size](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L470) common

> def window_size

Get the device window's size.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Dimension] 

--\n\n##### [start_driver](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L503) common

> def start_driver(http_client_ops =

Creates a new global driver and quits the old one if it exists.
You can customise http_client as the following

Read http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Device to understand more what the driver
can call instance methods.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] http_client_ops - a customizable set of options

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--\n\n##### [set_implicit_wait](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L525) common

> def set_implicit_wait(wait)

To ignore error for Espresso Driver

--\n\n##### [no_wait](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L536) common

> def no_wait

Set implicit wait to zero.

--\n\n##### [set_wait](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L550) common

> def set_wait(timeout = nil)

Set implicit wait. Default to @core.default_wait.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [exists](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L567) common

> def exists(pre_check = 0, post_check = @core.default_wait)

Returns existence of element.

Example:

exists { button('sign in') } ? puts('true') : puts('false')

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] pre_check - The amount in seconds to set the
wait to before checking existence

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] post_check - The amount in seconds to set the
wait to after checking existence

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [execute_script](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L591) common

> def execute_script(script, *args)

The same as @driver.execute_script

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - The script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to pass to the script

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--\n\n##### [execute_async_script](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L599) common

> def execute_async_script(script, *args)

Wrap calling selenium webdrier APIs via ruby_core

Get the window handles of open browser windows

--\n\n##### [window_handles](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L603) common

> def window_handles



--\n\n##### [window_handle](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L608) common

> def window_handle

Get the current window handle

--\n\n##### [navigate](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L612) common

> def navigate



--\n\n##### [manage](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L616) common

> def manage



--\n\n##### [get](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L620) common

> def get(url)



--\n\n##### [current_url](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L624) common

> def current_url



--\n\n##### [title](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L628) common

> def title



--\n\n##### [switch_to](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L634) common

> def switch_to



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TargetLocator] 

--\n\n##### [find_elements](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L661) common

> def find_elements(*args)

Calls @driver.find_elements_with_appium

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--\n\n##### [find_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L677) common

> def find_element(*args)

Calls @driver.find_element

If you call `Appium.promote_appium_methods`, you can call `find_element` directly.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [DEFAULT_MATCH_THRESHOLD](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L695) common

> DEFAULT_MATCH_THRESHOLD = 0.5

Return ImageElement if current view has a partial image

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_img_path - A path to a partial image you'd like to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Flood] match_threshold - At what normalized threshold to reject

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] visualize - Makes the endpoint to return an image, which contains the visualized result of
the corresponding picture matching operation. This option is disabled by default.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[::Appium::Core::ImageElement] 

--\n\n##### [find_element_by_image](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L696) common

> def find_element_by_image(png_img_path, match_threshold: DEFAULT_MATCH_THRESHOLD, visualize: false)



--\n\n##### [find_elements_by_image](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L714) common

> def find_elements_by_image(png_img_paths, match_threshold: DEFAULT_MATCH_THRESHOLD, visualize: false)

Return ImageElement if current view has partial images

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[String]] png_img_paths - Paths to a partial image you'd like to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Flood] match_threshold - At what normalized threshold to reject

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] visualize - Makes the endpoint to return an image, which contains the visualized result of
the corresponding picture matching operation. This option is disabled by default.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[::Appium::Core::ImageElement]] 

--\n\n##### [set_location](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L727) common

> def set_location(opts = {})

Calls @driver.set_location

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - consisting of:

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Location] the location constructed by the selenium webdriver

--\n\n##### [x](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/driver.rb#L737) common

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [username](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L4) common

> def username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.

--\n\n##### [access_key](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L6) common

> def access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.

--\n\n##### [endpoint](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L8) common

> def endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests. Default is 'ondemand.saucelabs.com:443/wd/hub'.

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L33) common

> def initialize(appium_lib_opts)

Create a SauceLabs instance to manage sauce labs related attributes.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] appium_lib_opts - Appium library parameter

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Appium::SauceLabs] 

--\n\n##### [sauce_server_url?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L53) common

> def sauce_server_url?

Return true if an instance of Appium::SauceLabs has sauce_username and sauce_access_key.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--\n\n##### [server_url](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/sauce_labs.rb#L66) common

> def server_url

Return a particular server url to access to. Default is the local address.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [get_log](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/log.rb#L11) common

> def get_log(type)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String|Hash] type - You can get particular type's logs.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[Selenium::WebDriver::LogEntry]] A list of logs data.

--\n\n##### [get_available_log_types](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/log.rb#L23) common

> def get_available_log_types

Get a list of available log types

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[String]] A list of available log types.

--\n\n##### [wait_true](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/wait.rb#L30) common

> def wait_true(opts = {})

Check every interval seconds to see if yield returns a truthy value.
Note this isn't a strict boolean true, any truthy value is accepted.
false and nil are considered failures.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash|Numeric] opts - Options. If the value is _Numeric_, the value is set as `{ timeout: value }`

--\n\n##### [wait](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/wait.rb#L59) common

> def wait(opts = {})

Check every interval seconds to see if yield doesn't raise an exception.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash|Numeric] opts - Options. If the value is _Numeric_, the value is set as `{ timeout: value }`

--\n\n##### [add_touch_actions](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/device.rb#L12) common

> def add_touch_actions



--\n\n##### [delegate_from_appium_driver](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/device.rb#L24) common

> def delegate_from_appium_driver(method, delegation_target)



--\n\n##### [ignore](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L16) common

> def ignore

Return yield and ignore any exceptions.

--\n\n##### [back](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L23) common

> def back

Navigate back.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [session_id](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L34) common

> def session_id

For Sauce Labs reporting. Returns the current session id.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [xpath](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L42) common

> def xpath(xpath_str)

Returns the first element that matches the provided xpath.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [xpaths](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L50) common

> def xpaths(xpath_str)

Returns all elements that match the provided xpath.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [result](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L60) common

> def result

Returns the value of attribute result

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L62) common

> def initialize(platform)



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--\n\n##### [reset](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L67) common

> def reset



--\n\n##### [start_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L72) common

> def start_element(name, attrs = [])

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--\n\n##### [formatted_result](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L83) common

> def formatted_result



--\n\n##### [get_page_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L101) common

> def get_page_class

Returns a string of class counts of visible elements.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [page_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L126) common

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--\n\n##### [source](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L133) common

> def source

Prints xml of the current page

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [get_source](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L140) common

> def get_source

Returns XML string for the current page
Same as driver.page_source

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L150) common

> def px_to_window_rel(opts = {}, driver = $driver)

Converts pixel values to window relative values

--\n\n##### [xml_keys](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L169) common

> def xml_keys(target)

Search strings.xml's values for target.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--\n\n##### [xml_values](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L177) common

> def xml_values(target)

Search strings.xml's keys for target.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--\n\n##### [resolve_id](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L185) common

> def resolve_id(id)

Resolve id in strings.xml and return the value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [filter](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L192) common

> def filter

Returns the value of attribute filter

--\n\n##### [filter=](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L195) common

> def filter=(value)

convert to string to support symbols

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L202) common

> def initialize



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HTMLElements] a new instance of HTMLElements

--\n\n##### [reset](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L207) common

> def reset



--\n\n##### [result](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L213) common

> def result



--\n\n##### [start_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L226) common

> def start_element(name, attrs = [])



--\n\n##### [end_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L236) common

> def end_element(name)



--\n\n##### [characters](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/helper.rb#L243) common

> def characters(chars)



--\n\n##### [DEFAULT_HEADERS](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/http_client.rb#L8) common

> DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze

Default HTTP client inherit Appium::Core::Base::Http::Default, but has different DEFAULT_HEADERS

--\n\n##### [pinch](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/multi_touch.rb#L51) common

> def pinch(percentage = 25, auto_perform = true, driver = $driver)

Convenience method for pinching the screen.
Places two fingers at the edges of the screen and brings them together.
Without auto_perform

With driver

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - Set a driver to conduct the action. DEfault is global driver($driver)

--\n\n##### [zoom](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/multi_touch.rb#L94) common

> def zoom(percentage = 200, auto_perform = true, driver = $driver)

Convenience method for zooming the screen.
Places two fingers at the edges of the screen and brings them together.
Without auto_perform

With driver

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - Set a driver to conduct the action. DEfault is global driver($driver)

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/multi_touch.rb#L180) common

> def initialize(driver = $driver)

self

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MultiTouch] a new instance of MultiTouch

--\n\n##### [COMPLEX_ACTIONS](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/touch_actions.rb#L33) common

> COMPLEX_ACTIONS = ::Appium::Core::TouchAction::COMPLEX_ACTIONS



--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/touch_actions.rb#L48) common

> def initialize(driver = $driver)



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] a new instance of TouchAction

--\n\n##### [swipe](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/touch_actions.rb#L52) common

> def swipe(opts)



--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/command/ws_logcat.rb#L5) common

> def initialize(url:, output_file: 'logcat.log')



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[WsLogcat] a new instance of WsLogcat

--\n\n##### [handle_message_data](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/common/command/ws_logcat.rb#L10) common

> def handle_message_data(data)



--\n\n##### [for](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/android.rb#L19) android

> def self.for(target)



--\n\n##### [TextView](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L4) android

> TextView = 'android.widget.TextView'.freeze



--\n\n##### [text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L10) android

> def text(value)

Find the first TextView that contains value or by index.
If int then the TextView at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--\n\n##### [texts](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L20) android

> def texts(value = false)

Find all TextViews containing value.
If value is omitted, all texts are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextView>] 

--\n\n##### [first_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L28) android

> def first_text

Find the first TextView.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--\n\n##### [last_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L34) android

> def last_text

Find the last TextView.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--\n\n##### [text_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L41) android

> def text_exact(value)

Find the first TextView that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--\n\n##### [texts_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/text.rb#L48) android

> def texts_exact(value)

Find all TextViews that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextView>] 

--\n\n##### [result](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L6) android

> def result

Returns the value of attribute result

--\n\n##### [keys](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L6) android

> def keys

Returns the value of attribute keys

--\n\n##### [filter](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L6) android

> def filter

Returns the value of attribute filter

--\n\n##### [filter=](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L9) android

> def filter=(value)

convert to string to support symbols

--\n\n##### [initialize](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L16) android

> def initialize



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[AndroidElements] a new instance of AndroidElements

--\n\n##### [reset](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L21) android

> def reset



--\n\n##### [start_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L27) android

> def start_element(name, attrs = [], driver = $driver)

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--\n\n##### [get_android_inspect](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L81) android

> def get_android_inspect(class_name = false)

Android only.
Returns a string containing interesting elements.
The text, content description, and id are returned.
if false (default) then all classes will be inspected

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to filter on.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [page](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L107) android

> def page(opts = {})

Intended for use with console.
Inspects and prints the current page.
Will return XHTML for Web contexts because of a quirk with Nokogiri.
if nil (default) then all classes will be inspected

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] class - a customizable set of options

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [id](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L116) android

> def id(id)

Find the first matching element by id

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [ids](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L124) android

> def ids(id)

Find all matching elements by id

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [ele_index](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L133) android

> def ele_index(class_name, index)

Find the element of type class_name at matching index.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the found element of type class_name

--\n\n##### [first_ele](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L152) android

> def first_ele(class_name)

Find the first element that matches class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [last_ele](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L159) android

> def last_ele(class_name)

Find the last element that matches class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tag](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L167) android

> def tag(class_name)

Find the first element of type class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tags](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L175) android

> def tags(class_name)

Find all elements of type class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [string_visible_contains_xpath](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L218) android

> def string_visible_contains_xpath(class_name, value)

Returns a string that matches the first element that contains value
For automationName is uiautomator2
example: string_visible_contains_xpath 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L238) android

> def string_visible_contains(class_name, value)

Returns a string that matches the first element that contains value
For automationName is Appium
example: string_visible_contains 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L256) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L264) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L306) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/helper.rb#L314) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [alert_click](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/alert.rb#L6) android

> def alert_click(value)

Click the first alert button that contains value or by index.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer, String] value - either an integer index of the button or the button's name

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [alert_accept](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/alert.rb#L13) android

> def alert_accept

Accept the alert.
The last button is considered "accept."

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [alert_accept_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/alert.rb#L20) android

> def alert_accept_text

Get the text of the alert's accept button.
The last button is considered "accept."

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/alert.rb#L27) android

> def alert_dismiss

Dismiss the alert.
The first button is considered "dismiss."

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [alert_dismiss_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/alert.rb#L34) android

> def alert_dismiss_text

Get the text of the alert's dismiss button.
The first button is considered "dismiss."

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [Button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L3) android

> Button      = 'android.widget.Button'.freeze



--\n\n##### [ImageButton](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L4) android

> ImageButton = 'android.widget.ImageButton'.freeze



--\n\n##### [button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L10) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [buttons](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L27) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--\n\n##### [first_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L35) android

> def first_button

Find the first button.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [last_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L41) android

> def last_button

Find the last button.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [button_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L57) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [buttons_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/button.rb#L64) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--\n\n##### [find](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L6) android

> def find(value)

Find the first element containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L13) android

> def finds(value)

Find all elements containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [find_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L20) android

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L27) android

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [scroll_to](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L40) android

> def scroll_to(text, scrollable_index = 0)

Scroll to the first element containing target text or description.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--\n\n##### [scroll_to_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/generic.rb#L58) android

> def scroll_to_exact(text, scrollable_index = 0)

Scroll to the first element with the exact target text or description.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--\n\n##### [for](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/espresso/bridge.rb#L7) android

> def self.for(target)



--\n\n##### [EditText](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L3) android

> EditText = 'android.widget.EditText'.freeze



--\n\n##### [textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L9) android

> def textfield(value)

Find the first EditText that contains value or by index.
If int then the EditText at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--\n\n##### [textfields](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L19) android

> def textfields(value = false)

Find all EditTexts containing value.
If value is omitted, all EditTexts are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EditText>] 

--\n\n##### [first_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L27) android

> def first_textfield

Find the first EditText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--\n\n##### [last_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L33) android

> def last_textfield

Find the last EditText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--\n\n##### [textfield_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L40) android

> def textfield_exact(value)

Find the first EditText that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EditText] 

--\n\n##### [textfields_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/element/textfield.rb#L47) android

> def textfields_exact(value)

Find all EditTexts that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EditText>] 

--\n\n##### [for](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/bridge.rb#L7) android

> def self.for(target)



--\n\n##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/helper.rb#L13) android

> def string_visible_contains(class_name, value)

Returns a string that matches the first element that contains value
For automationName is Appium
example: string_visible_contains 'UIATextField', 'sign in'
note for XPath: https://github.com/appium/ruby_lib/pull/561

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--\n\n##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/helper.rb#L31) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/helper.rb#L42) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/helper.rb#L70) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/helper.rb#L81) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [shell](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/command/command.rb#L14) android

> def shell(command, arguments)

Conduct an adb shell script on Appium server.
Require `--relaxed-security` arguments when run Appium server as server side arguments.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] command - Command for "adb shell"

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] arguments - Arguments for the adb command

--\n\n##### [start_logs_broadcast](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/command/command.rb#L28) android

> def start_logs_broadcast(logcat_file = 'logcat.log')

Starts Android logcat broadcast websocket

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] logcat_file - A file path to write messages from a logcat WebSocket client

--\n\n##### [stop_logs_broadcast](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/common/command/command.rb#L41) android

> def stop_logs_broadcast

Stop Android logcat broadcast websocket

--\n\n##### [button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L9) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [buttons](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L30) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--\n\n##### [first_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L38) android

> def first_button

Find the first button.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [last_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L45) android

> def last_button

Find the last button.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [button_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L62) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--\n\n##### [buttons_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/android/uiautomator2/element/button.rb#L70) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--\n\n