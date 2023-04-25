# appium_lib

[![Gem Version](https://badge.fury.io/rb/appium_lib.svg)](http://badge.fury.io/rb/appium_lib)

[![Downloads](https://img.shields.io/gem/dt/appium_lib.svg)](https://rubygems.org/gems/appium_lib)

- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](https://www.rubydoc.info/github/appium/ruby_lib)
    - [Documentation for core lib](http://www.rubydoc.info/github/appium/ruby_lib_core)
        - Especially [driver method for Appium](http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Device)

Helper methods for writing cross platform (iOS, Android) tests in Ruby using Appium. Note that user waits should not exceed 120 seconds if they're going to run on Sauce Labs.

**Recommend** to use [ruby_lib_core](https://github.com/appium/ruby_lib_core), which works as a Ruby client for Appium. `ruby_lib` wraps the core library with some additional helpful methods, but some of wrapped methods may have unexpected complexity.
Ordinary, `ruby_lib` worked with class driver, `$driver`, mainly.
We can avoid the class driver with current `ruby_lib`, but if you'd like to implement your test cases based on instance driver, `@driver`, you can consider using `ruby_lib_core` first.

# Setup
## Requirement
- [Appium](https://github.com/appium/appium#requirements)
- Ruby: 2.7+

### Ruby Lib and Appium

- Ruby library version over `12.0.0` is based on Selenium v4
    - Please read [changelog of 12.0.0](CHANGELOG.md#1200---2021-11-06) for more details to migrate from v11 to v12
- Ruby library version over `9.8.0` requires Appium over `1.8`
- Ruby library version under `9.7.5` can work with Appium under `1.7`

## Start appium server

### Appium 2

```bash
$ npm install -g appium@next
$ appium driver install xcuitest  # proper driver name to install
$ appium server
```

> **Note** Please set `server_url` properly like the below since the appium 2
> changed the default WebDriver URL to without `/wd/hub` to follow W3C.
> ```
>  opts = {
>    caps: {
>      automationName: 'xcuitest'
>      platformName: 'ios',
>      app: '/path/to/MyiOS.app'
>    },
>    appium_lib: {
>      server_url: 'http://127.0.0.1:4723'
>    }
>  }
>  appium_driver = Appium::Driver.new(opts)
>  appium_driver.start_driver
> ```
> Or please start the appium server with `appium server --base-path=/wd/hub`

### Appium 1
```bash
$ npm install -g appium
$ appium
```

## Install / Upgrade

```bash
gem install appium_lib
```

## [Sauce Labs env vars](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/sauce_labs.rb)

- `SAUCE_USERNAME` Sauce username
- `SAUCE_ACCESS_KEY` Sauce API key
- `SAUCE_ENDPOINT` Alternative Sauce Appium Server endpoint (only use if directed)

(Note: If these variables are set, all tests will use Sauce Labs unless over-ridden in configuration.)

# Documentation

- [Getting started](https://github.com/appium/appium)
- [Overview](https://github.com/appium/ruby_lib/blob/master/docs/docs.md)
- [Ruby Android methods](https://github.com/appium/ruby_lib/blob/master/docs/android_docs.md)
- [Ruby iOS methods](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md)
    - [Tips for XCUITest for iOS](https://github.com/appium/ruby_lib/blob/master/docs/ios_xcuitest.md)

# Related libraries
- [ruby_lib_core](https://github.com/appium/ruby_lib_core): Bridged commands, WebDriver dependencies
    - We add new endpoints for Appium in the core library, and `ruby_lib` call the methods.
- [ruby_console](https://github.com/appium/ruby_console): Appium Ruby Console
- [appium_capybara](https://github.com/appium/appium_capybara): Gem enabling appium support in capybara

# Load Pry
`Pry.config.pager = false` is set if you have no `.pryrc` files and `Pry` is defined.

# Run tests in parallel
This repository has examples for running tests in parallel. Read [ios_tests](https://github.com/appium/ruby_lib/tree/master/ios_tests) to see them.

# Contribute
## How to add new commands for `driver`
- Add the new commands in [ruby_lib_core](https://github.com/appium/ruby_lib_core). [An example](https://github.com/appium/ruby_lib_core/commit/cdb02c29c8663d22d643b52fd65c8b2d1373bebb)

## How to add new helpful methods
- Add the new methods in this library
