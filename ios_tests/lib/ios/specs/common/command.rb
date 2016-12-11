# rake ios[common/command]
describe 'common/command.rb' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'check all command no arg' do
    Selenium::WebDriver::Remote::Bridge.method_defined?(:shake).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:launch_app).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:close_app).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:reset).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:device_locked?).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:device_time).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:current_context).must_equal true
  end

  t 'check all command with arg' do
    Selenium::WebDriver::Remote::Bridge.method_defined?(:available_contexts).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:app_strings).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:lock).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:install_app).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:remove_app).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:app_installed?).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:background_app).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:start_activity).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:set_context).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:hide_keyboard).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:press_keycode).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:long_press_keycode).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:set_immediate_value).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:push_file).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:pull_file).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:pull_folder).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:touch_id).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:end_coverage).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:get_settings).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:update_settings).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:set_network_connection).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:touch_actions).must_equal true
    Selenium::WebDriver::Remote::Bridge.method_defined?(:multi_touch).must_equal true
  end
end
