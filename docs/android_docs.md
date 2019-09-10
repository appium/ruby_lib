##### [load_settings](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/appium.rb#L60) common

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

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--

##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/appium.rb#L96) common

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

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--

##### [expand_required_files](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/appium.rb#L101) common

> def expand_required_files(base_dir, file_paths)



__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] base_dir - parent directory of loaded appium.txt (toml)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] file_paths - 

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] list of require files as an array, nil if require doesn't exist

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/appium.rb#L143) common

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

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Module>] modules - An array of modules

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - A driver to extend for

--

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/appium.rb#L199) common

> def promote_appium_methods(class_array, driver = $driver)

Promote appium methods to class instance methods

To promote methods to all classes:

It's better to promote on specific classes instead of Object

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - A driver to extend for

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L49) common

> def global_webdriver_http_sleep

The amount to sleep in seconds before every webdriver http call.

--

##### [global_webdriver_http_sleep=](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L49) common

> def global_webdriver_http_sleep=(value)

The amount to sleep in seconds before every webdriver http call.

--

##### [sauce](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L52) common

> def sauce

SauceLab's settings

--

##### [sauce_username](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L55) common

> def sauce_username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
same as @sauce.username

--

##### [sauce_access_key](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L58) common

> def sauce_access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
same as @sauce.access_key

--

##### [sauce_endpoint](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L61) common

> def sauce_endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests
same as @sauce.endpoint

--

##### [caps](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L65) common

> def caps

from Core
read http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Driver

--

##### [custom_url](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L66) common

> def custom_url

Returns the value of attribute custom_url

--

##### [export_session](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L67) common

> def export_session

Returns the value of attribute export_session

--

##### [export_session_path](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L68) common

> def export_session_path

Returns the value of attribute export_session_path

--

##### [default_wait](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L69) common

> def default_wait

Returns the value of attribute default_wait

--

##### [appium_port](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L70) common

> def appium_port

Returns the value of attribute appium_port

--

##### [appium_device](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L71) common

> def appium_device

Returns the value of attribute appium_device

--

##### [automation_name](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L72) common

> def automation_name

Returns the value of attribute automation_name

--

##### [listener](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L73) common

> def listener

Returns the value of attribute listener

--

##### [http_client](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L74) common

> def http_client

Returns the value of attribute http_client

--

##### [appium_wait_timeout](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L75) common

> def appium_wait_timeout

Returns the value of attribute appium_wait_timeout

--

##### [appium_wait_interval](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L76) common

> def appium_wait_interval

Returns the value of attribute appium_wait_interval

--

##### [appium_server_status](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L79) common

> def appium_server_status

Appium's server version

--

##### [appium_debug](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L81) common

> def appium_debug

Boolean debug mode for the Appium Ruby bindings

--

##### [driver](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L84) common

> def driver

Returns the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [core](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L86) common

> def core

Instance of Appium::Core::Driver

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L154) common

> def initialize(opts = {}, global_driver = nil)

Creates a new driver. The driver is defined as global scope by default.
We can avoid defining global driver.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] opts - A hash containing various options.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Bool] global_driver - A bool require global driver before initialize.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] 

--

##### [driver_attributes](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L279) common

> def driver_attributes

Returns a hash of the driver attributes

--

##### [device_is_android?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L301) common

> def device_is_android?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [device_is_ios?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L305) common

> def device_is_ios?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [device_is_windows?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L309) common

> def device_is_windows?



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_uiautomator2?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L315) common

> def automation_name_is_uiautomator2?

Return true if automationName is 'uiautomator2'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_espresso?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L321) common

> def automation_name_is_espresso?

Return true if automationName is 'Espresso'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [automation_name_is_xcuitest?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L327) common

> def automation_name_is_xcuitest?

Return true if automationName is 'XCUITest'

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [dialect](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L347) common

> def dialect

Get the dialect value whether current driver is OSS or W3C

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[:oss | :w3c] @example

    if dialect == :w3c
      driver.action
            .move_to_location(500, 500).pointer_down(:left)
            .move_to_location(0, 700)
            .release.perform
    else
      action = TouchAction.new(driver).press(x: 500, y: 500).move_to(500, 700).release
      action.perform
    end

