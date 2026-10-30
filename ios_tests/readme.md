ruby_lib_ios
=====================

ruby_lib's iOS tests. Requires `Ruby 2.2+` or better.

Tests use non-global drivers by default. To check legacy global mode, run
`APPIUM_TEST_GLOBAL_DRIVER=true bundle exec rake ios`. Both modes use the
same test cases and explicitly close their session after the run.

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

--

```ruby
Finished in 1 min 57 secs

123 runs, 164 assertions, 0 failures, 0 errors, 0 skips
```

### Tips for parallel 

- https://github.com/grosser/parallel_tests
   - Usage: https://github.com/appium/ruby_lib_core#run-parallel-tests-with-parallel_tests-gem

For a local Simulator with a different runtime or device, set `IOS_VERSION` and
`IOS_DEVICE_NAME`. `IOS_APP` may point to a locally built UICatalog app with the
same screens and bundle ID (for example, an ARM Simulator build). The default
remains `test_apps/UICatalog.app.zip`. CI allows up to 900 seconds per HTTP request
with `APPIUM_TEST_READ_TIMEOUT`, so the 600-second WDA startup budget can finish.

Web-context tests open Safari against a temporary localhost HTML fixture. The
bundled UICatalog uses legacy UIWebView, whose protocol is no longer supported by
current Appium RemoteDebugger. These tests require an iOS Simulator and restore
UICatalog after closing the fixture server.
