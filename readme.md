#### appium_lib [![Gem Version](https://badge.fury.io/rb/appium_lib.png)](http://rubygems.org/gems/appium_lib)[![Dependency Status](https://gemnasium.com/appium/ruby_lib.png)](https://gemnasium.com/appium/ruby_lib)

- [appium_lib on RubyGems](https://rubygems.org/gems/appium_lib)
- [Documentation for appium_lib](https://github.com/appium/ruby_lib/tree/master/docs)
- [Appium Ruby Console](https://github.com/appium/ruby_console)

Helper methods for writing cross platform (iOS, Android) tests in Ruby using Appium. Note that user waits should not exceed 120 seconds if they're going to run on Sauce Labs.

Make sure you're using Ruby 1.9.3+ with upgraded rubygems and bundler.

#### Start appium server

`node server.js`

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
require 'rubygems'
require 'appium_lib'

# Start iOS driver
app = { device: :ios, app_path: '/path/to/MyiOS.app'}
Appium::Driver.new(app).start_driver

# Start Android driver
apk = { 
        device: :android,
        app_path: '/path/to/the.apk',
        app_package: 'com.example.pkg',
        app_activity: '.act.Start',
        app_wait_activity: '.act.Start'
      }
Appium::Driver.new(apk).start_driver

# Define the methods on all objects.
# Note that this can also be scoped to limit the potential for conflicts.
# Example: Appium.promote_appium_methods ::Minitest::Spec
# Another alternative is to not promote at all. Instead access methods via $driver
Appium.promote_appium_methods Object
```

```ruby
# Example of automating Settings preinstalled app on Android
# Find these values using arc then type current_app
apk = { 
        device: :android,
        app_path: '',
        app_package: 'com.android.settings',
        app_activity: '.Settings',
        app_wait_activity: '.Settings'
      }
Appium::Driver.new(apk).start_driver
```

#### iOS env vars

- `APP_PATH` Path to the .app folder

#### Android env vars

- `APP_PATH` Path to the apk
- `APP_PACKAGE` The APK's package
- `APP_ACTIVITY` Activity to start
- `APP_WAIT_ACTIVITY` Optional. Activity to wait for.

#### Sauce Labs env vars

- `APP_NAME` Name of the test run
- `SAUCE_USERNAME` Sauce username
- `SAUCE_ACCESS_KEY` Sauce API key

#### Troubleshooting

1. Does `adb kill-server; adb devices` list an active Android device?
2. Have you defined the proper env vars? `APP_PATH, APP_PACKAGE, APP_ACTIVITY, APP_WAIT_ACTIVITY`
3. Are you running appium from source? `node server.js`

#### Documentation

- [Installing Appium on OS X](https://github.com/appium/ruby_console/blob/master/osx.md)
- [Overview](https://github.com/appium/ruby_lib/blob/master/docs/docs.md) 
- [Android methods](https://github.com/appium/ruby_lib/blob/master/docs/android_docs.md)
- [iOS methods](https://github.com/appium/ruby_lib/blob/master/docs/ios_docs.md)
- [Appium docs](https://github.com/appium/appium/tree/master/docs)
- [Ruby iOS tests](https://github.com/appium/ruby_lib_ios)
- [Ruby Android tests](https://github.com/appium/ruby_lib_android)