--

##### [action](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L361) common

> def action

An entry point to chain W3C actions. Returns `TouchAction.new` if it works as MJSONWP instead of W3C action.
Read https://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Base/Bridge/W3C#action-instance_method

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction|Selenium::WebDriver::PointerActions] 

--

##### [appium_server_version](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L381) common

> def appium_server_version

Returns the server's version info

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--

##### [remote_status](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L389) common

> def appium_server_version

Returns the server's version info

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--

##### [platform_version](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L393) common

> def platform_version

Return the platform version as an array of integers

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Integer>] 

--

##### [appium_client_version](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L406) common

> def appium_client_version

Returns the client's version info

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] 

--

##### [absolute_app_path](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L418) common

> def self.absolute_app_path(opts)

Converts app_path to an absolute path.

opts is the full options hash (caps and appium_lib). If server_url is set
then the app path is used as is.

if app isn't set then an error is raised.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] APP_PATH as an absolute path

--

##### [server_url](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L441) common

> def server_url

Get the server url

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] the server url

--

##### [restart](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L450) common

> def restart

Restarts the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] the driver

--

##### [screenshot](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L463) common

> def screenshot(png_save_path)

Takes a png screenshot and saves to the target path.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[File] 

--

##### [element_screenshot](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L477) common

> def element_screenshot(element, png_save_path)

Takes a png screenshot of particular element's area

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] element - Element take a screenshot

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_save_path - the full path to save the png

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[File] 

--

##### [driver_quit](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L484) common

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [quit_driver](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L487) common

> def driver_quit

Quits the driver

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [window_size](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L498) common

> def window_size

Get the device window's size.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Dimension] 

--

##### [window_rect](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L513) common

> def window_rect

Get the device window's rect.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Rectangle] 

--

##### [start_driver](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L546) common

> def start_driver(http_client_ops =

Creates a new global driver and quits the old one if it exists.
You can customise http_client as the following

Read http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Device to understand more what the driver
can call instance methods.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] http_client_ops - a customizable set of options

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver] the new global driver

--

##### [set_implicit_wait](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L567) common

> def set_implicit_wait(wait)

To ignore error for Espresso Driver

--

##### [no_wait](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L578) common

> def no_wait

Set implicit wait to zero.

--

##### [set_wait](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L592) common

> def set_wait(timeout = nil)

Set implicit wait. Default to @core.default_wait.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout - the timeout in seconds

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [exists](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L609) common

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

##### [execute_script](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L633) common

> def execute_script(script, *args)

The same as @driver.execute_script

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - The script to execute

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to pass to the script

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Object] 

--

##### [execute_async_script](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L641) common

> def execute_async_script(script, *args)

Wrap calling selenium webdrier APIs via ruby_core

Get the window handles of open browser windows

--

##### [execute_driver](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L673) common

> def execute_driver(script: '', type: 'webdriverio', timeout_ms: nil)

Run a set of script against the current session, allowing execution of many commands in one Appium request.
Supports {https://webdriver.io/docs/api.html WebdriverIO} API so far.
Please read {http://appium.io/docs/en/commands/session/execute-driver command API} for more details
about acceptable scripts and the output.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] script - The string consisting of the script itself

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] type - The name of the script type.
Defaults to 'webdriverio'. Depends on server implementation which type is supported.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] timeout_ms - The number of `ms` Appium should wait for the script to finish
before killing it due to timeout.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Appium::Core::Base::Device::ExecuteDriver::Result] The script result parsed by
Appium::Core::Base::Device::ExecuteDriver::Result.

--

##### [window_handles](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L677) common

> def window_handles



--

##### [window_handle](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L682) common

> def window_handle

Get the current window handle

--

##### [navigate](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L686) common

> def navigate



--

##### [manage](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L690) common

> def manage



--

##### [get](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L694) common

> def get(url)



--

##### [current_url](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L698) common

> def current_url



--

##### [title](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L702) common

> def title



--

##### [switch_to](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L708) common

