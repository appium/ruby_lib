module Appium
  module Core
    module Commands
      COMMAND_NO_ARG = {
        # core
        shake:                      [:post, 'session/:session_id/appium/device/shake'.freeze],
        launch_app:                 [:post, 'session/:session_id/appium/app/launch'.freeze],
        close_app:                  [:post, 'session/:session_id/appium/app/close'.freeze],
        reset:                      [:post, 'session/:session_id/appium/app/reset'.freeze],
        device_locked?:             [:post, 'session/:session_id/appium/device/is_locked'.freeze],
        current_context:            [:get,  'session/:session_id/context'.freeze]
      }.freeze

      COMMAND = {
        # core
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
        multi_touch:                [:post, 'session/:session_id/touch/multi/perform'.freeze],
      }.merge(COMMAND_NO_ARG).freeze

      # TODO: Be able to remove?
      COMMANDS_EXTEND_OSS = COMMAND.merge(::Selenium::WebDriver::Remote::OSS::Bridge::COMMANDS).freeze
      COMMANDS_EXTEND_W3C = COMMAND.merge(::Selenium::WebDriver::Remote::W3C::Bridge::COMMANDS).freeze
    end
  end
end
