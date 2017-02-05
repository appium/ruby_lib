module Appium
  class Driver
    module Commands
      COMMAND_NO_ARG = {
        # common
        shake:                  [:post, 'session/:session_id/appium/device/shake'.freeze],
        launch_app:             [:post, 'session/:session_id/appium/app/launch'.freeze],
        close_app:              [:post, 'session/:session_id/appium/app/close'.freeze],
        reset:                  [:post, 'session/:session_id/appium/app/reset'.freeze],
        device_locked?:         [:post, 'session/:session_id/appium/device/is_locked'.freeze],

        # Android
        open_notifications:     [:post, 'session/:session_id/appium/device/open_notifications'.freeze],
        toggle_airplane_mode:   [:post, 'session/:session_id/appium/device/toggle_airplane_mode'.freeze],
        current_activity:       [:get,  'session/:session_id/appium/device/current_activity'.freeze],
        get_network_connection: [:get,  'session/:session_id/network_connection'.freeze],
        get_performance_data_types: [:post, 'session/:session_id/appium/performanceData/types'.freeze],

        # iOS
        device_time:            [:get,  'session/:session_id/appium/device/system_time'.freeze],
        current_context:        [:get,  'session/:session_id/context'.freeze]
      }.freeze

      COMMAND = {
        # common
        available_contexts:     [:get,  'session/:session_id/contexts'.freeze],
        set_context:            [:post, 'session/:session_id/context'.freeze],
        app_strings:            [:post, 'session/:session_id/appium/app/strings'.freeze],
        lock:                   [:post, 'session/:session_id/appium/device/lock'.freeze],
        install_app:            [:post, 'session/:session_id/appium/device/install_app'.freeze],
        remove_app:             [:post, 'session/:session_id/appium/device/remove_app'.freeze],
        app_installed?:         [:post, 'session/:session_id/appium/device/app_installed'.freeze],
        background_app:         [:post, 'session/:session_id/appium/app/background'.freeze],
        hide_keyboard:          [:post, 'session/:session_id/appium/device/hide_keyboard'.freeze],
        press_keycode:          [:post, 'session/:session_id/appium/device/press_keycode'.freeze],
        long_press_keycode:     [:post, 'session/:session_id/appium/device/long_press_keycode'.freeze],
        set_immediate_value:    [:post, 'session/:session_id/appium/element/:id/value'.freeze],
        push_file:              [:post, 'session/:session_id/appium/device/push_file'.freeze],
        pull_file:              [:post, 'session/:session_id/appium/device/pull_file'.freeze],
        pull_folder:            [:post, 'session/:session_id/appium/device/pull_folder'.freeze],
        get_settings:           [:get,  'session/:session_id/appium/settings'.freeze],
        update_settings:        [:post, 'session/:session_id/appium/settings'.freeze],
        touch_actions:          [:post, 'session/:session_id/touch/perform'.freeze],
        multi_touch:            [:post, 'session/:session_id/touch/multi/perform'.freeze],

        # Android
        start_activity:         [:post, 'session/:session_id/appium/device/start_activity'.freeze],
        end_coverage:           [:post, 'session/:session_id/appium/app/end_test_coverage'.freeze],
        set_network_connection: [:post, 'session/:session_id/network_connection'.freeze],
        get_performance_data:   [:post, 'session/:session_id/appium/getPerformanceData'.freeze],

        # iOS
        touch_id:               [:post, 'session/:session_id/appium/simulator/touch_id'.freeze]
      }.merge(COMMAND_NO_ARG).merge(::Selenium::WebDriver::Remote::Bridge::COMMANDS).freeze
    end
  end
end
