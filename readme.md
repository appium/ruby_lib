#### appium_lib [![Dependency Status](https://gemnasium.com/appium/ruby_lib.png)](https://gemnasium.com/appium/ruby_lib)

- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](http://www.rubydoc.info/github/appium/ruby_lib/master/frames)

Helper methods for writing cross platform (iPad, iPhone, Android) tests in Ruby using Appium.
There's also an [Appium Ruby Console](https://github.com/appium/ruby_console) which uses this lib.

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

#### Run from Source

`pry -r ./lib/appium_lib.rb`

Then `start_driver`
