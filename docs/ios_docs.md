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



--\n\n##### [for](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/ios.rb#L15) ios

> def self.for(target)



--\n\n##### [UIAStaticText](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L4) ios

> UIAStaticText = 'UIAStaticText'.freeze



--\n\n##### [XCUIElementTypeStaticText](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L5) ios

> XCUIElementTypeStaticText = 'XCUIElementTypeStaticText'.freeze



--\n\n##### [static_text_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L8) ios

> def static_text_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text

--\n\n##### [text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L16) ios

> def text(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [texts](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L26) ios

> def texts(value = false)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--\n\n##### [first_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L34) ios

> def first_text

Find the first UIAStaticText|XCUIElementTypeStaticText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [last_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L40) ios

> def last_text

Find the last UIAStaticText|XCUIElementTypeStaticText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [text_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L47) ios

> def text_exact(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [texts_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/text.rb#L54) ios

> def texts_exact(value)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--\n\n##### [filter](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L5) ios

> def filter

Returns the value of attribute filter

--\n\n##### [filter=](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L5) ios

> def filter=(value)

Sets the attribute filter

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] value - the value to set the attribute filter to.

--\n\n##### [start_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L7) ios

> def start_element(type, attrs = [])



--\n\n##### [ios_password](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L43) ios

> def ios_password(length = 1)

iOS only. On Android uiautomator always returns an empty string for EditText password.

Password character returned from value of UIASecureTextField

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] length - the length of the password to generate

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the returned string is of size length

--\n\n##### [page](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L59) ios

> def page(opts = {})

Prints a string of interesting elements to the console.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] visible - a customizable set of options

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] class - a customizable set of options

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [id](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L86) ios

> def id(id)

Find by id

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [ele_index](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L94) ios

> def ele_index(class_name, index)

Get the element of type class_name at matching index.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [find_ele_by_attr](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L124) ios

> def find_ele_by_attr(class_name, attr, value)

Find the first element exactly matching class and attribute value.
Note: Uses XPath
Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to inspect

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the expected value of the attribute

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [find_eles_by_attr](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L135) ios

> def find_eles_by_attr(class_name, attr, value)

Find all elements exactly matching class and attribute value.
Note: Uses XPath
Note: For XCUITest, this method return ALL elements include displayed or not displayed elements.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must have

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [find_ele_by_predicate](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L148) ios

> def find_ele_by_predicate(class_name: '*', value:)

Find the first element exactly matching attribute case insensitive value.
Note: Uses Predicate

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the expected value of the attribute

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [find_eles_by_predicate](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L160) ios

> def find_eles_by_predicate(class_name: '*', value:)

Find all elements exactly matching attribute case insensitive value.
Note: Uses Predicate

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must have

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [find_ele_by_attr_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L176) ios

> def find_ele_by_attr_include(class_name, attr, value)

Get the first tag by attribute that exactly matches value.
Note: Uses XPath

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--\n\n##### [find_eles_by_attr_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L186) ios

> def find_eles_by_attr_include(class_name, attr, value)

Get tags by attribute that include value.
Note: Uses XPath

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] attr - the attribute to compare

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--\n\n##### [find_ele_by_predicate_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L194) ios

> def find_ele_by_predicate_include(class_name: '*', value:)

Get the first elements that include insensitive value.
Note: Uses Predicate

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element of type tag who's attribute includes value

--\n\n##### [find_eles_by_predicate_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L206) ios

> def find_eles_by_predicate_include(class_name: '*', value:)

Get elements that include case insensitive value.
Note: Uses Predicate

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value of the attribute that the element must include

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag name to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] the elements of type tag who's attribute includes value

--\n\n##### [first_ele](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L219) ios

> def first_ele(class_name)

Get the first tag that matches class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [last_ele](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L226) ios

> def last_ele(class_name)

Get the last tag that matches class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tag](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L234) ios

> def tag(class_name)

Returns the first **visible** element matching class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tags](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L242) ios

> def tags(class_name)

Returns all visible elements matching class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tags_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L253) ios

> def tags_include(class_names:, value: nil)

Returns all visible elements matching class_names and value
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--\n\n##### [tags_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L268) ios

