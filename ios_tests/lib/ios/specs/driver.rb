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

  t 'load_appium_txt' do
    # skip this test if we're using Sauce
    # the storage API doesn't have an on disk file
    skip if sauce?
    appium_txt = File.expand_path(File.join(Dir.pwd, 'lib'))
    opts       = Appium.load_appium_txt file: appium_txt, verbose: true

    actual   = ''
    actual   = File.basename opts[:caps][:app] if opts && opts[:caps]
    expected = 'UICatalog.app'
    assert_equal expected, actual
  end

  describe 'Appium::Driver attributes' do
    t 'verify all attributes' do
      2.times { set_wait 30 } # must set twice to validate last_waits
      actual              = driver_attributes
      actual[:caps][:app] = File.basename actual[:caps][:app]
      expected            = { caps:             { platformName: 'ios',
                                                  platformVersion: '8.3',
                                                  deviceName:   'iPhone Simulator',
                                                  app:          'UICatalog.app' },
                              custom_url:       false,
                              export_session:   false,
                              default_wait:     30,
                              last_waits:       [30, 30],
                              sauce_username:   nil,
                              sauce_access_key: nil,
                              port:             4723,
                              device:           :ios,
                              debug:            true }

      if actual != expected
        diff    = HashDiff.diff expected, actual
        diff    = "diff (expected, actual):\n#{diff}"
        # example:
        # change :ios in expected to match 'ios' in actual
        # [["~", "caps.platformName", :ios, "ios"]]
        message = "\n\nactual:\n\n: #{actual.ai}expected:\n\n#{expected.ai}\n\n#{diff}"
        fail message
      end
    end

    t 'verify attributes are immutable' do
      driver_attributes[:caps][:app] = 'fake'
      actual                         = File.basename driver_attributes[:caps][:app]
      expected                       = 'UICatalog.app'
      actual.must_equal expected
    end

    t 'no_wait' do
      no_wait
      default_wait.must_equal 0
      set_wait 30
    end

    t 'default_wait attr' do
      set_wait 31 # set wait and no_wait update default_wait
      default_wait.must_equal 31
      set_wait 30
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

    t 'restart' do
      restart
      text 'buttons'
    end

    t 'driver' do
      driver.browser.must_equal :iOS
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
      set_wait.must_equal(2)

      set_wait(2).must_equal(2)
      set_wait(3).must_equal(3)
      set_wait.must_equal(2)
    end

    t 'default_wait' do
      set_wait 30
      default_wait.must_equal 30 # set in run.rb
    end

    # returns true unless an error is raised
    t 'exists' do
      exists(0, 0) { true }.must_equal true
      exists(0, 0) { fail 'error' }.must_equal false
    end

    # simple integration sanity test to check for unexpected exceptions
    t 'set_location' do
      set_location latitude: 55, longitude: -72, altitude: 33
    end

    # any script
    t 'execute_script' do
      execute_script %q(au.mainApp().getFirstWithPredicate("name contains[c] 'button'");)
    end

    # any elements
    t 'find_elements' do
      find_elements(:class, 'UIATableCell').length.must_equal 12
    end

    # any element
    t 'find_element' do
      find_element(:class, 'UIAStaticText').class.must_equal Selenium::WebDriver::Element
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