> def switch_to



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TargetLocator] 

--

##### [find_elements](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L735) common

> def find_elements(*args)

Calls @driver.find_elements_with_appium

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

If you call `Appium.promote_appium_methods`, you can call `find_elements` directly.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] Array is empty when no elements are found.

--

##### [find_element](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L751) common

> def find_element(*args)

Calls @driver.find_element

If you call `Appium.promote_appium_methods`, you can call `find_element` directly.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[*args] args - The args to use

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [find_element_by_image](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L766) common

> def find_element_by_image(png_img_path)

Return ImageElement if current view has a partial image

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] png_img_path - A path to a partial image you'd like to find

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[::Appium::Core::ImageElement] 

--

##### [find_elements_by_image](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L781) common

> def find_elements_by_image(png_img_paths)

Return ImageElement if current view has partial images

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[String]] png_img_paths - Paths to a partial image you'd like to find

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[::Appium::Core::ImageElement]] 

--

##### [set_location](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L794) common

> def set_location(opts = {})

Calls @driver.set_location

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - consisting of:

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Selenium::WebDriver::Location] the location constructed by the selenium webdriver

--

##### [x](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/driver.rb#L804) common

> def x

Quit the driver and Pry.
quit and exit are reserved by Pry.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [username](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L18) common

> def username

Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.

--

##### [access_key](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L20) common

> def access_key

Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.

--

##### [endpoint](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L22) common

> def endpoint

Override the Sauce Appium endpoint to allow e.g. TestObject tests. Default is 'ondemand.saucelabs.com:443/wd/hub'.

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L47) common

> def initialize(appium_lib_opts)

Create a SauceLabs instance to manage sauce labs related attributes.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] appium_lib_opts - Appium library parameter

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Appium::SauceLabs] 

--

##### [sauce_server_url?](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L67) common

> def sauce_server_url?

Return true if an instance of Appium::SauceLabs has sauce_username and sauce_access_key.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Boolean] 

--

##### [server_url](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/sauce_labs.rb#L80) common

> def server_url

Return a particular server url to access to. Default is the local address.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [get_log](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/log.rb#L25) common

> def get_log(type)



__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String|Hash] type - You can get particular type's logs.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[Selenium::WebDriver::LogEntry]] A list of logs data.

--

##### [get_available_log_types](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/log.rb#L37) common

> def get_available_log_types

Get a list of available log types

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[[String]] A list of available log types.

--

##### [wait_true](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/wait.rb#L44) common

> def wait_true(opts = {})

Check every interval seconds to see if yield returns a truthy value.
Note this isn't a strict boolean true, any truthy value is accepted.
false and nil are considered failures.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash|Numeric] opts - Options. If the value is _Numeric_, the value is set as `{ timeout: value }`

--

##### [wait](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/wait.rb#L73) common

> def wait(opts = {})

Check every interval seconds to see if yield doesn't raise an exception.
Give up after timeout seconds.

Wait code from the selenium Ruby gem
https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb

If only a number is provided then it's treated as the timeout value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash|Numeric] opts - Options. If the value is _Numeric_, the value is set as `{ timeout: value }`

--

##### [add_touch_actions](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/device.rb#L26) common

> def add_touch_actions



--

##### [delegate_from_appium_driver](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/device.rb#L38) common

> def delegate_from_appium_driver(method, delegation_target)



--

##### [ignore](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L30) common

> def ignore

Return yield and ignore any exceptions.

--

##### [back](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L37) common

> def back

Navigate back.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [session_id](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L48) common

> def session_id

For Sauce Labs reporting. Returns the current session id.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [xpath](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L56) common

> def xpath(xpath_str)

Returns the first element that matches the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [xpaths](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L64) common

> def xpaths(xpath_str)

Returns all elements that match the provided xpath.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] xpath_str - the XPath string

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [result](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L74) common

> def result

Returns the value of attribute result

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L76) common

> def initialize(platform)



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[CountElements] a new instance of CountElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L81) common

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L86) common

> def start_element(name, attrs = [])

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [formatted_result](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L97) common

