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

        extend_search_contexts
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
        if selenium_has method
          log_reimplemented_warning(method, path)
          return
        end

        Selenium::WebDriver::Remote::Bridge.class_eval do
          command method, :post, path
          if block_given?
            class_eval &Proc.new
          else
            define_method(method) {execute method}
          end
        end
      end

      def selenium_has(method)
        Selenium::WebDriver::Remote::Bridge.method_defined? method
      end

      def log_reimplemented_warning(method, path)
        msg = "Selenium::WebDriver has now implemented the `#{method}` method."
        if Selenium::WebDriver::Remote::COMMANDS[method][1] == path
          msg << " It may no longer function as expected"
        else
          msg << " It no longer uses the same endpoint,"
          msg << " so it probably won't do what you expect anymore."
        end
        msg << " Raise an issue at http://www.github.com/appium/ruby_lib if so."
        Appium::Logger.warn msg
      end

      # @!method accessiblity_id_find
      #   find_element/s with their accessibility_id
      #
      #   ```ruby
      #    find_elements :accessibility_id, 'Animation'
      #   ```
      def extend_search_contexts
        Selenium::WebDriver::SearchContext.class_eval do
          Selenium::WebDriver::SearchContext::FINDERS[:accessibility_id] = 'accessibility id'
        end
      end
    end
  end
end