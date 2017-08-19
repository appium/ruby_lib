require_relative '../../lib/appium_lib'

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
    @appium.start_driver

    Appium.promote_appium_methods [self.class], @appium
  end

  def teardown
    quit_driver
    puts "finish: #{@capability}"
  end

  def test_run
    setup

    # tap alert
    find_element(:name, 'Alerts').click
    wait_true do
      find_element(:name, 'Show OK-Cancel').click
      find_element(:name, 'UIActionSheet <title>').displayed?
    end
    alert action: 'accept'
    back

    sleep 5

    # TouchAction
    text_elem = text(app_strings['ButtonsExplain'])
    tap x: 0, y: 0, element: text_elem
    back

    teardown
  end
end
