## XCUITest
- Over Appium1.6.0 provides `XCUITest` automation name based on WebDriverAgent.
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent)
- How to migrate XCUITest from UIAutomation
    - [Migrating your iOS tests from UIAutomation](https://github.com/appium/appium/blob/v1.6.2/docs/en/advanced-concepts/migrating-to-xcuitest.md)

## find elements
- supported elements by find_element are:
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver/blob/master/lib/commands/find.js#L17)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent/blob/8346199212bffceab24192e81bc0118d65132466/WebDriverAgentLib/Commands/FBFindElementCommands.m#L111)
- Mapping
    - https://github.com/facebook/WebDriverAgent/blob/master/WebDriverAgentLib/Utilities/FBElementTypeTransformer.m#L19

### with except for XPath
#### examples
- [button_class](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/ios/element/button.rb#L8), [static_text_class](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/ios/element/text.rb#L8), [text_field_class](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/ios/element/textfield.rb#L10) and [secure_text_field_class](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/ios/element/textfield.rb#L15) provide class name.
    - If `automationName` is `Appium` or `nil`, then they provide `UIAxxxx`
    - If `automationName` is `XCUITest`, then they provide `XCUIElementTypexxx`

```ruby
find_element(:class, button_class) # Return a element of XCUIElementTypeButton for XCUITest
```

- [tag/s](https://github.com/appium/ruby_lib/blob/ac03116756a72fbd624fa32ea886123b955d7089/lib/appium_lib/android/helper.rb#L238) is alias of `find_element :class, element`

- `accessibility_id`

```ruby
find_element(:accessibility_id, element) # Return a element which has accessibilityIdentifier, `element`.
```

- `button/s(value)`, `button_exact/buttons_exact`, `text/s(value)`, `text_exact/texts_exact` 
```ruby
buttons(value) # Return button elements include `value` as its name attributes.
```


### with XPath
- It is better to avoid XPath strategy.
    - https://github.com/appium/appium/blob/v1.6.2/docs/en/advanced-concepts/migrating-to-xcuitest.md#xpath-locator-strategy
        - > Try not to use XPath locators unless there are absolutely no other alternatives. In general, XPath locators might be times slower, than other types of locators like accessibility id, class name and predicate (up to 100 times slower in some special cases). They are so slow because XPath location is not natively supported by Apple's XCTest framework.
    - Improved performance a bit
        - https://github.com/appium/appium/issues/6842
        - https://github.com/facebook/WebDriverAgent/issues/306
- XPath in WebDriverAgent
    - https://github.com/facebook/WebDriverAgent/blob/2158a8d0f305549532f1338fe1e4628cfbd53cd9/WebDriverAgentLib/Categories/XCElementSnapshot%2BFBHelpers.m#L57

#### examples
- `textfield/s(value)`, `find/s`, `find_exact/finds_exact` uses XPath in their method. So, these methods are slower than other find_element directly.

```ruby
textfield(value) # Return a XCUIElementTypeSecureTextField or XCUIElementTypeTextField element which has `value` text.
finds_exact(value) # Return any elements include `value` as its name attributes.
```

## Other actions
Basically, other actions such as `type` are compatible with `automationName = Appium`.
