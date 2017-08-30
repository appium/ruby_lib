module Appium
  class Android
    module Commands
      COMMAND_NO_ARG = {
          # Android
          open_notifications:         [:post, 'session/:session_id/appium/device/open_notifications'.freeze],
          toggle_airplane_mode:       [:post, 'session/:session_id/appium/device/toggle_airplane_mode'.freeze],
          current_activity:           [:get,  'session/:session_id/appium/device/current_activity'.freeze],
          current_package:            [:get,  'session/:session_id/appium/device/current_package'.freeze],
          get_system_bars:            [:get,  'session/:session_id/appium/device/system_bars'.freeze],
          get_display_density:        [:get,  'session/:session_id/appium/device/display_density'.freeze],
          is_keyboard_shown:          [:get,  'session/:session_id/appium/device/is_keyboard_shown'.freeze],
          get_network_connection:     [:get,  'session/:session_id/network_connection'.freeze],
          get_performance_data_types: [:post, 'session/:session_id/appium/performanceData/types'.freeze],
      }.freeze

      COMMAND = {
          # Android
          start_activity:             [:post, 'session/:session_id/appium/device/start_activity'.freeze],
          end_coverage:               [:post, 'session/:session_id/appium/app/end_test_coverage'.freeze],
          set_network_connection:     [:post, 'session/:session_id/network_connection'.freeze],
          get_performance_data:       [:post, 'session/:session_id/appium/getPerformanceData'.freeze],
      }.merge(COMMAND_NO_ARG).freeze
    end
  end
end
