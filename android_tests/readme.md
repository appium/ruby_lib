ruby_lib_android
=====================

ruby_lib's Android tests. Requires `Ruby 2.2+` or better.

- `rake install` Install gems required to run the tests.
- `rake android` Run all tests.
- `rake android['android/element/generic']` Run a single test.
- `arc` Opens the Appium Ruby Console (arc). Enables interactive testing.
  - `gem install appium_console` if it's not installed already.

api.apk is from [appium/android-apidemos](https://github.com/appium/android-apidemos)
The way to generate api.apk is described in the repository.

---

```ruby
Finished in 2 mins 57 secs

106 runs, 144 assertions, 0 failures, 0 errors, 0 skips
```

#### Coverage

- apk
    - [emma-build](https://github.com/appium/android-apidemos/blob/a20597cb97238bf43c073500444b9428fab53f50/README.md#emma-build-for-testing-code-coverage)
- `appium.txt`
    ```
    [caps]
    platformName = "android"
    deviceName = "Nexus 7"
    app = "../test_apps/api.apk"
    appPackage = "io.appium.android.apis"
    appActivity = "io.appium.android.apis.ApiDemos"
    some_capability = "some_capability"
    androidCoverage = 'io.appium.android.apis/io.appium.android.apis.app.LocalSampleInstrumentation'
    
    [appium_lib]
    sauce_username = ""
    sauce_access_key = ""
    ```
