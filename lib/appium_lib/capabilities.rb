module Appium
  class Driver
    module Capabilities
      # @param [Hash] opts_caps Capabilities for Appium server. All capability keys are converted to lowerCamelCase when
      #                         this client sends capabilities to Appium server as JSON format.
      # @return [::Selenium::WebDriver::Remote::W3C::Capabilities] Return instance of Appium::Driver::Capabilities
      #                         inherited ::Selenium::WebDriver::Remote::W3C::Capabilities
      def self.init_caps_for_appium(opts_caps = {})
        ::Selenium::WebDriver::Remote::W3C::Capabilities.new(opts_caps)
      end
    end
  end
end
