# Changelogs
Commit based release not is [release_notes.md](./release_notes.md)

Release tags are https://github.com/appium/ruby_lib/releases .

## Unreleased
### 1. Enhancements

### 2. Bug fixes
- Fix iOS `page` in native context

### 3. Deprecations

## v10.4.0
### 1. Enhancements
- Add `execute_driver` support

### 2. Bug fixes
- Fix wrong warning message in create session

### 3. Deprecations

## v10.3.1
### 1. Enhancements

### 2. Bug fixes
- Fix `scroll_to` and `scroll_to_exact` for Android [#859](https://github.com/appium/ruby_lib/pull/859)

### 3. Deprecations

## v10.3.0
### 1. Enhancements
- Add `tvOS` support
    - Requires Appium 1.13

### 2. Bug fixes

### 3. Deprecations

## v10.2.0
### 1. Enhancements

### 2. Bug fixes
- **Breaking changes**
    - `find_element/s_by_image` no longer need arguments except for a file path
        - `find_element/s_by_image(file_to_image)` instead of `find_element/s_by_image(file_to_image, match_threshold:, visualize:)`

### 3. Deprecations

## v10.1.0
### 1. Enhancements

### 2. Bug fixes
- `*_exact` methods handle value as case sensitive
    - This might break test cases if it calls `*_exact` as case insensitive

### 3. Deprecations

## v10.0.0

This change has a breaking change about implicit wait.

### 1. Enhancements
- **Breaking changes**
    - Set implicit wait zero by default following [WebDriver spec in Selenium](https://www.seleniumhq.org/docs/04_webdriver_advanced.jsp)
        - The change potentially break your `find_element/s`
        - You can wrap it with `wait` method to avoid the error explicitly 
        - Or you also can configure `wait: 20` as `appium_lib` capability to keep the behaviour
- [Experimental]
    - Add `direct_connect` capability
        - How to use: `{ caps: {...},  appium_lib: { direct_connect: true }}`
        - Read [here](https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#enhancements-1) for more details

### 2. Bug fixes

### 3. Deprecations

## v9.18.0
### 1. Enhancements
- Enhance Espresso automation name adaptation
    - Call `xpath` locator strategy instead of `uiautomator` locator strategy in various wrapper methods like `text/s`, `button/s`, etc
    - [#884](https://github.com/appium/ruby_lib/pull/844/)

### 2. Bug fixes

### 3. Deprecations

## v9.17.0
### 1. Enhancements
- Add `action` wrapping _ruby_lib_core_ for [W3C actions](https://github.com/appium/ruby_lib_core/blob/master/lib/appium_lib_core/common/base/bridge/w3c.rb#L39)
    - Returns `TouchAction.new` if the driver works as _MJSONWP_

### 2. Bug fixes

### 3. Deprecations
- `:offset_x` and `:offset_y` in `TouchAction#swipe` is deprecated in favor of `:end_x` and `:end_y`
- [internal] Remove `check_server_version_xcuitest`

## v9.16.1
### 1. Enhancements

### 2. Bug fixes
- Fix failing Appium version comparison [#836](https://github.com/appium/ruby_lib/issues/836)

### 3. Deprecations

## v9.16.0
### 1. Enhancements
- Introduce `appium_thor` in order to automate release

### 2. Bug fixes
- `:app` can be non-path capability like [Windows](https://github.com/Microsoft/WinAppDriver)
    ```ruby
    { caps:
      { platformName: :windows,
        app: 'Microsoft.WindowsCalculator_8wekyb3d8bbwe!App'
      }
    } # `:app` is bundle id.

    { caps:
      { platformName: :windows,
        app: 'relative/path/to/app'
      }
    } # `:app` will be alsolute path to the `:app` if the path exists    
    ```

### 3. Deprecations

## v9.15.2
### 1. Enhancements
- Wrap selenium-webdriver apis via `Appium::Driver` through Appium Core Bridge [#827](https://github.com/appium/ruby_lib/pull/827/files)

### 2. Bug fixes

### 3. Deprecations

## v9.15.1
### 1. Enhancements
- [Internal] Use [ruby_lib_core](https://github.com/appium/ruby_lib_core) 2.0
    - The change shouldn't affect this version since the change influence `Core.new`.

### 2. Bug fixes

### 3. Deprecations

## v9.15.0
### 1. Enhancements
- Requires `appium_lib_core` 1.9.0+
    - Requires `selenium-webdriver 3.14+`
    - Support `find_element :image, image` [appium-base-driver#235](https://github.com/appium/appium-base-driver/pull/235)
        - Requires Appium1.8.2
    - Read [changelog](https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#190---2018-08-05) for more details
- Add `distance` option in `scroll` for XCUITest [#805](https://github.com/appium/ruby_lib/pull/805). Thanks [@saim80](https://github.com/saim80)

### 2. Bug fixes

### 3. Deprecations

## v9.14.3
### 1. Enhancements
- Add Tizen
- Use [ruby_lib_core](https://github.com/appium/ruby_lib_core) 1.8.0

### 2. Bug fixes

### 3. Deprecations

## v9.14.2
### 1. Enhancements
- add `mobile: installCertificate` shortcut for XCUITest
- add `mobile: getContexts` shortcut for XCUITest
- Add `find_element_by_image` and `find_elements_by_image` to handle `ImageElement`
   - Read a [PR](https://github.com/appium/ruby_lib/pull/795/files) and [Core](https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#enhancements-1) for more details
   - Experimental feature

### 2. Bug fixes

### 3. Deprecations

## v9.14.1
### 1. Enhancements

### 2. Bug fixes
- Fix an initialisation error for iOS with `appium_lib_core 1.7.0` [#785](https://github.com/appium/ruby_lib/issues/785)

### 3. Deprecations

## v9.14.0
### 1. Enhancements
- Breaking changes for `press_keycode` and `long_press_keycode`
    - Detail: https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#170---2018-05-28

### 2. Bug fixes

### 3. Deprecations

## v9.13.0
### 1. Enhancements
- Requires `appium_lib_core` 1.6.0+
    - Breaking change for `app_state`: https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#160---2018-05-08

### 2. Bug fixes

### 3. Deprecations

## v9.12.1
### 1. Enhancements
- Support `start_logs_broadcast` and `stop_logs_broadcast` for iOS

### 2. Bug fixes
- Back compatible for `wait(number) {}` and `wait_true(number) {}`

### 3. Deprecations

## v9.12.0
### 1. Enhancements

### 2. Bug fixes

### 3. Deprecations
- Changed the name of arguments
    - `swipe(start_x:, start_y:, end_x:, end_y:)` instead of `swipe(start_x:, start_y:, offset_x:, offset_y:)`

## v9.11.1
### 1. Enhancements
- Apply `ruby_lib_core ~> 1.4.2`
   - Support image comparison features
       - http://www.rubydoc.info/gems/appium_lib_core/Appium/Core/Device/ImageComparison

### 2. Bug fixes
- Fix `wait` compatibility for `ruby_lib_core ~> 1.4.1`

### 3. Deprecations

## v9.11.0
### 1. Enhancements
- Add `start_logs_broadcast` and `stop_logs_broadcast` which use WebSocket to get logcat.
    - Include https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#140---2018-04-15

### 2. Bug fixes

### 3. Deprecations

## v9.10.0
### 1. Enhancements
- Some changes for Appium 1.8.0
    - Read also:
        - https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#131---2018-02-14
        - https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#130---2018-01-28

### 2. Bug fixes

### 3. Deprecations

## v9.9.2
### 1. Enhancements
- Fix Security Vulnerability(Nokogiri)[#761](https://github.com/appium/ruby_lib/pull/761)

### 2. Bug fixes

### 3. Deprecations

## v9.9.1
### 1. Enhancements

### 2. Bug fixes
- fix `Minitest`'s revert: [URL](http://docs.seattlerb.org/minitest/History_rdoc.html#label-5.11.2+-2F+2018-01-25)

### 3. Deprecations

## v9.9.0
### 1. Enhancements
- Bump the core library to 1.3.0
    - The change have one breaking change for `start_recording_screen`(Android) 
    - Read `docs/migration.md`

### 2. Bug fixes

### 3. Deprecations

## v9.8.5
### 1. Enhancements

### 2. Bug fixes
- Fix _Bug: NameError: uninitialized constant Minitest::VERSION [#750](https://github.com/appium/ruby_lib/issues/750)_

### 3. Deprecations

## v9.8.4
### 1. Enhancements

### 2. Bug fixes
- Fix `TypeError: superclass mismatch for class Test` for minitest `5.11.0`+ [PR](https://github.com/appium/ruby_lib/pull/748)

### 3. Deprecations

## v9.8.3
### 1. Enhancements
- Bump the core library to 1.2.5
    - The changelog is [here](https://github.com/appium/ruby_lib_core/blob/master/CHANGELOG.md#124---2018-01-03)

### 2. Bug fixes

### 3. Deprecations

## v9.8.2
### 1. Enhancements
- add `shell` command wrapped `mobile: shell` for Android [#732](https://github.com/appium/ruby_lib/pull/732)
- add handling multiple apps for iOS [#729](https://github.com/appium/ruby_lib/issues/729)
- Adapt W3C commands and make sure to work Appium 1.7.2+
    - Which module, msjsonwp or w3c, used depends on server side's response.

### 2. Bug fixes

### 3. Deprecations

## v9.8.1
### 1. Enhancements

### 2. Bug fixes
- Fix creating session for the new W3C createSession
    - https://github.com/appium/appium/pull/9791

### 3. Deprecations

## v9.8.0

### 1. Enhancements
- Add start/stop recording screen [#674](https://github.com/appium/ruby_lib/issues/674)
- replace core directory to core library [#665](https://github.com/appium/ruby_lib/issues/665), [#718](https://github.com/appium/ruby_lib/pull/718)
    - No change for users

### 2. Bug fixes

### 3. Deprecations
- `ap_` prefixed logging
- `source_window`: use `get_source` instead
- `ios_version`: use `platform_version` instead
- `current_app`: use `current_activity`, for example to know current app.

## v9.7.5

### 1. Enhancements

### 2. Bug fixes
- [fix: take care capybara case #716](https://github.com/appium/ruby_lib/pull/716)

### 3. Deprecations

## v9.7.4

### 1. Enhancements
- Add unlock command: [PR](https://github.com/appium/ruby_lib/pull/710/files)
- Be able to call `source` command from any `automationName`

### 2. Bug fixes

### 3. Deprecations

## v9.7.3

### 1. Enhancements
- Get source from XCUITest with `xcuitest_source format: :json`
    - https://github.com/appium/ruby_lib/pull/699
- `:espresso` support

### 2. Bug fixes


### 3. Deprecations

## v9.7.2

### 1. Enhancements
- Raise error if capability is wrong
    - [validate `caps` and `appium_lib` #684](https://github.com/appium/ruby_lib/issues/684)

### 2. Bug fixes
- `Bug: NoMethodError: undefined method 'write_session_id' for #<Appium::Core::Driver:0x00007fa69119ce88>` [#686](https://github.com/appium/ruby_lib/issues/686)
- undefined local variable or method `patch_webdriver_element' [#687](https://github.com/appium/ruby_lib/issues/687)

### 3. Deprecations

## v9.7.1
Hot-fix for v9.7.0: [uninitialized constant Appium::VERSION #680](https://github.com/appium/ruby_lib/issues/680)

## v9.7.0

_v9.7.0_ has [a bunch of refactoring](https://github.com/appium/ruby_lib/issues/602#issuecomment-331140219) but the behaviours must be the same as well as previous versions.
I've checked the behaviour and confirmed test cases in this repository. So, please create issues if you have any issues against this version.

### 1. Enhancements
- Refactoring
```
lib/appium_lib         # root directory
              /core    # Minumul driver files for the Appium server and dependencies for Selenium Driver.
              /common  # Appium related(some methods to make ruby_lib useful)
              /android # for Android
              /ios     # for iOS
```

- The `core` directory will separate as the other gem in [separate core as core ruby gem #665](https://github.com/appium/ruby_lib/issues/665)
- Logs
    - `get_available_log_types`: To get a list of available log types
    - `get_log(type)`: To get logs associated with `type`

### 2. Bug fixes

### 3. Deprecations
- [refactor: Reduce patch_webdriver_element and some DEPRECATIONs #663](https://github.com/appium/ruby_lib/pull/663)
    - Remove deprecated methods:
        - Android
            - `client_xpath/client_xpaths`
                - Please use `xpath` or `find_element/s(:xpath, "xpaths")`
        - iOS
            - `get_page`
                - Please use `source` instead
    - Deprecated
        - iOS
            - `ios_version`, `source_window`, `page_window`
              - Please use `source` instead


## v9.6.1
### 1. Enhancements
- Refactor `XCUItest` for iOS and `uiautomator2` for Android a bit

### 2. Bug fixes
- missing extending `button` methods for `uiautomator2`, Android

### 3. Deprecations

## v9.6.0
### 1. Enhancements
- Reduce Global Driver
    - We'll stop defining global scope driver by default. So, if you'd like to continue to define global scope, please call `start_driver` as the following.
      ```ruby
      Appium::Driver.new(opts, true).start_driver # $driver is defined.
      Appium::Driver.new(opts, false).start_driver # $driver isn't defined.
      ```
        - [link](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md#initialize)
    - We need to provide `driver` to work `TouchAction` and `MultiAction` without global driver
        - `TouchAction`
            ```ruby
            driver =  Appium::Driver.new(opts, false).start_driver
            action = TouchAction.new.press(x: 45, y: 100).wait(5).release
            action.perform(driver)
            action = TouchAction.new.swipe(....)
            action.perform(driver)
            ```

        - `MultiAction`
            ```ruby
            driver =  Appium::Driver.new(opts, false).start_driver
            pinch 200, true, driver
            ```
- Add example to run multiple iOS Simulators [doc](https://github.com/appium/ruby_lib/blob/master/docs/ios_xcuitest.md#run-tests-on-multiple-simulators-with-xcode-9)
    - Require Xcode 9 and Appium 1.6.6

### 2. Bug fixes
- `scroll_to` is failed on some Android 5.0 and 5.1 devices
    - https://github.com/appium/ruby_lib/pull/638

### 3. Deprecations

### Special Thanks
- Fixing `acroll_to`
    - [@emen](https://github.com/emen)
- Add alias `quit_driver`
    - [@DylanLacey ](https://github.com/DylanLacey)

## v9.5.0
### 1. Enhancements
- Support `selenium-webdriver3.4.1+`
    - Support new `createSession`

### 2. Bug fixes

### 3. Deprecations
- Drop `selenium-webdriver` `3.0 ~ 3.4.0` since some methods depends on `selenium-webdriver3.4.1+`

## v9.4.10
### 1. Enhancements
- some refactoring
- add some documentations

### 2. Bug fixes

### 3. Deprecations

## v9.4.9
### 1. Enhancements

### 2. Bug fixes
- fix handling a tap gesture in xcuitest [#611](https://github.com/appium/ruby_lib/pull/611)

### 3. Deprecations

## v9.4.8
### 1. Enhancements
- within_context swallowing block return value [#311](https://github.com/appium/ruby_lib/issues/311)
- get current_package for Android [#604](https://github.com/appium/ruby_lib/issues/604)
- Show visibility on iOS page command [#609](https://github.com/appium/ruby_lib/pull/609)
    - related: allow showing all elements on ios page command [#310](https://github.com/appium/ruby_lib/issues/310)

### 2. Bug fixes

### 3. Deprecations
- Android: mark deprecated for client side xpath strategy [#608](https://github.com/appium/ruby_lib/pull/608)
- iOS: get_page method [#609](https://github.com/appium/ruby_lib/pull/609)

## v9.4.7
### 1. Enhancements

### 2. Bug fixes
- fix raise 500 error by `driver.remote_status` in `appium_server_version` [#599](https://github.com/appium/ruby_lib/issues/599)

### 3. Deprecations

## v9.4.6
### 1. Enhancements

### 2. Bug fixes
- reduce gemfile size [#591](https://github.com/appium/ruby_lib/issues/591)
    - Exclude `ios_tests`, `android_tests` and `grid` from gem

### 3. Deprecations

## v9.4.5
### 1. Enhancements
- add `touch_and_hols` for `mobile:` command in XCUITest [#581](https://github.com/appium/ruby_lib/pull/581)
- Driver disables Pry pager without asking [#582](https://github.com/appium/ruby_lib/issues/582)
- add grid environments in this repository.

### 2. Bug fixes

### 3. Deprecations

## v9.4.4
### 1. Enhancements
- add mobile gesture, `mobile: alert`
    - Required over https://github.com/appium/appium-xcuitest-driver/releases/tag/v2.28.6
- add travis example for ios [#573](https://github.com/appium/ruby_lib/pull/573)
- remove some redundant code [#572](https://github.com/appium/ruby_lib/pull/572), [#571](https://github.com/appium/ruby_lib/pull/571)
- update api-demos [#569](https://github.com/appium/ruby_lib/issues/569)

### 2. Bug fixes

### 3. Deprecations

## v9.4.3
### 1. Enhancements
- Use uiautomator for uiautomator2 [#561](https://github.com/appium/ruby_lib/pull/561)
    - improve stability for some methods
- don't use selenium-webdriver 3.5+ [#559](https://github.com/appium/ruby_lib/pull/559)
- Auto link bug # from release notes [#239](https://github.com/appium/ruby_lib/issues/239)

### 2. Bug fixes

### 3. Deprecations

### Special Thanks
- Thanks for checking uiautomator2
    - [@Edouard-chin](https://github.com/Edouard-chin), [@rajdeepv](https://github.com/rajdeepv)

## v9.4.2
### 1. Enhancements

### 2. Bug fixes
- fix drag_from_to_for_duration gets server error [#552](https://github.com/appium/ruby_lib/issues/552)

### 3. Deprecations

## v9.4.1
### 1. Enhancements

### 2. Bug fixes
- fix 9.4.0 release sudden failures [#546](https://github.com/appium/ruby_lib/issues/546)
    - XPath strategy for find_element/s sudden fail than uiautomator strategy.
    - Use `:xpath` strategy only for uiautomator2

### 3. Deprecations

## v9.4.0
### 1. Enhancements
- update mobile gesture APIs for XCUITest(WDA) [#514](https://github.com/appium/ruby_lib/pull/514)
    - For XCUITest(WebDriverAgent)
    - Users can call some [`mobile:` methods](https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/ios-xctest-mobile-gestures.md) without `execute_script('mobile: tap', args)`.
    - Users can write test code without `.ref` method for elements in `execute_script`.
    - Example: https://github.com/appium/ruby_lib/pull/537
- Support UIAutomator2 strategy for Android[#505](https://github.com/appium/ruby_lib/issues/505)
    - Fix some find elemenet methods[#544](https://github.com/appium/ruby_lib/pull/544)

### 2. Bug fixes

### 3. Deprecations

## v9.3.8
### 1. Enhancements
- allow using TestObject server [#538](https://github.com/appium/ruby_lib/pull/538)

### 2. Bug fixes

### 3. Deprecations

## v9.3.7
### 1. Enhancements
- Remove appium suffix from find element [#532](https://github.com/appium/ruby_lib/pull/532)
    - rename `@driver.find_element/s_with_appium` to `@driver.find_element/s`
- fix documentations

### 2. Bug fixes

### 3. Deprecations
- `@driver.find_element/s_with_appium`
    - use `@driver.find_element/s` instead

## v9.3.6
### 1. Enhancements
- Add toggle touch id enrollment [#521](https://github.com/appium/ruby_lib/pull/521)

### 2. Bug fixes

### 3. Deprecations

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
