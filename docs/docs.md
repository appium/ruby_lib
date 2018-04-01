# Documentation
## API Doc of Ruby Client
- This library: http://www.rubydoc.info/github/appium/ruby_lib
- Core: http://www.rubydoc.info/github/appium/ruby_lib_core
- [Ruby selenium-webdriver](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings)

### General
- [Appium](https://github.com/appium/appium/blob/master/README.md)
- [Supported platforms](https://github.com/appium/appium/blob/master/docs/en/about-appium/platform-support.md)
- [All methods supported by Appium](https://github.com/appium/appium-base-driver/blob/master/docs/mjsonwp/protocol-methods.md)
    - Fundamental Commands: http://appium.io/docs/en/commands/status/ etc
- [MiniTest Expectations](http://docs.seattlerb.org/minitest/Minitest/Expectations.html)

### Driver types in Ruby Client

```ruby
# Appium specific driver with helpers available extending Standard Appium Driver.
@appium_driver = Appium::Driver.new @options, false

# Standard Appium Driver extends Selenium WebDriver.
@selenium_driver = @appium_driver.start_driver
```

### Example

Example of automating the built in Android settings.

```ruby
# run Pry, and paste the following
apk = { 
        platformName: 'android',
        deviceName: :nexus,
        appPackage: 'com.android.settings',
        appActivity: '.Settings',
        appWaitActivity: '.Settings'
      }
Appium::Driver.new({caps: apk}, false).start_driver
```

Example use of Appium's mobile gesture.


Long click on an ImageView in Android.

```
last_image = find_elements(:class, 'ImageView').last
long_press(element: last_image)
```

Rotate examples. The behaviour is depends on devices.

```ruby
driver.rotate :landscape
driver.rotate :portrait
```

- `appium_server_version` Discover the Appium rev running on the server.
- `element.send_keys "msg"` Sends keys to currently active element


### APIs

```ruby
e.name # button, text
e.value # secure, textfield
e.type 'some text' # type text into textfield
e.clear # clear textfield
e.tag_name # calls .type (patch.rb)
e.text
e.size
e.location
e.location_rel
e.click
e.send_keys 'keys to send'
e.displayed? # true or false depending if the element is visible
e.selected? # is the tab selected?
e.attribute('checked') # is the checkbox checked?


# alert example without helper methods
alert = @driver.switch_to.alert
alert.text
alert.accept
alert.dismiss

# Secure textfield example.
#
# Find using default value
s = textfield 'Password'
# Enter password
s.send_keys 'hello'
# Check value
s.value == ios_password('hello'.length)
```

--

#### Driver
- `start_driver` will restart the driver.
- `x` will quit the driver and exit Pry.
- `execute_script` calls `@driver.execute_script`
- `find_element` calls `@driver.find_element`
- `find_elements` calls `@driver.find_elements`
- `no_wait` will set implicit wait to 0. `@driver.manage.timeouts.implicit_wait = 0`
- `set_wait` will set implicit wait to default seconds. `@driver.manage.timeouts.implicit_wait = default`
- `set_wait(timeout_seconds)` will set implicit wait to desired timeout. `@driver.manage.timeouts.implicit_wait = timeout`
- `.click` to tap an element.
- `.send_keys` or `.type` to type on an element.

#### Cucumber Sauce Integration

Reset after each test and when done report the result to Sauce after quiting the driver.

```ruby
require 'rest_client' # https://github.com/archiloque/rest-client
require 'json' # for .to_json
require 'sauce_whisk'

After do |scenario|
  # end the test session, ignoring any exceptions.
  ignore { $driver.driver_quit }
  
  user   = ENV['SAUCE_USERNAME']
  key    = ENV['SAUCE_ACCESS_KEY']
  if user && !user.empty? && key && !key.empty?
    passed = ! scenario.failed?
    SauceWhisk::Jobs.change_status $driver.driver.session_id, passed
  end
end
```
