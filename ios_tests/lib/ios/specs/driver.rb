# rake ios[driver]
describe 'driver' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  def sauce?
    ENV['UPLOAD_FILE'] && ENV['SAUCE_USERNAME']
  end

  t 'unicode defaults' do
    data = File.read File.expand_path '../../../../data/unicode.txt', __FILE__
    data.strip.must_equal 174.chr('UTF-8')
  end

  t 'load_settings' do
    # skip this test if we're using Sauce
    # the storage API doesn't have an on disk file
    skip if sauce?
    appium_txt = File.join(Dir.pwd, 'appium.txt')
    opts       = Appium.load_settings file: appium_txt, verbose: true

    actual   = ''
    actual   = File.basename opts[:caps][:app] if opts && opts[:caps]
    expected = 'UICatalog.app'
    assert_equal expected, actual
  end

  describe 'Appium::Driver attributes' do
    t 'verify all attributes' do
      actual                = driver_attributes
      caps_app_for_teardown = actual[:caps][:app]
      expected_app = File.absolute_path('../test_apps/UICatalog.app')

      expected            = { automation_name:  :xcuitest,
                              custom_url:       false,
                              export_session:   true,
                              export_session_path: '/tmp/appium_lib_session',
                              default_wait:     30,
                              sauce_username:   nil,
                              sauce_access_key: nil,
                              sauce_endpoint:   'ondemand.saucelabs.com:443/wd/hub',
                              port:             4723,
                              device:           :ios,
                              debug:            true,
                              listener:         nil,
                              wait_timeout:     20,  # defined in appium.txt
                              wait_interval:    1 }  # defined in appium.txt

      # actual[:caps].to_json send to Appium server
      caps_with_json = JSON.parse(actual[:caps].to_json)
      caps_with_json['platformName'].must_equal 'ios'
      caps_with_json['platformVersion'].must_equal '10.3'
      caps_with_json['app'].must_equal expected_app
      caps_with_json['automationName'].must_equal 'XCUITest'
      caps_with_json['deviceName'].must_equal 'iPhone Simulator'
      caps_with_json['someCapability'].must_equal 'some_capability'

      actual[:caps][:platformName].must_equal 'ios'
      actual[:caps][:platformVersion].must_equal '10.3'
      actual[:caps][:app].must_equal expected_app
      actual[:caps][:automationName].must_equal 'XCUITest'
      actual[:caps][:deviceName].must_equal 'iPhone Simulator'
      actual[:caps][:some_capability].must_equal 'some_capability'

      dup_actual = actual.dup
      dup_actual.delete(:caps)

      if dup_actual != expected
        diff    = HashDiff.diff expected, actual
        diff    = "diff (expected, actual):\n#{diff}"

        actual[:caps][:app] = caps_app_for_teardown
        # example:
        # change :ios in expected to match 'ios' in actual
        # [["~", "caps.platformName", :ios, "ios"]]
        message = "\n\nactual:\n\n: #{actual.ai}expected:\n\n#{expected.ai}\n\n#{diff}"
        raise message
      end

      actual_selenium_caps = actual[:caps][:automationName]
      actual_selenium_caps.must_equal 'XCUITest'
      actual[:caps][:app] = caps_app_for_teardown
    end

    t 'verify attributes are immutable' do
      driver_attributes[:custom_url] = true
      expected                       = false
      driver_attributes[:custom_url].must_equal expected
    end

    t 'verify attribute of :caps are not immutable becuse it depends on Selenium' do
      # immutability depends on Selenium
      for_clean_up                   = driver_attributes[:caps][:app].dup
      driver_attributes[:caps][:app] = 'fake'
      expected                       = 'fake'
      driver_attributes[:caps][:app].must_equal expected

      # clean up
      driver_attributes[:caps][:app] = for_clean_up
    end

    t 'no_wait' do
      no_wait
      proc { find_element(:accessibility_id, 'zz') }.must_raise Selenium::WebDriver::Error::NoSuchElementError
      set_wait
    end

    t 'app_path attr' do
      apk_name = File.basename driver_attributes[:caps][:app]

      if sauce?
        apk_name.must_equal 'sauce-storage:UICatalog6.1.app.zip'
      else
        apk_name.must_equal 'UICatalog.app'
      end
    end

    # Only used for Sauce Labs
    t 'app_name attr' do
      name_attr = driver_attributes[:caps][:name]
      if sauce?
        name_attr.must_equal 'appium_lib_ios'
      else
        name_attr.must_be_nil
      end
    end

    t 'sauce_username attr' do
      sauce_username = driver_attributes[:sauce_username]
      if sauce?
        sauce_username.must_equal 'appiumci'
      else
        sauce_username.must_be_nil
      end
    end

    t 'sauce_access_key attr' do
      sauce_access_key = driver_attributes[:sauce_access_key]
      if sauce?
        sauce_access_key.must_match(/\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/)
      else
        sauce_access_key.must_be_nil
      end
    end
  end

  describe 'Appium::Driver' do
    t '$driver.class' do
      $driver.class.must_equal Appium::Driver
    end
  end

  describe 'methods' do
    t 'status' do
      appium_server_version['build'].keys.sort.must_equal %w(revision version)
    end

    t 'server_version' do
      server_version = appium_server_version['build']['version']
      if sauce?
        server_version.must_match 'Sauce OnDemand'
      else
        server_version.must_match(/(\d+)\.(\d+).(\d+)/)
      end
    end

    t 'client_version' do
      client_version = appium_client_version
      expected = { version: ::Appium::VERSION }
      client_version.must_equal expected
    end

    t 'restart' do
      restart
      text 'buttons'
    end

    t 'driver' do
      driver.browser.must_be_empty
    end

    t 'automation_name_is_xcuitest?' do
      automation_name_is_xcuitest?.must_equal automation_name_is_xcuitest?
    end

    #
    # Skip:
    #    screenshot   # this is slow and already tested by Appium
    #    driver_quit  # tested by restart
    #    start_driver # tested by restart
    #

    t 'set_wait' do
      # fill the @last_waits array with: [30, 30]
      set_wait(30).must_equal(30)
      set_wait(30).must_equal(30)

      # verify set_wait with no args works correctly
      set_wait.must_equal(30)
      set_wait(30).must_equal(30)
      set_wait.must_equal(30)

      set_wait(2).must_equal(2)
      set_wait.must_equal(30)
      set_wait(3).must_equal(3)
      set_wait.must_equal(30)

      set_wait(2).must_equal(2)
      set_wait(3).must_equal(3)
      set_wait.must_equal(30)
    end

    t 'default_wait' do
      set_wait 30
      default_wait.must_equal 30 # set in run.rb
    end

    # returns true unless an error is raised
    t 'exists' do
      exists(0, 0) { true }.must_equal true
      exists(0, 0) { raise 'error' }.must_equal false
    end

    # simple integration sanity test to check for unexpected exceptions
    t 'set_location' do
      set_location latitude: 55, longitude: -72, altitude: 33
    end

    # any elements
    t 'find_elements' do
      find_elements(:class, ui_ios.table_cell).length.must_equal 12
    end

    # any element
    t 'find_element' do
      find_element(:class, ui_ios.static_text).class.must_equal Selenium::WebDriver::Element
    end

    # settings
    t 'get settings' do
      get_settings.wont_be_nil
    end

    t 'update settings' do
      update_settings cyberdelia: 'open'
      get_settings['cyberdelia'].must_equal 'open'
    end

    # Skip: x # x is only used in Pry
  end
end
