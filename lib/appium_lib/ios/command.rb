module Appium
  class Ios
    module Commands
      COMMAND_NO_ARG = {
        device_time:                [:get,  'session/:session_id/appium/device/system_time'.freeze],
        current_context:            [:get,  'session/:session_id/context'.freeze]
      }.freeze

      COMMAND = {
        touch_id:                   [:post, 'session/:session_id/appium/simulator/touch_id'.freeze],
        toggle_touch_id_enrollment: [:post, 'session/:session_id/appium/simulator/toggle_touch_id_enrollment'.freeze]
      }.merge(COMMAND_NO_ARG).freeze
    end
  end
end
