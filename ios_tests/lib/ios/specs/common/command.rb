# rake ios[common/command]
describe 'common/command.rb' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  def parameterized_method_defined_check(array)
    array.each { |v| Selenium::WebDriver::Remote::OSS::Bridge.method_defined?(v).must_equal true }
  end

  t 'check all command no arg' do
    parameterized_method_defined_check([:shake,
                                        :launch_app,
                                        :close_app,
                                        :reset,
                                        :device_locked?,
                                        :device_time,
                                        :current_context])
  end

  t 'check all command with arg' do
    parameterized_method_defined_check([:available_contexts,
                                        :app_strings,
                                        :lock,
                                        :install_app,
                                        :remove_app,
                                        :app_installed?,
                                        :background_app,
                                        :start_activity,
                                        :set_context,
                                        :hide_keyboard,
                                        :press_keycode,
                                        :long_press_keycode,
                                        :set_immediate_value,
                                        :push_file,
                                        :pull_file,
                                        :touch_id,
                                        :toggle_touch_id_enrollment,
                                        :get_settings,
                                        :update_settings,
                                        :touch_actions,
                                        :multi_touch])
  end
end
