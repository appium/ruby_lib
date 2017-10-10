require_relative '../../lib/appium_lib'
require 'thread'

def device1
  {
      automationName: 'xcuitest',
      platformName: 'ios',
      platformVersion: '11.0',
      deviceName: 'iPhone 6',
      app: "#{Dir.pwd}/../test_apps/UICatalog.app",
      wdaLocalPort: 8100,
      isCommandsQueueEnabled: false
  }
end

def device2
  {
      automationName: 'xcuitest',
      platformName: 'ios',
      platformVersion: '11.0',
      deviceName: 'iPhone 6s',
      app: "#{Dir.pwd}/../test_apps/UICatalog.app",
      wdaLocalPort: 8200,
      isCommandsQueueEnabled: false
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

class TestParallelRun
  def initialize(capability)
    @capability = capability
  end

  def setup
    @appium = Appium::Driver.new({ caps: @capability, appium_lib: des_server_caps }, false)
    @driver = @appium.start_driver
  end

  def teardown
    @appium.quit_driver
    puts "finish: #{@capability}"
  end

  def test_run
    setup

    # tap alert
    @driver.find_element(:name, 'Alerts').click
    @appium.wait_true do
      @driver.find_element(:name, 'Show OK-Cancel').click
      @driver.find_element(:name, 'UIActionSheet <title>').displayed?
    end
    @appium.alert action: 'accept'
    @appium.back

    sleep 5

    # TouchAction
    text_elem = @appium.text(@appium.app_strings['ButtonsExplain'])
    @appium.tap x: 0, y: 0, element: text_elem
    @appium.back

    teardown
  end

  def self.run
    threads = []
    [device1, device2].each do |capability|
      threads << Thread.new do
        # RSpec::Core::RakeTask.new(:spec)
        TestParallelRun.new(capability).test_run
      end
    end

    threads.each(&:join)
  end
end
