module Appium
  module Core
    class Base
      module Capabilities
        # @private
        # @param [Hash] opts_caps Capabilities for Appium server. All capability keys are converted to lowerCamelCase when
        #                         this client sends capabilities to Appium server as JSON format.
        # @return [::Selenium::WebDriver::Remote::W3C::Capabilities] Return instance of Appium::Core::Base::Capabilities
        #                         inherited ::Selenium::WebDriver::Remote::W3C::Capabilities
        def self.create_capabilities(opts_caps = {})
          ::Selenium::WebDriver::Remote::W3C::Capabilities.new(opts_caps)
        end
      end
    end
  end
end
