#### appium_lib [![Dependency Status](https://gemnasium.com/appium/ruby_lib.png)](https://gemnasium.com/appium/ruby_lib)

- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](http://www.rubydoc.info/github/appium/ruby_lib/master/frames)
- [Appium Ruby Console](https://github.com/appium/ruby_console)

Helper methods for writing cross platform (iPad, iPhone, Android) tests in Ruby using Appium.

Make sure you're using Ruby 1.9.3+ with upgraded rubygems and bundler.

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

#### Simple Usage

```ruby
require 'appium_lib'

# Start a driver based on APP_PATH
Appium::Driver.new.start_driver

# Start an Android driver
# must quit old driver before starting a new one
driver_quit
apk = { 'APP_PATH' => ENV['APP_APK'] }
Appium::Driver.new(apk).start_driver
```

#### Documentation

See [docs.md](https://github.com/appium/ruby_lib/blob/master/docs.md)