> def formatted_result



--

##### [get_page_class](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L115) common

> def get_page_class

Returns a string of class counts of visible elements.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [page_class](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L140) common

> def page_class

Count all classes on screen and print to stdout.
Useful for appium_console.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[nil] 

--

##### [source](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L147) common

> def source

Prints xml of the current page

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [get_source](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L154) common

> def get_source

Returns XML string for the current page
Same as driver.page_source

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [px_to_window_rel](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L164) common

> def px_to_window_rel(opts = {}, driver = $driver)

Converts pixel values to window relative values

--

##### [xml_keys](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L183) common

> def xml_keys(target)

Search strings.xml's values for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml values

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [xml_values](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L191) common

> def xml_values(target)

Search strings.xml's keys for target.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] target - the target to search for in strings.xml keys

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] 

--

##### [resolve_id](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L199) common

> def resolve_id(id)

Resolve id in strings.xml and return the value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to resolve

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [filter](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L206) common

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L209) common

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L216) common

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[HTMLElements] a new instance of HTMLElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L221) common

> def reset



--

##### [result](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L227) common

> def result



--

##### [start_element](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L240) common

> def start_element(name, attrs = [])



--

##### [end_element](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L250) common

> def end_element(name)



--

##### [characters](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/helper.rb#L257) common

> def characters(chars)



--

##### [DEFAULT_HEADERS](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/http_client.rb#L22) common

> DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze

Default HTTP client inherit Appium::Core::Base::Http::Default, but has different DEFAULT_HEADERS

--

##### [pinch](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/multi_touch.rb#L65) common

> def pinch(percentage = 25, auto_perform = true, driver = $driver)

Convenience method for pinching the screen.
Places two fingers at the edges of the screen and brings them together.
Without auto_perform

With driver

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - Set a driver to conduct the action. DEfault is global driver($driver)

--

##### [zoom](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/multi_touch.rb#L108) common

> def zoom(percentage = 200, auto_perform = true, driver = $driver)

Convenience method for zooming the screen.
Places two fingers at the edges of the screen and brings them together.
Without auto_perform

With driver

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[int] percentage - The percent size by which to shrink the screen when pinched.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[boolean] auto_perform - Whether to perform the action immediately (default true)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Driver] driver - Set a driver to conduct the action. DEfault is global driver($driver)

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/multi_touch.rb#L194) common

> def initialize(driver = $driver)

self

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[MultiTouch] a new instance of MultiTouch

--

##### [COMPLEX_ACTIONS](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/touch_actions.rb#L47) common

> COMPLEX_ACTIONS = ::Appium::Core::TouchAction::COMPLEX_ACTIONS



--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/touch_actions.rb#L62) common

> def initialize(driver = $driver)



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TouchAction] a new instance of TouchAction

--

##### [swipe](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/touch_actions.rb#L66) common

> def swipe(opts)



--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/command/ws_logcat.rb#L19) common

> def initialize(url:, output_file: 'logcat.log')



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[WsLogcat] a new instance of WsLogcat

--

##### [handle_message_data](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/common/command/ws_logcat.rb#L24) common

> def handle_message_data(data)



--

##### [for](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/android.rb#L33) android

> def self.for(target)



--

##### [TEXT_VIEW](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L18) android

> TEXT_VIEW = 'android.widget.TextView'



--

##### [TextView](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L19) android

> TextView = TEXT_VIEW



--

##### [text](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L25) android

> def text(value)

Find the first TextView that contains value or by index.
If int then the TextView at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to find.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TextView] 

--

##### [texts](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L35) android

> def texts(value = false)

Find all TextViews containing value.
If value is omitted, all texts are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TEXT_VIEW>] 

--

##### [first_text](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L43) android

> def first_text

Find the first TextView.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TEXT_VIEW] 

--

##### [last_text](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L49) android

> def last_text

Find the last TextView.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TEXT_VIEW] 

--

##### [text_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L56) android

> def text_exact(value)

Find the first TextView that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TEXT_VIEW] 

--

##### [texts_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/text.rb#L63) android

> def texts_exact(value)

