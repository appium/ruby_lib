## XCUITest
- Over Appium1.6.0 provides `XCUITest` automation name based on WebDriverAgent.
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent)
- How to migrate XCUITest from UIAutomation
    - [Migrating your iOS tests from UIAutomation](https://github.com/appium/appium/blob/v1.6.2/docs/en/advanced-concepts/migrating-to-xcuitest.md)
- Mobile gestures for XCUITest
    - [ios-xctest-mobile-gestures](https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/ios/ios-xctest-mobile-gestures.md)
    - Required Appium1.6.4+

## find elements
- supported elements by find_element are:
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver/blob/master/lib/commands/find.js#L17)
        - [locatorStrategies](https://github.com/appium/appium-xcuitest-driver/blob/95886f1118d71fe950768f8262179d3608b40fc7/lib/driver.js#L81)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent/blob/8346199212bffceab24192e81bc0118d65132466/WebDriverAgentLib/Commands/FBFindElementCommands.m#L111)
- Mapping
    - https://github.com/facebook/WebDriverAgent/blob/master/WebDriverAgentLib/Utilities/FBElementTypeTransformer.m#L19

### with except for XPath and Predicate
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

### with Predicate
- We recommend to use predicate strategy instead of XPath strategy.
    - e.g. `find_ele_by_predicate/find_eles_by_predicate`,  `find_ele_by_predicate_include/find_eles_by_predicate_include`
- A helpful cheatsheet for predicate
    - https://realm.io/news/nspredicate-cheatsheet/
- For XCUITest(WebDriverAgent), without 'wd' prefixes are supported.
    - https://github.com/facebook/WebDriverAgent/wiki/Queries
    - For example, `%(name ==[c] "#{value}" || label ==[c] "#{value}" || value ==[c] "#{value}")` is equal to `%(wdName ==[c] "#{value}" || wdLabel ==[c] "#{value}" || wdValue ==[c] "#{value}")` in WebDriverAgent.

#### examples
- `textfield/s(value)`, `find/s`, `find_exact/finds_exact`, `find_ele_by_predicate/find_eles_by_predicate` and `find_ele_by_predicate_include/find_eles_by_predicate_include` use predicate strategy in their method.

```ruby
textfield(value) # Return a XCUIElementTypeSecureTextField or XCUIElementTypeTextField element which has `value` text.
finds_exact(value) # Return any elements include `value` as its name attributes.
```

### with Class Chain
- require Appium 1.6.4+
    - https://github.com/appium/appium-xcuitest-driver/pull/391
    - https://github.com/appium/java-client/pull/599/files
- WebDriverAgent
    - https://github.com/facebook/WebDriverAgent/wiki/Queries

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

```ruby
xpaths("//some xpaths")
```

## Gesture
- `mobile:` commands are provided by WDA.
- Documentations
    - https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/ios/ios-xctest-mobile-gestures.md
- Specs by test code
    - https://github.com/appium/appium-xcuitest-driver/blob/master/test/functional/basic/gesture-e2e-specs.js

### Workaround
- `mobile:` commands depends on WDA and Apple's framework and the behaviour depends on them.
- Sometimes issues occur such as "doubleTap isn't tapping #548"
    - workaround for it:
        - with `selenium-webdriver >= 3.4.0`
            ```ruby
            def double_tap(element)
              rect = element.rect
              execute_script 'mobile: doubleTap', x: rect.x + rect.width / 2, y: rect.y + rect.height / 2
            end
            ```        
        - with `selenium-webdriver < 3.4.0`
            ```ruby
              def double_tap(element)
                size = element.size
                location = element.location
                execute_script 'mobile: doubleTap', x: location.x + size.width / 2, y: location.y + size.height / 2
              end
            ```

## Other actions
Basically, other actions such as `type` are compatible with `automationName = Appium`.

## Pasteboard
- Simulator only
    - https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/ios-xctest-pasteboard.md
