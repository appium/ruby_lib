## XCUITest
- Over Appium1.6.0 provides `XCUITest` automation name based on WebDriverAgent.
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent)
- How to migrate XCUITest from UIAutomation
    - [Migrating your iOS tests from UIAutomation](https://github.com/appium/appium/blob/v1.6.2/docs/en/advanced-concepts/migrating-to-xcuitest.md)


### Elements
- supported elements by find_element is:
    - [appium-xcuitest-driver](https://github.com/appium/appium-xcuitest-driver/blob/master/lib/commands/find.js#L17)
    - [WebDriverAgent](https://github.com/facebook/WebDriverAgent/blob/8346199212bffceab24192e81bc0118d65132466/WebDriverAgentLib/Commands/FBFindElementCommands.m#L111)
- Mapping
    - https://github.com/facebook/WebDriverAgent/blob/master/WebDriverAgentLib/Utilities/FBElementTypeTransformer.m#L19

### XPath
- It is better to avoid XPath strategy.
    - https://github.com/appium/appium/blob/v1.6.2/docs/en/advanced-concepts/migrating-to-xcuitest.md#xpath-locator-strategy
      > Try not to use XPath locators unless there is absolutely no other alternatives. In general, xpath locators might be times slower, than other types of locators like accessibility id, class name and predicate (up to 100 times slower in some special cases). They are so slow, because xpath location is not natively supported by Apple's XCTest framework.
    - Improved performance a bit
        - https://github.com/appium/appium/issues/6842
        - https://github.com/facebook/WebDriverAgent/issues/306
- XPath in WebDriverAgent
    - https://github.com/facebook/WebDriverAgent/blob/2158a8d0f305549532f1338fe1e4628cfbd53cd9/WebDriverAgentLib/Categories/XCElementSnapshot%2BFBHelpers.m#L57

