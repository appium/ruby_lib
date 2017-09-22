require_relative 'common/search_context'

# TODO: should clean

module Appium
  module Core
    class Base
      class Driver < ::Selenium::WebDriver::Driver
        include ::Selenium::WebDriver::DriverExtensions::UploadsFiles
        include ::Selenium::WebDriver::DriverExtensions::TakesScreenshot
        include ::Selenium::WebDriver::DriverExtensions::HasSessionId
        include ::Selenium::WebDriver::DriverExtensions::Rotatable
        include ::Selenium::WebDriver::DriverExtensions::HasRemoteStatus
        include ::Selenium::WebDriver::DriverExtensions::HasWebStorage

        include ::Appium::Core::SearchContext

        def initialize(opts = {})
          listener = opts.delete(:listener)
          @bridge = ::Appium::Core::Base::Bridge.handshake(opts)
          if @bridge.dialect == :oss
            extend ::Selenium::WebDriver::DriverExtensions::HasTouchScreen
            extend ::Selenium::WebDriver::DriverExtensions::HasLocation
            extend ::Selenium::WebDriver::DriverExtensions::HasNetworkConnection
          end
          super(@bridge, listener: listener)
        end
      end

      class Bridge < ::Selenium::WebDriver::Remote::Bridge
        def self.handshake(**opts)
          desired_capabilities = opts.delete(:desired_capabilities)

          if desired_capabilities.is_a?(Symbol)
            unless Remote::Capabilities.respond_to?(desired_capabilities)
              raise Error::WebDriverError, "invalid desired capability: #{desired_capabilities.inspect}"
            end
            desired_capabilities = Remote::Capabilities.__send__(desired_capabilities)
          end

          bridge = new(opts)
          capabilities = bridge.create_session(desired_capabilities)

          case bridge.dialect
          when :oss
            CoreBridge.new(capabilities, bridge.session_id, opts)
          when :w3c
            CoreBridgeW3C.new(capabilities, bridge.session_id, opts)
          else
            raise WebDriverError, 'cannot understand dialect'
          end
        end
      end

      class CoreBridge < ::Selenium::WebDriver::Remote::OSS::Bridge
        def commands(command)
          ::Appium::Core::Commands::COMMANDS_EXTEND_OSS[command]
        end
      end

      class CoreBridgeW3C < ::Selenium::WebDriver::Remote::W3C::Bridge
        def commands(command)
          case command
          when :status, :is_element_displayed
            ::Appium::Core::Commands::COMMANDS_EXTEND_OSS[command]
          else
            ::Appium::Core::Commands::COMMANDS_EXTEND_W3C[command]
          end
        end
      end
    end
  end
end
