### Documentation

- find_elements returns an empty array [] when no elements are found.
- button(int), textfield(int) use xpath so 1 is the first button, 2 the second etc. 0 is invalid.

#### [app_lib on rubydoc.info](http://www.rubydoc.info/github/appium/ruby_lib/master/toplevel)
##### General
- [Appium](https://github.com/appium/appium/blob/master/README.md)
- [Ruby selenium-webdriver](https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings)
- [All methods supported by Appium](https://github.com/appium/appium-base-driver/blob/master/docs/mjsonwp/protocol-methods.md)
- [MiniTest Expectations](http://docs.seattlerb.org/minitest/Minitest/Expectations.html)

#### Drivers
- [platform-support](https://github.com/appium/appium/blob/master/docs/en/about-appium/platform-support.md)

--

Driver types.

```ruby
# appium specific driver with helpers available
@appium_driver = Appium::Driver.new @options, false
# standard selenium driver without any appium methods
@selenium_driver = @appium_driver.start_driver
```

--

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

--

Example use of Appium's mobile gesture.

> @driver.find_element()

`console.rb` uses some code from [simple_test.rb](
https://github.com/appium/sample-code/blob/master/sample-code/examples/ruby/simple_test.rb) and is released under the [same license](https://github.com/appium/appium/blob/c58eeb66f2d6fa3b9a89d188a2e657cca7cb300f/LICENSE) as Appium.
The Accessibility Inspector is helpful for discovering button names and textfield values.

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

#### generic

- `source` Prints a JSON view of the current page.
- `page` Prints the content descriptions and text values on the current page.
- `page_class` Prints the classes found on the current page.
- `(Element) find(value)` Returns the first element that contains value.
- `(Element) finds(value)` Returns all elements containing value (iOS only for now).
- `(Element) name(name)` Returns the first element containing name. Android name is the content description.
iOS uses accessibility label with a fallback to text.
- `(Array<Element>) names(name)` Returns all elements containing name.
- `(Element) text(text)` Returns the first element containing text.
- `(Array<Element>) texts(text)` Returns all elements containing text.
- `current_app` Returns information about the current app. Android only.

--

#### alert
0. `(void) alert_accept` Accept the alert.
0. `(String) alert_accept_text` Get the text of the alert's accept button.
0. `(void) alert_click(value)` iOS only Tap the alert button identified by value.
0. `(void) alert_dismiss` Dismiss the alert.
0. `(String) alert_dismiss_text` Get the text of the alert's dismiss button.
0. `(String) alert_text` Get the alert message text.

#### button
0. `(Button) button(index)` Find a button by index.
0. `(Button) button(text)` Get the first button that includes text.
0. `(Array<String>, Array<Buttons>) buttons(text = nil)` Get an array of button texts or button elements if text is provided.
0. `(Array<Button>) buttons(text)` Get all buttons that include text.
0. `(Button) first_button` Get the first button element.
0. `(Button) last_button` Get the last button element.

#### textfield
0. `(Textfield) textfield(index)` Find a textfield by index.
0. `(Array<Textfield>) textfields` Get an array of textfield elements.
0. `(Textfield) first_textfield` Get the first textfield element.
0. `(Textfield) last_textfield` Get the last textfield element.
0. `(Textfield) textfield_exact(text)` Get the first textfield that matches text.
0. `(Textfield) textfield(text)` Get the first textfield that includes text.

#### text

The Static Text methods have been prefixed with `s_` to avoid conflicting with the generic text methods.

0. `(Text) text(index)` Find a text by index.
0. `(Array<Text>) texts` Get an array of text elements.
0. `(Text) first_text` Get the first text element.
0. `(Text) last_text` Get the last text element.
0. `(Text) text_exact(text)` Get the first element that matches text.
0. `(Text) text(text)` Get the first textfield that includes text.

#### window
0. `(Object) window_size` Get the window's size.

--

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
