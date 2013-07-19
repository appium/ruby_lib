#### Documentation

- find_elements returns an empty array [] when no elements are found.

##### [app_lib on rubydoc.info](http://www.rubydoc.info/github/appium/ruby_lib/master/toplevel)

- [iOS UI Automation](http://developer.apple.com/library/ios/#documentation/DeveloperTools/Reference/UIAutomationRef/_index.html) Example use `@driver.execute_script "UIATarget.localTarget().frontMostApp().mainWindow().rect()"
`
- [Android UIAutomator](http://developer.android.com/tools/help/uiautomator/index.html)
- [UiSelector.java](https://android.googlesource.com/platform/frameworks/testing/+/master/uiautomator/library/src/com/android/uiautomator/core/UiSelector.java)
- [Ruby selenium-webdriver](http://selenium.googlecode.com/svn/trunk/docs/api/rb/index.html)
- [Appium](https://github.com/appium/appium/blob/master/README.md)
- [Appium extension](https://github.com/appium/appium/wiki/Automating-mobile-gestures)
- [mechanic names of elements](https://github.com/jaykz52/mechanic/blob/8c490e1d225f384847e47ffdafb47cc2248bb96c/src/mechanic-core.js#L28)
- [All methods supported by Appium](https://github.com/appium/appium/wiki/JSON-Wire-Protocol:-Supported-Methods)
- [Appium's mobile gesture docs](https://github.com/appium/appium/wiki/Automating-mobile-gestures)

--

Example use of Appium's mobile gesture.

> @driver.execute_script 'mobile: tap', :x => 0, :y => 500

`console.rb` uses some code from [simple_test.rb](
https://github.com/appium/appium/blob/82995f47408530c80c3376f4e07a1f649d96ba22/sample-code/examples/ruby/simple_test.rb) and is released under the [same license](https://github.com/appium/appium/blob/c58eeb66f2d6fa3b9a89d188a2e657cca7cb300f/LICENSE) as Appium. The [Accessibility Inspector](https://developer.apple.com/library/ios/#documentation/UserExperience/Conceptual/iPhoneAccessibility/Testing_Accessibility/Testing_Accessibility.html) is helpful for discovering button names and textfield values.

--

Tag Name  | UIA
       --:|:--
button    | UIAButton
textfield | UIATextField
secure    | UIASecureTextField
text      | UIAStaticText

--

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
0. `(Button) button(text, number = 0)` Find a button by text and optionally number.
0. `(Button) button_include(text)` Get the first button that includes text.
0. `(Array<String>, Array<Buttons>) buttons(text = nil)` Get an array of button texts or button elements if text is provided.
0. `(Array<Button>) buttons_include(text)` Get all buttons that include text.
0. `(Button) first_button` Get the first button element.
0. `(Button) last_button` Get the last button element.

#### textfield
0. `(Textfield) textfield(index)` Find a textfield by index.
0. `(Array<Textfield>) e_textfields` Get an array of textfield elements.
0. `(Textfield) first_textfield` Get the first textfield element.
0. `(Textfield) last_textfield` Get the last textfield element.
0. `(Textfield) textfield(text)` Get the first textfield that matches text.
0. `(Textfield) textfield_include(text)` Get the first textfield that includes text.
0. `(Array<String>) textfields` Get an array of textfield texts.

#### text

The Static Text methods have been prefixed with `s_` to avoid conflicting with the generic text methods.

0. `(Text) s_text(index)` Find a text by index.
0. `(Array<Text>) s_e_texts` Get an array of text elements.
0. `(Text) first_s_text` Get the first text element.
0. `(Text) last_s_text` Get the last text element.
0. `(Text) s_text(text)` Get the first element that matches text.
0. `(Text) s_text_include(text)` Get the first textfield that includes text.
0. `(Array<String>) s_texts` Get an array of text texts.

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
e.rel_location
e.click
e.send_keys 'keys to send'
e.set_value 'value to set' # ruby_console specific
e.displayed? # true or false depending if the element is visible

# alert example without helper methods
alert = $driver.switch_to.alert
alert.text
alert.accept
alert.dismiss

# Secure textfield example.
#
# Find using default value
s = secure 'Password'
# Enter password
s.send_keys 'hello'
# Check value
s.value == password('hello'.length)
```

[routing.js](https://github.com/appium/appium/blob/master/app/routing.js#L69) lists not yet implemented end points.

--

#### Driver

`start_driver` will restart the driver.

`x` will quit the driver and exit Pry.

`execute_script` calls `$driver.execute_script`

`find_element` calls `$driver.find_element`

`find_elements` calls `$driver.find_elements`

`mobile :swipe, endX: 100, endY: 100, duration: 0.01` calls `$driver.execute_script 'mobile: swipe', endX: 100, endY: 100, duration: 0.01`

`no_wait` will set implicit wait to 0. `$driver.manage.timeouts.implicit_wait = 0`

`set_wait` will set implicit wait to default 30 seconds. `$driver.manage.timeouts.implicit_wait = 30`

`set_wait(timeout_seconds)` will set implicit wait to desired timeout. `$driver.manage.timeouts.implicit_wait = timeout`

.click to tap an element.
.send_keys to type on an element.

#### Raw UIAutomation

`execute_script "au.lookup('button')[0].tap()"` is the same as
`execute_script 'UIATarget.localTarget().frontMostApp().buttons()[0].tap()'`

See [app.js](https://github.com/appium/appium/blob/master/app/uiauto/appium/app.js#L3) for more au methods.
Note that raw UIAutomation commands are not officially supported.

Advanced au.

In this example we lookup two tags, combine the results, wrap with $, and then return the elements.

```ruby
s = %(
var t = au.lookup('textfield');
var s = au.lookup('secure');
var r = $(t.concat(s));
au._returnElems(r);
)

execute_script s
```

#### XPath

See [#194](https://github.com/appium/appium/pull/194/files) for details.

```ruby
find_element  :xpath, 'button'
find_elements :xpath, 'button'

find_element  :xpath, 'button[@name="Sign In"]'
find_elements :xpath, 'button[@name="Sign In"]'

find_element  :xpath, 'button[contains(@name, "Sign In")]'
find_elements :xpath, 'button[contains(@name, "Sign")]'

find_element :xpath, 'textfield[@value="Email"]'
find_element :xpath, 'textfield[contains(@value, "Email")]'

find_element  :xpath, 'text[contains(@name, "Reset")]'
find_elements :xpath, 'text[contains(@name, "agree")]'
```

#### Cucumber Sauce Integration

Reset after each test and when done report the result to Sauce after quiting the driver.

```ruby
require 'rest_client' # https://github.com/archiloque/rest-client
require 'json' # for .to_json

$passed = true

After do |scenario|
  # Reset scenario unless the feature was tagged @keep
  $driver.execute_script 'mobile: reset' unless scenario.feature.source_tag_names.include? '@keep'

  if $passed
    $passed = false if scenario.failed?
  end
end

at_exit do
  # selenium-webdriver (2.32.1) or better can use
  # $driver.session_id
  ID = $driver.send(:bridge).session_id
  driver_quit

  if !SAUCE_USERNAME.nil? && !SAUCE_ACCESS_KEY.nil?
    URL = "https://#{SAUCE_USERNAME}:#{SAUCE_ACCESS_KEY}@saucelabs.com/rest/v1/#{SAUCE_USERNAME}/jobs/#{ID}"

    # Keep trying until passed is set correctly. Give up after 30 seconds.
    wait do
      response = RestClient.put URL, { 'passed' => $passed }.to_json, :content_type => :json, :accept => :json
      response = JSON.parse(response)

      # Check that the server responded with the right value.
      response['passed'] == $passed
    end
  end
end
```

#### Set iOS version

```bash
export V=`git rev-parse --verify HEAD`
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $V" Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $V" Info.plist
/usr/bin/plutil -convert binary1 Info.plist
```

#### Set Android version

```ruby
# Save as set_version.rb and pass version as first arg.
# android:versionCode must be an int
Dir.glob('./**/AndroidManifest.xml') do |xml|
  data = File.read xml
  data.scan(/android:versionName="[^"]*"/).each { |m| data.gsub!(m, m.sub(/"[^"]*"/, '"' + ARGV.first + '"')) }
  File.open(xml, 'w') { |f| f.write data }
end
```
