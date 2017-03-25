# Changelogs
Commit based release not is [release_notes.md](./release_notes.md)

Release tags are https://github.com/appium/ruby_lib/releases .

## v9.3.5
### 1. Enhancements
- add some commands for Android and class chain for iOS [#513](https://github.com/appium/ruby_lib/issues/513)
    - iOS
        - `find_element :class_chain, 'XCUIElementTypeWindow/*/*/XCUIElementTypeStaticText'`
    - Android
        - `get_system_bars`
        - `get_display_density`
        - `is_keyboard_shown`
- add scrollable index parameter into scroll methods [#506](https://github.com/appium/ruby_lib/issues/506)
    - `scroll_to(text, scrollable_index = 0)`
    - `scroll_to_exact(text, scrollable_index = 0)`
- clear `@actions` in Appium::TouchAction if `perform` is called [#511](https://github.com/appium/ruby_lib/issues/511)

### 2. Bug fixes

### 3. Deprecations

## v9.3.4
### 1. Enhancements
- [remove workaround](https://github.com/appium/ruby_lib/pull/474/commits/57cc95264e83e14862f729683b93c1f020a30ce5) to pass CI
- document uiautomator events logging command [#319](https://github.com/appium/ruby_lib/issues/319)
- use predicate for XCUITest to improve performance [#493](https://github.com/appium/ruby_lib/issues/493)
    - `text/s`, `button/s`, `textfield/s`, `tags_exact`, `tags_include`
    - new: `find_ele/s_by_predicate`, `find_ele/s_by_predicate_include`

### 2. Bug fixes

### 3. Deprecations


## v9.3.3
### 1. Enhancements
- add tags_include/tags_exact to be able to find elements of arbitrary classes such as XCUIElementTypeTextView [#488](https://github.com/appium/ruby_lib/issues/488)

### 2. Bug fixes

### 3. Deprecations

## v9.3.2
### 1. Enhancements
- allow SAUCE_ENDPOINT env var to override sauce server url/path [#485](https://github.com/appium/ruby_lib/pull/485)
    - Read [readme](https://github.com/appium/ruby_lib/blob/89c7c89be058153d119d517eab22ccc318d33649/readme.md#sauce-labs-env-vars)'s `SAUCE_ENDPOINT` section.

### 2. Bug fixes

### 3. Deprecations

## v9.3.1
### 1. Enhancements
- Clarify disabling Sauce Labs. [#471](https://github.com/appium/ruby_lib/pull/471)
- add getting performance [#479](https://github.com/appium/ruby_lib/issues/479)
    - **require appium-base-driver@2.1.7**

### 2. Bug fixes
- Fix missed var rename [#481](https://github.com/appium/ruby_lib/pull/481)

### 3. Deprecations

## v9.3.0
### 1. Enhancements
- wait / wait_true need global defaults [#250](https://github.com/appium/ruby_lib/issues/250)
    - You can set default value in `appium_lib` 
    - e.g.: [lib/appium_lib/driver.rb](https://github.com/appium/ruby_lib/blob/34803ef6b7b94df9ef4e147ba8fec5c1d2cfaada/lib/appium_lib/driver.rb#L341-L351)
- Problem with delta_x/delta_y in swipe method [#461](https://github.com/appium/ruby_lib/issues/461)
    - Revert _fix arguments for `move_to` in `swipe` method._ in Appium v8.2.1
    - `delta_x/delta_y` replace to `offset_*` for iOS
        - e.g.: `swipe start_x: start_x, start_y: start_y, end_offset_x: 0, offset_y: -100`
    - `delta_x/delta_y` replace to `end_*` for Android
        - e.g.: `swipe start_x: start_x, start_y: start_y, end_x: start_x, end_y: start_y - 100`
    - The reason why there are two kind of arguments is the following issue.
        - [Difference behaviour between iOS and Android regarding with `swipe` action #7702](https://github.com/appium/appium/issues/7702)
- Clarify disabling Sauce Labs. #471
  - update documentations

### 2. Bug fixes
- REQUIRED_VERSION_XCUITEST [#463](https://github.com/appium/ruby_lib/issues/463)
- find elements except for name attributes in text/s, button/s [#462](https://github.com/appium/ruby_lib/issues/462)
    - Return only **visible** elements
        - Previously, these methods return **all** elements.

### 3. Deprecations
- Problem with delta_x/delta_y in swipe method [#461](https://github.com/appium/ruby_lib/issues/461)
    - `delta_x/delta_y` are replaced to `offset_*` for iOS and `end_*` for Android.

## v9.2.0
### 1. Enhancements
- update set_wait / no_wait logic #249
    - `no_wait` just set `implicit_wait = 0`
    - `set_wait` just set `@default_wait` or arbitrary time as `implicit_wait`
    - remove `last_waits` attribute

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
