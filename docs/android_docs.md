##### [load_settings](https://github.com/appium/ruby_lib/blob/4535ec91f435255ae31b4c4fea9d96e5405d79f5/lib/appium_lib/driver.rb#L69) 

> def self.load_settings(opts = {})

Load appium.txt (toml format)

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

##### [load_appium_txt](https://github.com/appium/ruby_lib/blob/4535ec91f435255ae31b4c4fea9d96e5405d79f5/lib/appium_lib/driver.rb#L102) 

> def self.load_settings(opts = {})

Load appium.txt (toml format)

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