> def tags_exact(class_names:, value: nil)

Returns all visible elements matching class_names and value.
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--\n\n##### [ele_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L305) ios

> def ele_by_json_visible_contains(element, value)

Find the first element that contains value.
For Appium(automation name), not XCUITest

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [eles_by_json_visible_contains](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L314) ios

> def eles_by_json_visible_contains(element, value)

Find all elements containing value
For Appium(automation name), not XCUITest

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [ele_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L344) ios

> def ele_by_json_visible_exact(element, value)

Find the first element exactly matching value
For Appium(automation name), not XCUITest

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [eles_by_json_visible_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L353) ios

> def eles_by_json_visible_exact(element, value)

Find all elements exactly matching value
For Appium(automation name), not XCUITest

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [_all_pred](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L362) ios

> def _all_pred(opts)

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

--\n\n##### [ele_with_pred](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L376) ios

> def ele_with_pred(opts)

returns element matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [eles_with_pred](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L387) ios

> def eles_with_pred(opts)

returns elements matching predicate contained in the main app

predicate - the predicate to evaluate on the main app

visible - if true, only visible elements are returned. default true

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [_validate_object](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L391) ios

> def _validate_object(*objects)



--\n\n##### [_by_json](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L441) ios

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

--\n\n##### [eles_by_json](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L491) ios

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

--\n\n##### [ele_by_json](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/common/helper.rb#L497) ios

> def ele_by_json(opts)

see eles_by_json

--\n\n##### [alert_accept](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/alert.rb#L5) ios

> def alert_accept

Accept the alert.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/alert.rb#L13) ios

> def alert_dismiss

Dismiss the alert.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--\n\n##### [UIAButton](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L4) ios

> UIAButton = 'UIAButton'.freeze



--\n\n##### [XCUIElementTypeButton](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L5) ios

> XCUIElementTypeButton = 'XCUIElementTypeButton'.freeze



--\n\n##### [button_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L8) ios

> def button_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for button

--\n\n##### [button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L16) ios

> def button(value)

Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
If int then the UIAButton|XCUIElementTypeButton at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [buttons](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L27) ios

> def buttons(value = false)

Find all UIAButtons|XCUIElementTypeButtons containing value.
If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--\n\n##### [first_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L35) ios

> def first_button

Find the first UIAButton|XCUIElementTypeButton.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [last_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L43) ios

> def last_button

TODO: add documentation regarding previous element.
      Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
Find the last UIAButton|XCUIElementTypeButton.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [button_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L50) ios

> def button_exact(value)

Find the first UIAButton|XCUIElementTypeButton that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [buttons_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/button.rb#L57) ios

> def buttons_exact(value)

Find all UIAButtons|XCUIElementTypeButtons that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--\n\n##### [find](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L6) ios

> def find(value)

Find the first element containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L13) ios

> def finds(value)

Find all elements containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [find_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L20) ios

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L27) ios

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [raise_error_if_no_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L33) ios

> def raise_error_if_no_element(element)



--\n\n##### [select_visible_elements](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/generic.rb#L41) ios

> def select_visible_elements(elements)

Return visible elements.

--\n\n##### [for](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/bridge.rb#L7) ios

> def self.for(target)



--\n\n##### [last_ele](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/helper.rb#L26) ios

> def last_ele(class_name)

Get the last tag that matches class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tag](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/helper.rb#L37) ios

> def tag(class_name)

Returns the first **visible** element matching class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tags](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/helper.rb#L45) ios

> def tags(class_name)

Returns all visible elements matching class_name

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [tags_include](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/helper.rb#L57) ios

> def tags_include(class_names:, value: nil)

Returns all visible elements matching class_names and value
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--\n\n##### [tags_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/helper.rb#L79) ios

> def tags_exact(class_names:, value: nil)

Returns all visible elements matching class_names and value.
This method calls find_element/s and element.value/text many times.
So, if you set many class_names, this method's performance become worse.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[String]] class_names - the class_names to search for

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array[Element]] 

--\n\n##### [start_logs_broadcast](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command.rb#L19) ios

> def start_logs_broadcast(syslog_file = 'syslog.log')

Starts iOS syslog broadcast websocket

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] syslog_file - A file path to write messages from a syslog WebSocket client

