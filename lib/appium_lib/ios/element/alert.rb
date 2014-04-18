# encoding: utf-8
module Appium
  module Ios
    # iOS only
    # Tap the alert button identified by value.
    #
    # Click the ok button:
    #   alert_click 'OK'
    #
    # Click the first button:
    #   alert_click 0
    #
    # @param value [Integer, String] either an integer index of the button or the button's name
    # @return [void]
    def alert_click value
      value = "'#{value}'" if value.is_a?(String)
      @driver.execute_script "UIATarget.localTarget().frontMostApp().alert().buttons()[#{value}].tap();"
    end

    # Get the alert message text.
    # @return [String]
    def alert_text
      # this will call get text twice so call bridge directly
      # ".switch_to.alert" calls it once, then ".text" another time.
      # @driver.switch_to.alert.text
      driver.send(:bridge).getAlertText
    end

    # Accept the alert.
    # @return [void]
    def alert_accept
      # @driver.switch_to.alert.accept
      # ".switch_to.alert" calls getAlertText so use bridge directly
      driver.send(:bridge).acceptAlert
    end

    # Get the text of the alert's accept button.
    # The last button is considered "accept." on iOS 6
    # The first button is considered "accept." on iOS 7
    # @return [String]
    def alert_accept_text
      old_wait = default_wait
      set_wait 0
      target_text = ''

      a = ignore { @driver.find_element(:tag_name, :alert) }

      begin
        if a.nil? # either no alert or on iOS 7
          b           = xpaths 'actionsheet/button'
          target_text = b.first.text if b && b.size >= 1
        else # iOS 6 alert found
          b           = a.find_elements(:tag_name, :button)
          target_text = b.last.text if b && b.size >= 1
        end
      rescue
      ensure
        set_wait old_wait
        return target_text
      end
    end

    # Dismiss the alert.
    # @return [void]
    def alert_dismiss
      # @driver.switch_to.alert.dismiss
      # ".switch_to.alert" calls getAlertText so use bridge directly
      driver.send(:bridge).dismissAlert
    end

    # Get the text of the alert's dismiss button.
    # The first button is considered "dismiss." on iOS 6
    # The last button is considered "dismiss." on iOS 7
    # @return [String]
    def alert_dismiss_text
      old_wait = default_wait
      set_wait 0
      target_text = ''

      a = ignore { @driver.find_element(:tag_name, :alert) }

      begin
        if a.nil? # either no alert or on iOS 7
          b           = xpaths 'actionsheet/button'
          target_text = b.last.text if b && b.size >= 1
        else # iOS 6 alert found
          b           = a.find_elements(:tag_name, :button)
          target_text = b.first.text if b && b.size >= 1
        end
      rescue
      ensure
        set_wait old_wait
        return target_text
      end
    end
  end # module Ios
end # module Appium