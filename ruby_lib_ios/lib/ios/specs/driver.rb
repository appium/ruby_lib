# encoding: utf-8
# rake ios[driver]
describe 'driver' do
  before_first { screen.must_equal catalog }

  def is_sauce
    ENV['UPLOAD_FILE'] && ENV['SAUCE_USERNAME']
  end

  t 'load_appium_txt' do
    # skip this test if we're using Sauce
    # the storage API doesn't have an on disk file
    skip if is_sauce
    # __FILE__ is '(eval)' so use env var set by the Rakefile
    path = ENV['APPIUM_TXT']
    puts "appium.txt path in test is: #{path}"
    load_appium_txt file: path, verbose: true
    apk_name = File.basename(ENV['APP_PATH'])
    assert_equal apk_name, 'UICatalog.app'
  end

  describe 'Appium::Driver attributes' do
    # attr_reader :default_wait, :app_path, :app_name, :selendroid,
    #            :app_package, :app_activity, :app_wait_activity,
    #            :sauce_username, :sauce_access_key, :port, :os, :debug
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
      apk_name = File.basename app_path

      if is_sauce
        apk_name.must_equal 'sauce-storage:UICatalog6.1.app.zip'
      else
        apk_name.must_equal 'UICatalog.app'
      end
    end

    # Only used for Sauce Labs
    t 'app_name attr' do
      if is_sauce
        app_name.must_equal 'appium_lib_ios'
      else
        app_name.must_be_nil
      end
    end

    t 'device attr' do
      device.must_equal 'ios'
    end

    # t 'app_package attr' do # iOS does not have this attr
    # t 'app_activity attr' do # iOS does not have this attr
    # t 'app_wait_activity attr' do # iOS does not have this attr

    t 'sauce_username attr' do
      if is_sauce
        sauce_username.must_equal 'appiumci'
      else
        sauce_username.must_be_nil
      end
    end

    t 'sauce_access_key attr' do
      if is_sauce
        sauce_access_key.must_match /\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/
      else
        sauce_access_key.must_be_nil
      end
    end

    t 'port attr' do
      port.must_equal 4723
    end

    t 'debug attr' do
      debug.must_equal true
    end
  end

  describe 'Appium::Driver' do
    t '@@loaded' do
      loaded = $driver.class.class_variable_get :@@loaded
      loaded.must_equal true
    end

    t '$driver.class' do
      $driver.class.must_equal Appium::Driver
    end
  end

  describe 'methods' do
    t 'status' do
      status.keys.sort.must_equal %w(sessionId status value)
    end

    t 'server_version' do
      if is_sauce
        server_version.must_match 'Sauce OnDemand'
      else
        server_version.must_match /(\d+)\.(\d+).(\d+)/
      end
    end

    def expected_ios_capabilities
      {
          :platform             => 'OS X 10.9',
          :platformName         => 'ios',
          :name                 => 'Ruby Console iOS Appium',
          :'device-orientation' => 'portrait',
          :app                  => 'UICatalog.app'
      }
    end

    def expected_ios_capabilities_sauce
      {
          platform: 'Mac 10.8',
          version: '6.1',
          device: 'iPhone Simulator',
          name: 'appium_lib_ios',
          app: 'sauce-storage:UICatalog6.1.app.zip'
      }
    end

    # capabilities calls ios_capabilities when device is :ios
    t 'capabilities' do
      exp = is_sauce ? expected_ios_capabilities_sauce :
      expected_ios_capabilities

      act = capabilities
      act[:app] = File.basename act[:app]
      act.must_equal exp
    end

=begin
  Skip:
    ios_capabilities # save for iOS tests
    absolute_app_path # tested already by starting the driver for this test
    server_url # sauce labs only
=end
    t 'restart' do
      restart
      s_text 'buttons'
    end

    t 'driver' do
      driver.browser.must_equal :iOS
    end

=begin
  Skip:
    screenshot   # this is slow and already tested by Appium
    driver_quit  # tested by restart
    start_driver # tested by restart
=end
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
      exists(0, 0) { raise 'error' }.must_equal false
    end

    # any script
    t 'execute_script' do
      execute_script %q(au.mainApp().getFirstWithPredicate("name contains[c] 'button'");)
    end

    # any mobile method
    t 'mobile' do
      mobile(:getCommandTimeout).must_equal 9999
    end

    # any elements
    t 'find_elements' do
      find_elements(:tag_name, :text).length.must_equal 13
    end

    # any element
    t 'find_element' do
      find_element(:tag_name, :text).class.must_equal Selenium::WebDriver::Element
    end

    # Skip: x # x is only used in Pry
  end
end