--\n\n##### [stop_logs_broadcast](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command.rb#L32) ios

> def stop_logs_broadcast

Stop iOS syslog broadcast websocket

--\n\n##### [UIATextField](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L3) ios

> UIATextField = 'UIATextField'.freeze



--\n\n##### [UIASecureTextField](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L4) ios

> UIASecureTextField = 'UIASecureTextField'.freeze



--\n\n##### [XCUIElementTypeTextField](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L6) ios

> XCUIElementTypeTextField = 'XCUIElementTypeTextField'.freeze



--\n\n##### [XCUIElementTypeSecureTextField](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L7) ios

> XCUIElementTypeSecureTextField = 'XCUIElementTypeSecureTextField'.freeze



--\n\n##### [text_field_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L10) ios

> def text_field_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text field

--\n\n##### [secure_text_field_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L15) ios

> def secure_text_field_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for secure text field

--\n\n##### [textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L24) ios

> def textfield(value)

Find the first TextField that contains value or by index.
Note: Uses XPath
If int then the TextField at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfields](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L43) ios

> def textfields(value = false)

Find all TextFields containing value.
If value is omitted, all TextFields are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--\n\n##### [first_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L51) ios

> def first_textfield

Find the first TextField.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [last_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L57) ios

> def last_textfield

Find the last TextField.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfield_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L67) ios

> def textfield_exact(value)

Find the first TextField that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfields_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L74) ios

> def textfields_exact(value)

Find all TextFields that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--\n\n##### [_textfield_visible](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L81) ios

> def _textfield_visible

Appium

--\n\n##### [_textfield_exact_string](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L86) ios

> def _textfield_exact_string(value)

Appium

--\n\n##### [_textfield_contains_string](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/element/textfield.rb#L93) ios

> def _textfield_contains_string(value)

Appium

--\n\n##### [static_text_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L9) ios

> def static_text_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text

--\n\n##### [text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L17) ios

> def text(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that contains value or by index.
If int then the UIAStaticText|XCUIElementTypeStaticText at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [texts](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L27) ios

> def texts(value = false)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts containing value.
If value is omitted, all UIAStaticTexts|XCUIElementTypeStaticTexts are returned

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--\n\n##### [first_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L36) ios

> def first_text

Find the first UIAStaticText|XCUIElementTypeStaticText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [last_text](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L42) ios

> def last_text

Find the last UIAStaticText|XCUIElementTypeStaticText.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [text_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L49) ios

> def text_exact(value)

Find the first UIAStaticText|XCUIElementTypeStaticText that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAStaticText|XCUIElementTypeStaticText] 

--\n\n##### [texts_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/text.rb#L56) ios

> def texts_exact(value)

Find all UIAStaticTexts|XCUIElementTypeStaticTexts that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAStaticText|XCUIElementTypeStaticText>] 

--\n\n##### [xcuitest_source](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/source.rb#L12) ios

> def xcuitest_source(format: :xml)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String|Symbol] format - :xml or :json. :xml is by default.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [button_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L9) ios

> def button_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for button

--\n\n##### [button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L17) ios

> def button(value)

Find the first UIAButton|XCUIElementTypeButton that contains value or by index.
If int then the UIAButton|XCUIElementTypeButton at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [buttons](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L28) ios

> def buttons(value = false)

Find all UIAButtons|XCUIElementTypeButtons containing value.
If value is omitted, all UIAButtons|XCUIElementTypeButtons are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--\n\n##### [first_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L37) ios

> def first_button

Find the first UIAButton|XCUIElementTypeButton.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [last_button](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L45) ios

> def last_button

TODO: add documentation regarding previous element.
      Previous UIAElement is differ from UIAButton|XCUIElementTypeButton. So, the results are different.
Find the last UIAButton|XCUIElementTypeButton.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [button_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L52) ios

> def button_exact(value)

Find the first UIAButton|XCUIElementTypeButton that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[UIAButton|XCUIElementTypeButton] 

