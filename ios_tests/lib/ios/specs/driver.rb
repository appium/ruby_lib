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

# bundle exec rake "ios[driver]"
class IosTest
  class Driver < Minitest::Test
    def test_01_before_first
      driver.terminate_app target_bundle_id
      driver.activate_app target_bundle_id
      assert_equal screen, catalog
    end

    def test_02_unicode_defaults
      data = File.read File.expand_path('../../../data/unicode.txt', __dir__)
      assert_equal data.strip, 174.chr('UTF-8')
    end

    def test_03_load_settings
      appium_txt = File.join(Dir.pwd, 'appium.txt')
      opts       = Appium.load_settings file: appium_txt, verbose: true

      actual   = ''
      actual   = File.basename opts[:caps][:app] if opts && opts[:caps]
      expected = 'UICatalog.app.zip'
      assert_equal expected, actual
    end

    def test_04_verify_all_attributes
      actual                = driver_attributes
      caps_app_for_teardown = actual[:caps][:app]
      expected_app = File.absolute_path('../test_apps/UICatalog.app.zip')

      # actual[:caps].to_json send to Appium server
      caps_with_json = JSON.parse(actual[:caps].to_json)
      assert_equal caps_with_json['platformName'], 'ios'
      assert !caps_with_json['platformVersion'].nil?
      assert_equal caps_with_json['app'], expected_app
      assert_equal caps_with_json['automationName'], 'XCUITest'
      assert !caps_with_json['deviceName'].nil?
      assert_equal caps_with_json['someCapability'], 'some_capability'

      assert_equal actual[:caps][:platformName], 'ios'
      assert !actual[:caps][:platformVersion].nil?
      assert_equal actual[:caps][:app], expected_app
      assert_equal actual[:caps][:automationName], 'XCUITest'
      assert !actual[:caps][:deviceName].nil?
      assert_equal actual[:caps][:someCapability], 'some_capability'

      actual_selenium_caps = actual[:caps][:automationName]
      assert_equal actual_selenium_caps, 'XCUITest'
      actual[:caps][:app] = caps_app_for_teardown
    end

    def test_05_verify_attributes_are_immutable
      assert_equal driver_attributes[:custom_url], 'http://127.0.0.1:4723'
      driver_attributes[:custom_url] = true
      assert_equal driver_attributes[:custom_url], 'http://127.0.0.1:4723'
    end

    def test_06_verify_attribute_of_caps_are_not_immutable_because_it_depends_on_selenium
      # immutability depends on Selenium
      for_clean_up                   = driver_attributes[:caps][:app].dup
      driver_attributes[:caps][:app] = 'fake'
      expected                       = 'fake'
      assert_equal driver_attributes[:caps][:app], expected

      # clean up
      driver_attributes[:caps][:app] = for_clean_up
    end

    def test_07_no_wait
      no_wait
      assert_raises Selenium::WebDriver::Error::NoSuchElementError do
        find_element(:accessibility_id, 'zz')
      end
      set_wait
    end

    def test_08_app_path_attr
      apk_name = File.basename driver_attributes[:caps][:app]
      assert_equal apk_name, 'UICatalog.app.zip'
    end

    def test_09_driver_class
      assert_equal $driver.class, Appium::Driver
    end

    def test_10_status
      assert appium_server_version['build'].keys.member?('version')
    end

    def test_11_server_version
      server_version = appium_server_version['build']['version']
      assert_match(/(\d+)\.(\d+).(\d+)/, server_version)
    end

    def test_12_client_version
      client_version = appium_client_version
      expected = { version: ::Appium::VERSION }
      assert_equal client_version, expected
    end

    def test_13_restart
      restart
      text 'buttons'
    end

    def test_14_driver
      assert driver.browser.empty?
    end

    def test_15_automation_name_is_xcuitest?
      assert_equal automation_name_is_xcuitest?, true
    end

    #
    # Skip:
    #    screenshot   # this is slow and already tested by Appium
    #    driver_quit  # tested by restart
    #    start_driver # tested by restart
    #

    def test_16_set_wait
      # fill the @last_waits array with: [30, 30]
      assert_equal set_wait(30), 30
      assert_equal set_wait(30), 30

      # verify set_wait with no args works correctly
      assert_equal set_wait, 30
      assert_equal set_wait(30), 30
      assert_equal set_wait, 30

      assert_equal set_wait(2), 2
      assert_equal set_wait, 30
      assert_equal set_wait(3), 3
      assert_equal set_wait, 30

      assert_equal set_wait(2), 2
      assert_equal set_wait(3), 3
      assert_equal set_wait, 30
    end

    def test_17_default_wait
      set_wait 30
      assert_equal default_wait, 30 # set in run.rb
    end

    # returns true unless an error is raised
    def test_18_exists
      assert_equal exists(0, 0) { true }, true
      assert_equal exists(0, 0) { raise 'error' }, false
    end

    # simple integration sanity test to check for unexpected exceptions
    def test_19_set_location
      set_location latitude: 55, longitude: -72, altitude: 33
    end

    # any elements
    def test_20_find_elements
      assert_equal find_elements(:class, ui_ios.table_cell).length, 18
    end

    # any element
    def test_21_find_element
      assert_equal find_element(:class, ui_ios.static_text).class, ::Appium::Core::Element
    end

    # settings
    def test_22_get_settings
      assert !get_settings.nil?
    end

    def test_23_update_settings
      update_settings allowInvisibleElements: true
      assert_equal get_settings['allowInvisibleElements'], true
    end

    def test_24_events
      log_event vendor: 'appium', event: 'funEvent'
      log_events
    end

    def test_25_device_is_ios
      assert_equal device_is_ios?, true
    end
  end
end
