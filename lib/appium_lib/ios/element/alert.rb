module Appium
  module Ios
    # Accept the alert.
    # @return [void]
    def alert_accept
      # @driver.switch_to.alert.accept
      # ".switch_to.alert" calls alert_text so use bridge directly
      driver.send(:bridge).accept_alert
    end

    # Dismiss the alert.
    # @return [void]
    def alert_dismiss
      # @driver.switch_to.alert.dismiss
      # ".switch_to.alert" calls alert_text so use bridge directly
      driver.send(:bridge).dismiss_alert
    end
  end # module Ios
end # module Appium
