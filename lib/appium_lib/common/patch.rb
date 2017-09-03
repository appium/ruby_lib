# Print JSON posted to Appium. Not scoped to an Appium module.
#
# Requires from lib/selenium/webdriver/remote.rb
require 'selenium/webdriver/remote/bridge'
require 'selenium/webdriver/remote/oss/bridge'
require 'selenium/webdriver/remote/w3c/bridge'

def patch_remote_driver_commands(bridge: :oss)
  case bridge
  when :oss
    Selenium::WebDriver::Remote::OSS::Bridge.class_eval do
      def commands(command)
        ::Appium::Driver::Commands::COMMANDS_EXTEND_OSS[command]
      end
    end
  when :w3c
    Selenium::WebDriver::Remote::W3C::Bridge.class_eval do
      def commands(command)
        case command
        when :status, :is_element_displayed
          ::Appium::Driver::Commands::COMMANDS_EXTEND_OSS[command]
        else
          ::Appium::Driver::Commands::COMMANDS_EXTEND_W3C[command]
        end
      end
    end
  end
end
