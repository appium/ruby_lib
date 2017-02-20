# rubocop:disable Lint/RescueException

# rake android[driver]
describe 'driver' do
  def sauce?
    ENV['UPLOAD_FILE'] && ENV['SAUCE_USERNAME']
  end

  t 'load_settings' do
    appium_txt = File.join(Dir.pwd, 'appium.txt')
    parsed   = Appium.load_settings file: appium_txt, verbose: true
    apk_name = File.basename parsed[:caps][:app]
    assert_equal apk_name, 'api.apk'
  end

  describe 'Appium::Driver attributes' do
    t 'no_wait' do
      no_wait
      proc { button('zz') }.must_raise Selenium::WebDriver::Error::NoSuchElementError
      set_wait
    end

    # attr_reader :default_wait, :app_path, :app_name, :selendroid,
    #            :app_package, :app_activity, :app_wait_activity,
    #            :sauce_username, :sauce_access_key, :port, :os, :debug
    t 'default_wait attr' do
      set_wait 1
      default_wait.must_equal 1
      set_wait # restore default
    end

    t 'app_path attr' do
      apk_name = File.basename driver_attributes[:caps][:app]
      apk_name.must_equal 'api.apk'
    end

    t 'verify Appium::Driver::Capabilities.init_caps_for_appium' do
      expected_app = File.absolute_path('api.apk')
      caps = ::Appium::Driver::Capabilities.init_caps_for_appium(platformName: 'Android',
                                                                 app:          expected_app,
                                                                 appPackage:   'io.appium.android.apis',
                                                                 appActivity:  '.ApiDemos',
                                                                 deviceName:   'Nexus 7',
                                                                 some_capability: 'some_capability')
      caps_with_json = JSON.parse(caps.to_json)
      caps_with_json['platformName'].must_equal 'Android'
      caps_with_json['app'].must_equal expected_app
      caps_with_json['appPackage'].must_equal 'io.appium.android.apis'
      caps_with_json['appActivity'].must_equal '.ApiDemos'
      caps_with_json['deviceName'].must_equal 'Nexus 7'
      caps_with_json['someCapability'].must_equal 'some_capability'

      caps[:platformName].must_equal 'Android'
      caps[:app].must_equal expected_app
      caps[:appPackage].must_equal 'io.appium.android.apis'
      caps[:appActivity].must_equal '.ApiDemos'
      caps[:deviceName].must_equal 'Nexus 7'
      caps[:some_capability].must_equal 'some_capability'
    end

    t 'verify all attributes' do
      actual                = driver_attributes
      caps_app_for_teardown = actual[:caps][:app]
      expected_app = File.absolute_path('api.apk')

      expected            = { automation_name:   nil,
                              custom_url:       false,
                              export_session:   false,
                              default_wait:     1,
                              sauce_username:   nil,
                              sauce_access_key: nil,
                              sauce_endpoint:   'ondemand.saucelabs.com:443/wd/hub',
                              port:             4723,
                              device:           :android,
                              debug:            true,
                              listener:         nil,
                              wait_timeout:     30,    # default
                              wait_interval:    0.5 }  # default

      # actual[:caps].to_json send to Appium server
      caps_with_json = JSON.parse(actual[:caps].to_json)
      caps_with_json['platformName'].must_equal 'android'
      caps_with_json['app'].must_equal expected_app
      caps_with_json['appPackage'].must_equal 'io.appium.android.apis'
      caps_with_json['appActivity'].must_equal '.ApiDemos'
      caps_with_json['deviceName'].must_equal 'Nexus 7'
      caps_with_json['someCapability'].must_equal 'some_capability'

      actual[:caps][:platformName].must_equal 'android'
      actual[:caps][:app].must_equal expected_app
      actual[:caps][:appPackage].must_equal 'io.appium.android.apis'
      actual[:caps][:appActivity].must_equal '.ApiDemos'
      actual[:caps][:deviceName].must_equal 'Nexus 7'
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
    end

    t 'default timeout for http client' do
      http_client.open_timeout.must_equal 999_999
      http_client.read_timeout.must_equal 999_999
    end
  end

  describe 'Appium::Driver' do
    t '$driver.class' do
      $driver.class.must_equal Appium::Driver
    end

    t 'absolute_app_path' do
      def absolute_app_path(path)
        $driver.class.absolute_app_path(caps: { app: path })
      end

      def validate_path(path)
        absolute_app_path(path).must_equal path
      end

      validate_path 'sauce-storage:some_storage_suffix'
      validate_path 'http://www.saucelabs.com'

      # fake real paths for osx/windows.
      FakeFS.activate!

      osx_existing_path = '/Users/user/myapp.app'
      FileUtils.mkdir_p osx_existing_path
      validate_path osx_existing_path

      # TODO: FakeFS fails on Windows paths due to the drive letters.
      # Look into how opscode/chef tests this.
      # windows_existing_path = "C:\\Program Files\\myapp.apk"
      # FileUtils.mkdir_p windows_existing_path
      # validate_path windows_existing_path

      FakeFS.deactivate!

      # bundle id test
      validate_path 'my.bundle.id'

      # relative path test
      relative_path = File.join __FILE__, ('..' + File::SEPARATOR) * 4, 'api.apk'
      expected_path = File.expand_path relative_path

      absolute_app_path(relative_path).must_equal expected_path

      # invalid path test
      invalid_path_errors = false
      begin
        absolute_app_path('../../does_not_exist.apk')
      rescue Exception
        invalid_path_errors = true
      ensure
        invalid_path_errors.must_equal true
      end
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

    # Skip:
    #   ios_capabilities # save for iOS tests
    #   absolute_app_path # tested already by starting the driver for this test
    #   server_url # sauce labs only

    t 'set_immediate_value' do
      wait { find('app').click }
      wait { find('activity').click }
      wait { find('custom title').click }

      message = 'hello'

      wait do
        elem = textfield(1)
        elem.clear
        set_immediate_value(elem, message)
        elem.text.must_equal message
      end
    end

    t 'restart' do
      set_wait 1 # ensure wait is 1 before we restart.
      restart
      current_activity.must_equal '.ApiDemos'
    end

    t 'driver' do
      driver.browser.must_be_empty
    end

    # Skip:
    #   screenshot   # this is slow and already tested by Appium
    #   driver_quit  # tested by restart
    #   start_driver # tested by restart
    #   no_wait  # posts value to server, it's not stored locally
    #   set_wait # posts value to server, it's not stored locally
    #   execute_script # 'mobile: ' is deprecated and plain execute_script unsupported

    t 'default_wait' do
      set_wait 1
      default_wait.must_equal 1
    end

    # returns true unless an error is raised
    t 'exists' do
      exists(0, 0) { true }.must_equal true
      exists(0, 0) { raise 'error' }.must_equal false
    end

    # any elements
    t 'find_elements' do
      wait do
        find_elements(:class_name, 'android.widget.TextView').length.must_equal 13
      end
    end

    # any element
    t 'find_element' do
      wait do
        find_element(:class_name, 'android.widget.TextView').class.must_equal Selenium::WebDriver::Element
      end
    end

    # simple integration sanity test to check for unexpected exceptions
    t 'set_location' do
      begin
        set_location latitude: 55, longitude: -72, altitude: 33
      rescue Selenium::WebDriver::Error::UnknownError => e
        # on android this method is expected to raise with this message when running
        # on a regular device, or on genymotion.
        # error could be many messages, including:
        # ERROR running Appium command: port should be a number or string
        # ERROR running Appium command: port should be > 0 and < 65536
        raise unless e.message.include?('ERROR running Appium command: port should be')
      end
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
