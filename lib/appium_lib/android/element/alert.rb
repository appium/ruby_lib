# encoding: utf-8
module Appium::Android
  # Tap the alert button identified by value.
  # @param value [Integer, String] either an integer index of the button or the button's name
  # @return [void]
  def alert_click value
    button(value).click
  end

  # Get the alert message text.
  # @return [String]
  def alert_text
    get_page
  end

  # Accept the alert.
  # The last button is considered "accept."
  # @return [void]
  def alert_accept
    last_button.click
  end

  # Get the text of the alert's accept button.
  # The last button is considered "accept."
  # @return [String]
  def alert_accept_text
    last_button.text
  end

  # Dismiss the alert.
  # The first button is considered "dismiss."
  # @return [void]
  def alert_dismiss
    first_button.click
  end

  # Get the text of the alert's dismiss button.
  # The first button is considered "dismiss."
  # @return [String]
  def alert_dismiss_text
    first_button.text
  end
end # module Appium::Android