[![Downloads](https://img.shields.io/gem/dt/appium_lib.svg)](https://rubygems.org/gems/appium_lib)
[![Pull Requests](http://issuestats.com/github/appium/ruby_lib/badge/pr)](http://issuestats.com/github/appium/ruby_lib)
[![Issues](http://issuestats.com/github/appium/ruby_lib/badge/issue)](http://issuestats.com/github/appium/ruby_lib)
#### appium_lib [![Gem Version](https://badge.fury.io/rb/appium_lib.svg)](http://badge.fury.io/rb/appium_lib)[![Dependency Status](https://gemnasium.com/appium/ruby_lib.svg)](https://gemnasium.com/appium/ruby_lib) [![Travis Master](https://travis-ci.org/appium/ruby_lib.svg?branch=master)](https://travis-ci.org/appium/ruby_lib/builds)



- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](https://github.com/appium/ruby_lib/tree/master/docs)
- [Appium Ruby Console](https://github.com/appium/ruby_console)
- [Bootcamp quick start guide](http://sauceio.com/index.php/tag/appium-bootcamp/) & [Bootcamp example source](https://github.com/tourdedave/appium-getting-started-code-exampes)
- [Mobile automation walkthrough with Ruby and Sauce](http://stackshare.io/sauce-labs/mobile-automation-with-appium-and-sauce-labs) & [code examples](https://github.com/jlipps/appium-ruby-example)

Helper methods for writing cross platform (iOS, Android) tests in Ruby using Appium. Note that user waits should not exceed 120 seconds if they're going to run on Sauce Labs.

Make sure you're using Appium 1.0.0 or newer and Ruby 1.9.3+ with upgraded rubygems and bundler.

#### Start appium server

`node .`

#### Install / Upgrade

Update rubygems and bundler.

```ruby
gem update --system ;\
gem update bundler
```

Install the latest gem release.

```ruby
gem uninstall -aIx appium_lib ;\
gem install --no-rdoc --no-ri appium_lib
```

#### Sauce Labs env vars

- `SAUCE_USERNAME` Sauce username
- `SAUCE_ACCESS_KEY` Sauce API key

#### Troubleshooting

1. Does `adb kill-server; adb devices` list an active Android device?
3. Are you running appium from source? `node .`

#### Documentation

- [Installing Appium on OS X](https://github.com/appium/ruby_console/blob/master/osx.md)
- [Overview](https://github.com/appium/ruby_lib/blob/master/docs/docs.md) 
- [Ruby Android methods](https://github.com/appium/ruby_lib/blob/master/docs/android_docs.md)
- [Ruby iOS methods](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md)
- [Appium Server docs](https://github.com/appium/appium/tree/master/docs)

#### Logging

[Log level](https://github.com/appium/ruby_lib/blob/1673a694121d2ae24ffd1530eb71b7015d44dc52/lib/appium_lib/logger.rb) can be adjusted. The default level is `Logger::WARN`

```ruby
Appium::Logger.level = Logger::INFO
```
