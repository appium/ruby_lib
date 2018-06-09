# appium_lib

[![Gem Version](https://badge.fury.io/rb/appium_lib.svg)](http://badge.fury.io/rb/appium_lib)
[![Travis Master](https://travis-ci.org/appium/ruby_lib.svg?branch=master)](https://travis-ci.org/appium/ruby_lib/builds)

[![Downloads](https://img.shields.io/gem/dt/appium_lib.svg)](https://rubygems.org/gems/appium_lib)
[![Pull Requests](http://issuestats.com/github/appium/ruby_lib/badge/pr)](http://issuestats.com/github/appium/ruby_lib)
[![Issues](http://issuestats.com/github/appium/ruby_lib/badge/issue)](http://issuestats.com/github/appium/ruby_lib)

- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](https://github.com/appium/ruby_lib/tree/master/docs)
    - [Documentation for core lib](http://www.rubydoc.info/github/appium/ruby_lib_core)
        - Especially [driver method for Appium](http://www.rubydoc.info/github/appium/ruby_lib_core/Appium/Core/Device)
- [Getting Started](https://github.com/appium/appium/blob/master/docs/en/about-appium/getting-started.md)
- [code examples](https://github.com/appium/sample-code/tree/master/sample-code/examples/ruby)

Helper methods for writing cross platform (iOS, Android) tests in Ruby using Appium. Note that user waits should not exceed 120 seconds if they're going to run on Sauce Labs.

[Ruby_lib_core](https://github.com/appium/ruby_lib_core) is the core driver library which provide `selenium-webdriver` related features and driver methods for Appium.
The `ruby_lib` wrap the driver and serve many helpful methods for users.

# Setup
## Requirement
- [Appium](https://github.com/appium/appium#requirements)
- Ruby: 2.2+

## Start appium server

```bash
$ npm install -g appium
$ appium
```

## Install / Upgrade
- Update rubygems and bundler
```bash
$ gem update --system
$ gem update bundler
```

- Install the latest gem release
```bash
gem uninstall -aIx appium_lib
gem install --no-rdoc --no-ri appium_lib
```

## [Sauce Labs env vars](https://github.com/appium/ruby_lib/blob/master/lib/appium_lib/sauce_labs.rb)

- `SAUCE_USERNAME` Sauce username
- `SAUCE_ACCESS_KEY` Sauce API key
- `SAUCE_ENDPOINT` Alternative Sauce Appium Server endpoint (only use if directed)

(Note: If these variables are set, all tests will use Sauce Labs unless over-ridden in configuration.)

# Documentation

- [Getting started](https://github.com/appium/appium/blob/master/docs/en/about-appium/getting-started.md)
- [Overview](https://github.com/appium/ruby_lib/blob/master/docs/docs.md)
- [Ruby Android methods](https://github.com/appium/ruby_lib/blob/master/docs/android_docs.md)
- [Ruby iOS methods](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md)
    - [Tips for XCUITest for iOS](https://github.com/appium/ruby_lib/blob/master/docs/ios_xcuitest.md)
- [Appium Server docs](https://github.com/appium/appium/tree/master/docs)

# Related libraries
- [ruby_lib_core](https://github.com/appium/ruby_lib_core): Bridged commands, WebDriver dependencies
    - We add new endpoints for Appium in the core library, and `ruby_lib` call the methods.
- [ruby_console](https://github.com/appium/ruby_console): Appium Ruby Console
- [appium_capybara](https://github.com/appium/appium_capybara): Gem enabling appium support in capybara

# Load Pry
`Pry.config.pager = false` is set if you have no `.pryrc` files and `Pry` is defined.


# Contribute
## How to add new commands for `driver`
- Add the new commands in [ruby_lib_core](https://github.com/appium/ruby_lib_core). [An example](https://github.com/appium/ruby_lib_core/commit/cdb02c29c8663d22d643b52fd65c8b2d1373bebb)

## How to add new helpful methods
- Add the new methods in this library