--\n\n##### [buttons_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/button.rb#L59) ios

> def buttons_exact(value)

Find all UIAButtons|XCUIElementTypeButtons that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<UIAButton|XCUIElementTypeButton>] 

--\n\n##### [find](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L8) ios

> def find(value)

Find the first element containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L15) ios

> def finds(value)

Find all elements containing value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [find_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L23) ios

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--\n\n##### [finds_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L30) ios

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--\n\n##### [raise_error_if_no_element](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L37) ios

> def raise_error_if_no_element(element)



--\n\n##### [select_visible_elements](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/generic.rb#L45) ios

> def select_visible_elements(elements)

Return visible elements.

--\n\n##### [swipe](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L11) ios

> def swipe(direction:, element: nil)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[string] direction - Either 'up', 'down', 'left' or 'right'.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [scroll](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L31) ios

> def scroll(direction:, # rubocop:disable Metrics/ParameterLists



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[string] direction - Either 'up', 'down', 'left' or 'right'.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [pinch](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L56) ios

> def pinch(scale:, velocity: 1.0, element: nil)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[scale] scale - X tap coordinate of type float. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] velocity - Y tap coordinate of type float. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [double_tap](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L71) ios

> def double_tap(x: nil, y: nil, element: nil) # rubocop:disable Naming/UncommunicativeMethodParamName



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] x - X Screen x tap coordinate of type float. Mandatory parameter only if element is not set

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] y - Y Screen y tap coordinate of type float. Mandatory parameter only if element is not set

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [touch_and_hold](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L88) ios

> def touch_and_hold(x: nil, y: nil, element: nil, duration: 1.0) # rubocop:disable Naming/UncommunicativeMethodParamName



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] x - Screen x long tap coordinate of type float. Mandatory parameter only if element is not set

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] y - Screen y long tap coordinate of type float. Mandatory parameter only if element is not set

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Float] duration - The float duration of press action in seconds. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [two_finger_tap](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L101) ios

> def two_finger_tap(element:)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] element - Element to long tap on.

```ruby
two_finger_tap element: find_element(:accessibility_id, "some item")
```

--\n\n##### [tap](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L116) ios

> def tap(x:, y:, element: nil) # rubocop:disable Naming/UncommunicativeMethodParamName



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] x - X tap coordinate of type float. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] y - Y tap coordinate of type float. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [drag_from_to_for_duration](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L136) ios

> def drag_from_to_for_duration(from_x:, from_y:, to_x:, to_y:, duration: 1.0, element: nil)

rubocop:disable Metrics/ParameterLists

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] duration - Float number of seconds in range [0.5, 60]. How long the tap gesture at starting
drag point should be before to start dragging. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] from_x - The x coordinate of starting drag point (type float). Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] from_y - The y coordinate of starting drag point (type float). Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] to_x - The x coordinate of ending drag point (type float). Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[float] to_y - The y coordinate of ending drag point (type float). Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [select_picker_wheel](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L153) ios

> def select_picker_wheel(element:, order:, offset: nil)

https://github.com/facebook/WebDriverAgent/pull/523
https://github.com/appium/appium-xcuitest-driver/pull/420

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] order - The order to move picker to. "next" or "previous".

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] element - Element id to perform select picker wheel on.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [alert](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/gestures.rb#L171) ios

> def alert(action:, button_label: nil)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] action - The following actions are supported: accept, dismiss and getButtons. Mandatory parameter

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] button_label - The label text of an existing alert button to click on.
This is an optional parameter and is only valid in combination with accept and dismiss actions.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {} or Selenium::WebDriver::Error::NoSuchAlertError if no action sheet or alert
or button labels if action is equal to getButtons.

```ruby
alert action: "accept"
alert action: "dismiss"
```

--\n\n##### [text_field_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L9) ios

> def text_field_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for text field

--\n\n##### [secure_text_field_class](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L14) ios

> def secure_text_field_class



__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] Class name for secure text field

--\n\n##### [textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L23) ios

> def textfield(value)

Find the first TextField that contains value or by index.
Note: Uses XPath
If int then the TextField at that index is returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfields](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L43) ios

> def textfields(value = false)

