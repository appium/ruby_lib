module Appium
  module Ios
    # Accept the alert.
    # @return [void]
    def alert_accept
      # @driver.switch_to.alert.accept
      # ".switch_to.alert" calls getAlertText so use bridge directly
      driver.send(:bridge).acceptAlert
    end

    # Dismiss the alert.
    # @return [void]
    def alert_dismiss
      # @driver.switch_to.alert.dismiss
      # ".switch_to.alert" calls getAlertText so use bridge directly
      driver.send(:bridge).dismissAlert
    end
  end # module Ios
end # module Appium
