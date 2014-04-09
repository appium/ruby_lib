require 'Forwardable'

module Appium
  module Device
    extend Forwardable

    NoArgMethods = {
      shake: 'session/:session_id/appium/device/shake',
      launch: 'session/:session_id/appium/app/launch',
      closeApp: 'session/:session_id/appium/app/close',
    }

    class << self
      def extended(mod)
        extend_webdriver_with_forwardable
        
        NoArgMethods.each_pair do |m, p|
          add_endpoint_method m, p
        end

        add_endpoint_method(:lock, 'session/:session_id/appium/device/lock') do
          def lock(duration)
            execute :lock, {}, :seconds => duration
          end
        end

        add_endpoint_method(:install, 'session/:session_id/appium/device/install_app') do
          def install(path)
            execute :install, {}, :appPath => path
          end
        end

        add_endpoint_method(:remove, 'session/:session_id/appium/device/remove_app') do
          def remove(id)
            execute :remove, {}, :appId => id
          end
        end
      end 

      def add_endpoint_method(method, path)
        if block_given?
          # &Proc.new with no args passes the passed_in block
          # Because creating Procs from blocks is slow
          create_bridge_command method, path, &Proc.new
        else
          create_bridge_command method, path
        end

        delegate_driver_method method
        delegate_appium_driver_method method
      end 

      def extend_webdriver_with_forwardable
        return if Selenium::WebDriver::Driver.kind_of? Forwardable
        Selenium::WebDriver::Driver.class_eval do
          extend Forwardable
        end
      end

      def delegate_driver_method(method)
        return if Selenium::WebDriver::Driver.method_defined? method
        Selenium::WebDriver::Driver.class_eval { def_delegator :@bridge, method}
      end

      def delegate_appium_driver_method(method)
        def_delegator :@driver, method
      end

      def create_bridge_command(method, path)
        # Don't clobber methods that are moved into Selenium
        return if Selenium::WebDriver::Remote::Bridge.method_defined? method
        Selenium::WebDriver::Remote::Bridge.class_eval do
          command method, :post, path
          if block_given?
            class_eval &Proc.new
          else
            define_method(method) {execute method}
          end
        end
      end
    end
  end
end