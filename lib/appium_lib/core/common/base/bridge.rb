module Appium
  module Core
    class Base
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
            raise CoreError, 'cannot understand dialect'
          end
        end
      end # class Bridge

      # TODO: implement bridge commands for Appium
      class CoreBridge < ::Selenium::WebDriver::Remote::OSS::Bridge
        def commands(command)
          ::Appium::Core::Commands::COMMANDS_EXTEND_OSS[command]
        end
      end # class CoreBridge

      # TODO: implement bridge commands for Appium
      class CoreBridgeW3C < ::Selenium::WebDriver::Remote::W3C::Bridge
        def commands(command)
          case command
          when :status, :is_element_displayed
            ::Appium::Core::Commands::COMMANDS_EXTEND_OSS[command]
          else
            ::Appium::Core::Commands::COMMANDS_EXTEND_W3C[command]
          end
        end
      end # class CoreBridgeW3C
    end # class Base
  end # module Core
end # module Appium
