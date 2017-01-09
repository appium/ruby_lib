# Changelogs
Commit based release not is [release_notes.md](./release_notes.md)

Release tags are https://github.com/appium/ruby_lib/releases .

## v9.2.0
### 1. Enhancements
- update set_wait / no_wait logic #249
    - `no_wait` just set `implicit_wait = 0`
    - `set_wait` just set `@default_wait` or arbitrary time as `implicit_wait`

### 2. Bug fixes
- automationName always nil if set automationName in server side #450

### 3. Deprecations

## v9.1.3

Support selenium-webdriver 3.0.4+

### 1. Enhancements
- Improve performance for button/s and text/s #442
- Should use `open_timeout` or `read_timeout` instead of `timeout` #436
- add documentation for alternative long_press method #440

### 2. Bug fixes

### 3. Deprecations

## v9.1.2
### 1. Enhancements
- add `appium_client_version`: https://github.com/appium/ruby_lib/issues/260
- add some tests and fix some rubocop syntax errors

### 2. Bug fixes
- fix `set_immediate_value`: https://github.com/appium/ruby_lib/issues/263

### 3. Deprecations

## v9.1.1
### 1. Enhancements

### 2. Bug fixes
- fix Finds exact in ios does not return an array #423

### 3. Deprecations

Thanks @slipy12

## v9.1.0
### 1. Enhancements
- update dependencies
    - Support selenium-webdriver 3.0.2+
        - If you'd like to use `selenium-webdriver2.x`, please use `appium_lib9.0.0`

### 2. Bug fixes

### 3. Deprecations
- Drop Ruby 1.9.3, 2.0, 2.1 support
    - Because these ruby versions have already stop updating.

## v9.0.0
### 1. Enhancements
- Support `XCUITest` strategy for iOS
    - Basically, `XCUITest` strategy is compatible with `Appium` strategy in this library.
    - But users who use XPath should be check [this document](https://github.com/appium/ruby_lib/blob/master/docs/ios_xcuitest.md) since XPath has performance issue
        - Users who use `find_element/s` should work fine.
        - tests for elements are [here](https://github.com/appium/ruby_lib/tree/master/ios_tests/lib/ios/specs/ios/element)

Special thanks to @montdidier

### 2. Bug fixes

### 3. Deprecations


## v8.2.1
- fix arguments for `move_to` in `swipe` method.
    - https://github.com/appium/ruby_lib/pull/405
    - Please set `:delta_x` and `:delta_y` as the distance from start to move.