Find all TextFields containing value.
If value is omitted, all TextFields are returned.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--\n\n##### [first_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L52) ios

> def first_textfield

Find the first TextField.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [last_textfield](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L58) ios

> def last_textfield

Find the last TextField.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfield_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L68) ios

> def textfield_exact(value)

Find the first TextField that exactly matches value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextField] 

--\n\n##### [textfields_exact](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/element/textfield.rb#L75) ios

> def textfields_exact(value)

Find all TextFields that exactly match value.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TextField>] 

--\n\n##### [set_pasteboard](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/pasteboard.rb#L12) ios

> def set_pasteboard(content:, encoding: nil)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[string] content - The content of the pasteboard. The previous content is going to be overridden.
The parameter is mandatory

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [get_pasteboard](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/pasteboard.rb#L24) ios

> def get_pasteboard(encoding: nil)



__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - a customizable set of options

--\n\n##### [install_certificate](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/certificate.rb#L18) ios

> def install_certificate(cer_file:)

Generates Apple's over-the-air configuration profile for certificate deployment
based on the given PEM certificate content.
https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/iPhoneOTAConfiguration/Introduction/Introduction.html
https://github.com/appium/appium-xcuitest-driver/pull/652

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[string] cer_file - The content of the certificate file.

--\n\n##### [xcuitest_get_contexts](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/get_context.rb#L14) ios

> def xcuitest_get_contexts

Get contexts

--\n\n##### [xcuitest_install_app](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L21) ios

> def xcuitest_install_app(app:)

Installs given application to the device under test. If the same application is already installed
then it's going to be installed over it, which allows to test upgrades.
Be careful while reinstalling the main application under test - make sure you called terminateApp
for it first, otherwise WebDriverAgent will detect it as a potential application crash.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] app - The path to an existing .ipa/.app file on the server file system, zipped .app file
or an URL pointing to a remote .ipa/.zip file. Mandatory argument.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {}

--\n\n##### [xcuitest_app_installed?](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L35) ios

> def xcuitest_app_installed?(bundle_id:)

Verifies whether the application with given bundle identifier is installed on the device.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - The bundle identifier of the application, which is going to be verified.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] 

--\n\n##### [xcuitest_remove_app](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L50) ios

> def xcuitest_remove_app(bundle_id:)

Uninstalls an existing application from the device under test. This endpoint does not verify
whether the application is already installed or not before uninstalling it.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - The bundle identifier of the application, which is going to be uninstalled.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {}

--\n\n##### [xcuitest_launch_app](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L65) ios

> def xcuitest_launch_app(bundle_id:)

Executes an existing application on the device. If the application is already running then
it will be brought to the foreground.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - The bundle identifier of the application, which is going to be executed.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {}

--\n\n##### [xcuitest_terminate_app](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L80) ios

> def xcuitest_terminate_app(bundle_id:)

Terminates an existing application on the device. If the application is not running then
the returned result will be false, otherwise true.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - The bundle identifier of the application, which is going to be terminated.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {}

--\n\n##### [xcuitest_query_app_status](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L102) ios

> def xcuitest_query_app_status(bundle_id:)

Get the status of an existing application on the device.
State:
  0: The current application state cannot be determined/is unknown
  1: The application is not running
  2: The application is running in the background and is suspended
  3: The application is running in the background and is not suspended
  4: The application is running in the foreground

For more details: https://developer.apple.com/documentation/xctest/xcuiapplicationstate

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - A target app's bundle id

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[0|1|2|3|4] A number of the state

--\n\n##### [xcuitest_activate_app](https://github.com/appium/ruby_lib/blob/621a9ebaf18bcd80eb0e1f5fc17fbb4dddf5293a/lib/appium_lib/ios/xcuitest/command/multi_app_handler.rb#L118) ios

> def xcuitest_activate_app(bundle_id:)

Activates an existing application on the device under test and moves it to the foreground.
The application should be already running in order to activate it.
The call is ignored if the application is already in foreground.

__Parameters:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] bundle_id - The bundle identifier of the application, which is going to be brought to the foreground.

__Returns:__\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[] {}

--\n\n