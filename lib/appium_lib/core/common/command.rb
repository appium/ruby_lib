module Appium
  module Core
    # ref: https://github.com/appium/appium-base-driver/blob/master/lib/mjsonwp/routes.js
    module Commands
      COMMAND_NO_ARG = {
        shake:                      [:post, 'session/:session_id/appium/device/shake'.freeze],
        launch_app:                 [:post, 'session/:session_id/appium/app/launch'.freeze],
        close_app:                  [:post, 'session/:session_id/appium/app/close'.freeze],
        reset:                      [:post, 'session/:session_id/appium/app/reset'.freeze],
        device_locked?:             [:post, 'session/:session_id/appium/device/is_locked'.freeze],
        device_time:                [:get,  'session/:session_id/appium/device/system_time'.freeze],
        current_context:            [:get,  'session/:session_id/context'.freeze]
      }.freeze

      COMMAND_NO_ARG_ANDROID = {
          open_notifications:         [:post, 'session/:session_id/appium/device/open_notifications'.freeze],
          toggle_airplane_mode:       [:post, 'session/:session_id/appium/device/toggle_airplane_mode'.freeze],
          current_activity:           [:get,  'session/:session_id/appium/device/current_activity'.freeze],
          current_package:            [:get,  'session/:session_id/appium/device/current_package'.freeze],
          get_system_bars:            [:get,  'session/:session_id/appium/device/system_bars'.freeze],
          get_display_density:        [:get,  'session/:session_id/appium/device/display_density'.freeze],
          is_keyboard_shown:          [:get,  'session/:session_id/appium/device/is_keyboard_shown'.freeze],
          get_network_connection:     [:get,  'session/:session_id/network_connection'.freeze],
          get_performance_data_types: [:post, 'session/:session_id/appium/performanceData/types'.freeze]
      }.freeze

      COMMAND_NO_ARG_IOS = {
      }.freeze

      COMMAND = {
        # common
        available_contexts:         [:get,  'session/:session_id/contexts'.freeze],
        set_context:                [:post, 'session/:session_id/context'.freeze],
        app_strings:                [:post, 'session/:session_id/appium/app/strings'.freeze],
        lock:                       [:post, 'session/:session_id/appium/device/lock'.freeze],
        install_app:                [:post, 'session/:session_id/appium/device/install_app'.freeze],
        remove_app:                 [:post, 'session/:session_id/appium/device/remove_app'.freeze],
        app_installed?:             [:post, 'session/:session_id/appium/device/app_installed'.freeze],
        background_app:             [:post, 'session/:session_id/appium/app/background'.freeze],
        hide_keyboard:              [:post, 'session/:session_id/appium/device/hide_keyboard'.freeze],
        press_keycode:              [:post, 'session/:session_id/appium/device/press_keycode'.freeze],
        long_press_keycode:         [:post, 'session/:session_id/appium/device/long_press_keycode'.freeze],
        set_immediate_value:        [:post, 'session/:session_id/appium/element/:id/value'.freeze],
        push_file:                  [:post, 'session/:session_id/appium/device/push_file'.freeze],
        pull_file:                  [:post, 'session/:session_id/appium/device/pull_file'.freeze],
        pull_folder:                [:post, 'session/:session_id/appium/device/pull_folder'.freeze],
        get_settings:               [:get,  'session/:session_id/appium/settings'.freeze],
        update_settings:            [:post, 'session/:session_id/appium/settings'.freeze],
        touch_actions:              [:post, 'session/:session_id/touch/perform'.freeze],
        multi_touch:                [:post, 'session/:session_id/touch/multi/perform'.freeze]
      }.freeze

      COMMAND_ANDROID = {
          start_activity:             [:post, 'session/:session_id/appium/device/start_activity'.freeze],
          end_coverage:               [:post, 'session/:session_id/appium/app/end_test_coverage'.freeze],
          set_network_connection:     [:post, 'session/:session_id/network_connection'.freeze],
          get_performance_data:       [:post, 'session/:session_id/appium/getPerformanceData'.freeze]
      }.freeze

      COMMAND_IOS = {
          touch_id:                   [:post, 'session/:session_id/appium/simulator/touch_id'.freeze],
          toggle_touch_id_enrollment: [:post, 'session/:session_id/appium/simulator/toggle_touch_id_enrollment'.freeze]
      }.freeze

      COMMANDS = {}.merge(COMMAND).merge(COMMAND_ANDROID).merge(COMMAND_IOS)
                   .merge(COMMAND_NO_ARG).merge(COMMAND_NO_ARG_ANDROID).merge(COMMAND_NO_ARG_IOS).freeze

      COMMANDS_EXTEND_OSS = COMMANDS.merge(::Selenium::WebDriver::Remote::OSS::Bridge::COMMANDS).freeze
      COMMANDS_EXTEND_W3C = COMMANDS.merge(::Selenium::WebDriver::Remote::W3C::Bridge::COMMANDS).freeze
    end
  end
end
