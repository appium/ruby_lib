# encoding: utf-8
module Appium::Ios
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
    @driver.switch_to.alert.text
  end

  # Accept the alert.
  # @return [void]
  def alert_accept
    @driver.switch_to.alert.accept
  end

  # Get the text of the alert's accept button.
  # The last button is considered "accept."
  # @return [String]
  def alert_accept_text
    a = @driver.find_element(:tag_name, :alert)
    return if a.nil?
    b = a.find_elements(:tag_name, :button)
    b.last.text if b && b.size >= 1
  end

  # Dismiss the alert.
  # @return [void]
  def alert_dismiss
    @driver.switch_to.alert.dismiss
  end

  # Get the text of the alert's dismiss button.
  # The first button is considered "dismiss."
  # @return [String]
  def alert_dismiss_text
    a = @driver.find_element(:tag_name, :alert)
    return if a.nil?
    b = a.find_elements(:tag_name, :button)
    b.first.text if b && b.size >= 1
  end
end # module Appium::Ios