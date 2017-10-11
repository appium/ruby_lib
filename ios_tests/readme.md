ruby_lib_ios
=====================

ruby_lib's iOS tests. Requires `Ruby 2.2+` or better.

- `rake install` Install gems required to run the tests.
- `rake ios` Run all tests.
- `rake` Run all the test. Same as `rake ios`
- `rake ios['ios/element/generic']` Run a single test.
- `rake run_parallel_t` Run a test in parallel with thread model.
- `rake run_parallel_p` Run a test in parallel with process model.
- `arc` Opens the Appium Ruby Console (arc). Enables interactive testing.
  - `gem install appium_console` if it's not installed already.

`UICatalog6.1` is from [appium/appium](https://github.com/appium/appium/blob/master/assets/UICatalog6.1.app.zip)

There are two backend drivers available for iOS (automationName). UIAutomation which is supported up-to iOS 9.3 and XCUITest which is supported from 10.0 on. UIAutomation is deprecated but will continue to be supported for the time being.

By default, the tests are now run against `iPhone 6 Simulator 10.1 (14A345)`
#### Documentation

- [Installing Appium on OS X](https://github.com/appium/ruby_console/blob/master/osx.md)
- [Overview](https://github.com/appium/ruby_lib/blob/master/docs/docs.md)
- [iOS methods](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md)
- [Minitest Expectations](http://ruby-doc.org/stdlib-1.9.3/libdoc/minitest/spec/rdoc/MiniTest/Expectations.html)

--

```java
Finished in 1 min 57 secs

123 runs, 164 assertions, 0 failures, 0 errors, 0 skips
```
