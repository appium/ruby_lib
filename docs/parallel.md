# Using drivers without a global reference

`Appium::Driver.new(opts)` uses a non-global driver by default. You can also
select this explicitly with `Appium::Driver.new(opts, false)` or
`Appium::Driver.new(opts.merge(global_driver: false))`. An explicit second
argument takes precedence over the hash option; `nil` uses the hash option.
The constructor does not remove the option from the caller's hash.

Keep the ruby_lib wrapper to use its helpers. `start_driver` returns the
underlying core driver, not the wrapper:

```ruby
appium = Appium::Driver.new(opts, false)
begin
  appium.start_driver
  appium.find_element(:id, 'target').click
ensure
  appium.driver_quit
end
```

Each wrapper starts, restarts, and quits only its own session. Non-global
wrappers can coexist with a legacy `$driver`; their page inspection and
coordinate helpers use their own driver. App strings are cached per session
and are loaded again after a restart.

For multiple devices, keep one wrapper per device and configure distinct
server-side device identifiers and ports where required by the Appium driver.
Do not concurrently operate on the same wrapper from multiple threads.

For Page Objects, hold the driver on each instance:

```ruby
class LoginPage
  def initialize(appium)
    @appium = appium
  end

  def submit
    @appium.find_element(:id, 'submit').click
  end
end

first_page = LoginPage.new(first_driver)
second_page = LoginPage.new(second_driver)
```

`Appium.promote_appium_methods(MyTests, appium)` and
`Appium.promote_singleton_appium_methods([MyPageModule], appium)` also work
without `$driver`. Promotion binds a whole class or module to a driver, not
individual Page Object instances. Re-promoting a class changes the driver for
all its instances. Use distinct targets or instance-held drivers for concurrent
sessions. Omitting the driver argument still uses `$driver` for compatibility.

## Legacy global mode

`Appium::Driver.new(opts, true)` continues to register `$driver` and close the
previous global session when replacing it. Existing implicit promotion calls
remain available in this mode. Starting a non-global wrapper no longer closes
the global session, and restarting any wrapper only replaces its own session.

## Existing parallel examples

Appium 1.7.0+ supports single server and multiple sessions, and it requires Xcode 9 for iOS.

# Example
## Run tests on Multiple Simulators with Xcode 9
- https://github.com/appium/appium-xcuitest-driver/tree/master/test/functional/parallel
- https://github.com/appium/ruby_lib/tree/master/ios_tests/parallel
    - Thread programming: TestParallelRunThread
    - Process programming: TestParallelRunProcess
