# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# rake "android[driver]"
class AndroidTest
  class Driver < Minitest::Test
    def sauce?
      ENV.fetch('UPLOAD_FILE', nil) && ENV.fetch('SAUCE_USERNAME', nil)
    end

    def test_01_load_settings
      appium_txt = File.join(Dir.pwd, 'appium.txt')
      parsed   = Appium.load_settings file: appium_txt, verbose: true
      apk_name = File.basename parsed[:caps][:app]
      assert_equal apk_name, 'api.apk'
    end

    def test_02_attributes_no_wait
      no_wait
      assert_raises Selenium::WebDriver::Error::NoSuchElementError do
        button('zz')
      end
      set_wait
    end

    # attr_reader :default_wait, :app_path, :app_name,
    #            :app_package, :app_activity, :app_wait_activity,
    #            :sauce_username, :sauce_access_key, :port, :os, :debug
    def test_03_attributes_default_wait_attr
      set_wait 1
      assert_equal default_wait, 1
      set_wait # restore default
    end

    def test_04_attributes_app_path_attr
      apk_name = File.basename driver_attributes[:caps][:app]
      assert_equal apk_name, 'api.apk'
    end

    def test_05_attributes_verify_all_attributes
      actual = driver_attributes
      expected_app = File.absolute_path('../test_apps/api.apk')

      expected = {
        automation_name:     :uiautomator2,
        custom_url:          'http://127.0.0.1:4723/wd/hub',
        default_wait:        1,
        sauce_username:      nil,
        sauce_access_key:    nil,
        sauce_endpoint:      'ondemand.saucelabs.com:443/wd/hub',
        port:                4723,
        device:              :android,
        debug:               true,
        listener:            nil,
        wait_timeout:        30, # default
        wait_interval:       0.5 # default
      }

      # actual[:caps].to_json send to Appium server
      caps_with_json = JSON.parse(actual[:caps].to_json)
      assert_equal caps_with_json['platformName'], 'android'
      assert_equal caps_with_json['app'], expected_app
      assert_equal caps_with_json['appPackage'], 'io.appium.android.apis'
      assert_equal caps_with_json['appActivity'], 'io.appium.android.apis.ApiDemos'
      assert_equal caps_with_json['deviceName'], 'Android emulator'
      assert_equal caps_with_json['someCapability'], 'some_capability'

      assert_equal actual[:caps][:platformName], 'android'
      assert_equal actual[:caps][:app], expected_app
      assert_equal actual[:caps][:appPackage], 'io.appium.android.apis'
      assert_equal actual[:caps][:appActivity], 'io.appium.android.apis.ApiDemos'
      assert !actual[:caps][:deviceName].nil?
      assert_equal actual[:caps][:some_capability], 'some_capability'

      dup_actual = actual.dup
      dup_actual.delete(:caps)

      raise "\n\nactual:\n\n: #{dup_actual}expected:\n\n#{expected}" if dup_actual != expected
    end

    def test_06_driver_class
      assert_equal $driver.class, Appium::Driver
    end

    def absolute_app_path(path)
      $driver.class.absolute_app_path(caps: { app: path })
    end

    def validate_path(path)
      assert_equal absolute_app_path(path), path
    end

    def test_07_absolute_app_path
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

      relative_path = File.join __FILE__, ('..' + File::SEPARATOR) * 5, 'test_apps/api.apk'
      expected_path = File.expand_path relative_path

      assert_equal absolute_app_path(relative_path), expected_path

      # invalid path test
      assert_equal absolute_app_path('../../does_not_exist.apk'), '../../does_not_exist.apk'
    end

    def test_08_methods_status
      appium_server_version['build'].keys.sort.include? 'version'
    end

    def test_09_methods_server_version
      server_version = appium_server_version['build']['version']
      if sauce?
        assert_match 'Sauce OnDemand', server_version
      else
        assert_match(/(\d+)\.(\d+).(\d+)/, server_version)
      end
    end

    def test_10_methods_client_version
      client_version = appium_client_version
      expected = { version: ::Appium::VERSION }
      assert_equal client_version, expected
    end

    def test_11_methods_restart
      set_wait 1 # ensure wait is 1 before we restart.
      restart
      assert_equal current_activity, '.ApiDemos'
    end

    def test_12_methods_driver
      assert_equal driver.browser, 'unknown'
    end

    # Skip:
    #   screenshot   # this is slow and already tested by Appium
    #   driver_quit  # tested by restart
    #   start_driver # tested by restart
    #   no_wait  # posts value to server, it's not stored locally
    #   set_wait # posts value to server, it's not stored locally
    #   execute_script # 'mobile: ' is deprecated and plain execute_script unsupported

    def test_13_methods_default_wait
      set_wait 1
      assert_equal default_wait, 1
    end

    # returns true unless an error is raised
    def test_14_methods_exists
      assert_equal exists(0, 0) { true }, true
      assert_equal exists(0, 0) { raise 'error' }, false
    end

    # any elements
    def test_15_methods_find_elements
      wait do
        assert_equal find_elements(:class_name, 'android.widget.TextView').length, 13
      end
    end

    # any element
    def test_16_methods_find_element
      wait do
        assert_equal find_element(:class_name, 'android.widget.TextView').class, ::Appium::Core::Element
      end
    end

    # simple integration sanity test to check for unexpected exceptions
    def test_17_methods_set_location
      set_location latitude: 55, longitude: -72, altitude: 33
    rescue Selenium::WebDriver::Error::UnknownError => e
      # on android this method is expected to raise with this message when running
      # on a regular device, or on genymotion.
      # error could be many messages, including:
      # ERROR running Appium command: port should be a number or string
      # ERROR running Appium command: port should be > 0 and < 65536
      raise unless e.message.include?('ERROR running Appium command: port should be')
    end

    # settings
    def test_18_methods_get_settings
      assert !get_settings.nil?
    end

    def test_19_methods_update_settings
      update_settings allowInvisibleElements: true
      assert_equal get_settings['allowInvisibleElements'], true
    end

    # Skip: x # x is only used in Pry
  end
end
