##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/4b2a0979c34273aa6634e339039d5ee0438e130e/lib/appium_lib/driver.rb#L72) 

> def self.load_appium_txt opts={}

Load appium.txt (toml format)
the basedir of this file + appium.txt is what's used

```
[caps]
app = "path/to/app"

[appium_lib]
port = 8080
```

:app is expanded
:require is expanded
all keys are converted to symbols

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Hash] opts - file: '/path/to/appium.txt', verbose: true

__Returns:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[hash] the symbolized hash with updated :app and :require keys

--

##### [symbolize_keys](https://github.com/appium/ruby_lib/blob/4b2a0979c34273aa6634e339039d5ee0438e130e/lib/appium_lib/driver.rb#L142) 

> def self.symbolize_keys hash

convert all keys (including nested) to symbols

based on deep_symbolize_keys & deep_transform_keys from rails
https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84

--

##### [promote_singleton_appium_methods](https://github.com/appium/ruby_lib/blob/4b2a0979c34273aa6634e339039d5ee0438e130e/lib/appium_lib/driver.rb#L155) 

> def self.promote_singleton_appium_methods modules

if modules is a module instead of an array, then the constants of
that module are promoted on.
otherwise, the array of modules will be used as the promotion target.

--

##### [promote_appium_methods](https://github.com/appium/ruby_lib/blob/4b2a0979c34273aa6634e339039d5ee0438e130e/lib/appium_lib/driver.rb#L195) 

> def self.promote_appium_methods class_array

Promote appium methods to class instance methods

To promote methods to all classes:

```ruby
Appium.promote_appium_methods Object
```

__Parameters:__

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Array<Class>] class_array - An array of classes

--

##### [global_webdriver_http_sleep](https://github.com/appium/ruby_lib/blob/4b2a0979c34273aa6634e339039d5ee0438e130e/lib/appium_lib/driver.rb#L228) 

> def global_webdriver_http_sleep

Returns the value of attribute global_webdriver_http_sleep

--