Find all TextViews that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<TEXT_VIEW>] 

--

##### [result](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L20) android

> def result

Returns the value of attribute result

--

##### [keys](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L20) android

> def keys

Returns the value of attribute keys

--

##### [filter](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L20) android

> def filter

Returns the value of attribute filter

--

##### [filter=](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L23) android

> def filter=(value)

convert to string to support symbols

--

##### [initialize](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L30) android

> def initialize



__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[AndroidElements] a new instance of AndroidElements

--

##### [reset](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L35) android

> def reset



--

##### [start_element](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L41) android

> def start_element(name, attrs = [], driver = $driver)

http://nokogiri.org/Nokogiri/XML/SAX/Document.html

--

##### [get_android_inspect](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L95) android

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

##### [page](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L121) android

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

##### [id](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L130) android

> def id(id)

Find the first matching element by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ids](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L138) android

> def ids(id)

Find all matching elements by id

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] id - the id to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [ele_index](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L147) android

> def ele_index(class_name, index)

Find the element of type class_name at matching index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name to find

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] index - the index

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the found element of type class_name

--

##### [first_ele](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L166) android

> def first_ele(class_name)

Find the first element that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [last_ele](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L173) android

> def last_ele(class_name)

Find the last element that matches class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the tag to match

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tag](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L181) android

> def tag(class_name)

Find the first element of type class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [tags](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L189) android

> def tags(class_name)

Find all elements of type class_name

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class_name to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [string_visible_contains_xpath](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L232) android

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

##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L252) android

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

##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L270) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L278) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L320) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/helper.rb#L328) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [alert_click](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/alert.rb#L20) android

> def alert_click(value)

Click the first alert button that contains value or by index.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer, String] value - either an integer index of the button or the button's name

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/alert.rb#L27) android

> def alert_accept

Accept the alert.
The last button is considered "accept."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_accept_text](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/alert.rb#L34) android

> def alert_accept_text

Get the text of the alert's accept button.
The last button is considered "accept."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [alert_dismiss](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/alert.rb#L41) android

> def alert_dismiss

Dismiss the alert.
The first button is considered "dismiss."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[void] 

--

##### [alert_dismiss_text](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/alert.rb#L48) android

> def alert_dismiss_text

Get the text of the alert's dismiss button.
The first button is considered "dismiss."

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] 

--

##### [BUTTON](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L17) android

> BUTTON = 'android.widget.Button'



--

##### [Button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L18) android

> Button = BUTTON # backward compatibility

backward compatibility

--

##### [IMAGE_BUTTON](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L20) android

> IMAGE_BUTTON = 'android.widget.ImageButton'



--

##### [ImageButton](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L21) android

> ImageButton = IMAGE_BUTTON # backward compatibility

backward compatibility

--

##### [button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L27) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[BUTTON] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L45) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<BUTTON>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L53) android

> def first_button

Find the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[BUTTON] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L59) android

> def last_button

Find the last button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[BUTTON] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L75) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[BUTTON] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L82) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<BUTTON>] 

--

##### [_button_visible_selectors](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L95) android

> def _button_visible_selectors(opts = {})



--

##### [_button_exact_string](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L108) android

> def _button_exact_string(value)



--

##### [_button_contains_string](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/button.rb#L114) android

> def _button_contains_string(value)



--

##### [find](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L20) android

> def find(value)

Find the first element containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L27) android

> def finds(value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [find_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L34) android

> def find_exact(value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [finds_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L41) android

> def finds_exact(value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [scroll_to](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L54) android

> def scroll_to(text, scrollable_index = 0)

Scroll to the first element containing target text or description.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [scroll_to_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/generic.rb#L72) android

> def scroll_to_exact(text, scrollable_index = 0)

Scroll to the first element with the exact target text or description.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Integer] scrollable_index - the index for scrollable views.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [for](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/bridge.rb#L21) android

> def self.for(target)



--

##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/helper.rb#L23) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/helper.rb#L31) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/helper.rb#L39) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/helper.rb#L47) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [EDIT_TEXT](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L17) android

> EDIT_TEXT = 'android.widget.EditText'



--

##### [EditText](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L18) android

> EditText = EDIT_TEXT



--

##### [textfield](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L24) android

> def textfield(value)

Find the first EditText that contains value or by index.
If int then the EditText at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the text to match exactly.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EDIT_TEXT] 

--

##### [textfields](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L34) android

> def textfields(value = false)

Find all EditTexts containing value.
If value is omitted, all EditTexts are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EDIT_TEXT>] 

--

##### [first_textfield](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L42) android

> def first_textfield

Find the first EditText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EDIT_TEXT] 

--

##### [last_textfield](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L48) android

> def last_textfield

Find the last EditText.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EDIT_TEXT] 

