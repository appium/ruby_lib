# Contributing

For features or bug fixes, please submit a pull request. Ideally there would be a test as well. The remainder of this doc details how to run the tests.

## Tests

- Tests are run against [appium's master branch](https://github.com/appium/appium/blob/master/docs/en/contributing-to-appium/appium-from-source.md)
- The tests are run using the [flaky gem](https://github.com/appium/flaky) on OS X
- The `arc` command can be run from within the `ios_tests` or `android_tests` folder to open an interactive console

### Run iOS tests

iOS tests are run on the iPhone 6 / iOS 8.3 simulator.

- `cd ios_tests`
- `flake 3 ios` - Run all the iOS tests up to 3 times

### Run Android tests

Android tests require running on physical hardware with Android 5.0 (API 21). The emulator is unreliable.

- `cd android_tests`
- `flake 3 android` - Run all the Android tests up to 3 times
