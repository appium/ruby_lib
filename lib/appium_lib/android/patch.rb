# encoding: utf-8
module Appium::Android
  # Implement useful features for element.
  class Selenium::WebDriver::Element
    # Cross platform way of entering text into a textfield
    def type text
      puts 'android type'
      self.send_keys text
    end
  end
end