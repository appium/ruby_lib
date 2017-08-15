require 'thread'
require_relative '../../lib/appium_lib'

def device1
  {
      automationName: "xcuitest",
      platformName: "ios",
      platformVersion: "11.0",
      deviceName: "iPhone 6",
      app: "#{Dir.pwd}/../../test_apps/UICatalog.app",
      wdaLocalPort: 8100
  }
end

def device2
  {
      automationName: "xcuitest",
      platformName: "ios",
      platformVersion: "11.0",
      deviceName: "iPhone 6s",
      app: "#{Dir.pwd}/../../test_apps/UICatalog.app",
      wdaLocalPort: 8200
  }
end

def des_server_caps
  {
      debug: true,
      server_url: "#{ENV['appium_server'] ||= 'http://127.0.0.1:4723'}/wd/hub",
      wait: 25,
      wait_timeout: 20,
      wait_interval: 0.3
  }
end

def test(number)
  caps = case number
         when 1
           { caps: device1, appium_lib: des_server_caps }
         when 2
           { caps: device2, appium_lib: des_server_caps }
         end

  appium = Appium::Driver.new(caps, false)
  driver = appium.start_driver
  e = driver.find_element :name, "Buttons"
  e.click

  sleep 20
  appium.driver_quit
end
