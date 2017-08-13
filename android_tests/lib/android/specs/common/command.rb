# rake android[common/command]
describe 'common/command.rb' do
  def before_first
    wait { current_activity.must_equal '.ApiDemos' }
  end

  t 'before_first' do
    before_first
  end

  def parameterized_method_defined_check(array)
    array.each { |v| Selenium::WebDriver::Remote::OSS::Bridge.method_defined?(v).must_equal true }
    array.each { |v| Selenium::WebDriver::Remote::W3C::Bridge.method_defined?(v).must_equal true }
  end

  t 'check all command no arg' do
    parameterized_method_defined_check([:shake,
                                        :launch_app,
                                        :close_app,
                                        :reset,
                                        :device_locked?,
                                        :open_notifications,
                                        :toggle_airplane_mode,
                                        :current_activity,
                                        :current_package,
                                        :get_network_connection,
                                        :get_performance_data_types,
                                        :get_performance_data,
                                        :get_system_bars,
                                        :get_display_density,
                                        :is_keyboard_shown])
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
                                        :pull_folder,
                                        :end_coverage,
                                        :get_settings,
                                        :update_settings,
                                        :set_network_connection,
                                        :touch_actions,
                                        :multi_touch,
                                        :ime_available_engines,
                                        :ime_active_engine,
                                        :ime_activated,
                                        :ime_deactivate,
                                        :ime_activate])
  end
end