--

##### [textfield_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L55) android

> def textfield_exact(value)

Find the first EditText that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[EDIT_TEXT] 

--

##### [textfields_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/element/textfield.rb#L62) android

> def textfields_exact(value)

Find all EditTexts that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<EDIT_TEXT>] 

--

##### [for](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/bridge.rb#L21) android

> def self.for(target)



--

##### [string_visible_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/helper.rb#L27) android

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

##### [complex_find_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/helper.rb#L45) android

> def complex_find_contains(class_name, value)

Find the first element that contains value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_contains](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/helper.rb#L56) android

> def complex_finds_contains(class_name, value)

Find all elements containing value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Element>] 

--

##### [complex_find_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/helper.rb#L84) android

> def complex_find_exact(class_name, value)

Find the first element exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [complex_finds_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/helper.rb#L95) android

> def complex_finds_exact(class_name, value)

Find all elements exactly matching value

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] class_name - the class name for the element

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] 

--

##### [shell](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/command/command.rb#L28) android

> def shell(command, arguments)

Conduct an adb shell script on Appium server.
Require `--relaxed-security` arguments when run Appium server as server side arguments.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] command - Command for "adb shell"

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array] arguments - Arguments for the adb command

--

##### [start_logs_broadcast](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/command/command.rb#L42) android

> def start_logs_broadcast(logcat_file = 'logcat.log')

Starts Android logcat broadcast websocket

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] logcat_file - A file path to write messages from a logcat WebSocket client

--

##### [stop_logs_broadcast](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/common/command/command.rb#L55) android

> def stop_logs_broadcast

Stop Android logcat broadcast websocket

--

##### [button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L23) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L46) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L56) android

> def first_button

Find the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L62) android

> def last_button

Find the last button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L77) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L89) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [_button_visible_selectors_xpath](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L104) android

> def _button_visible_selectors_xpath(opts = {})



--

##### [_button_exact_string_xpath](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L125) android

> def _button_exact_string_xpath(class_name, value)



--

##### [_button_contains_string_xpath](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/button.rb#L130) android

> def _button_contains_string_xpath(class_name, value)



--

##### [scroll_to](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/generic.rb#L23) android

> def scroll_to(text)

Scroll to the first element containing target text or description.
Scroll happens upto 30 times in centre of device width.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [scroll_to_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/espresso/element/generic.rb#L50) android

> def scroll_to_exact(text)

Scroll to the first element with the exact target text or description.
Scroll happens upto 30 times in centre of device width.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] text - the text or resourceId to search for in the text value and content description

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Element] the element scrolled to

--

##### [button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L23) android

> def button(value)

Find the first button that contains value or by index.
If int then the button at that index is returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String, Integer] value - the value to exactly match.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L44) android

> def buttons(value = false)

Find all buttons containing value.
If value is omitted, all buttons are returned.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to search for

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

##### [first_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L52) android

> def first_button

Find the first button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [last_button](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L59) android

> def last_button

Find the last button.

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [button_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L76) android

> def button_exact(value)

Find the first button that exactly matches value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Button] 

--

##### [buttons_exact](https://github.com/appium/ruby_lib/blob/12317e4d74b20d01813526b28e642e3522193fa3/lib/appium_lib/android/uiautomator2/element/button.rb#L84) android

> def buttons_exact(value)

Find all buttons that exactly match value.

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[String] value - the value to match exactly

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Button>] 

--

