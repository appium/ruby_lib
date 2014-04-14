require 'Forwardable'

module Appium
  module Device
    extend Forwardable

    # @private
    NoArgPostMethods = {
      shake: 'session/:session_id/appium/device/shake',
      launch: 'session/:session_id/appium/app/launch',
      closeApp: 'session/:session_id/appium/app/close',
    }

    class << self
      def extended(mod)
        extend_webdriver_with_forwardable
        
        NoArgPostMethods.each_pair do |m, p|
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

        add_endpoint_method(:available_contexts, 'session/:session_id/contexts', :get)

        add_endpoint_method(:current_context, 'session/:session_id/context', :get)
        
        add_endpoint_method(:current_context=, 'session/:session_id/context') do
          def current_context=(context=null)
            execute :current_context=, {}, :context => context
          end
        end

        extend_search_contexts
      end 

      # @private
      def add_endpoint_method(method, path, verb=:post)
        if block_given?
          # &Proc.new with no args passes the passed_in block
          # Because creating Procs from blocks is slow
          create_bridge_command method, verb, path, &Proc.new
        else
          create_bridge_command method, verb, path
        end

        delegate_driver_method method
        delegate_appium_driver_method method
      end 

      # @private
      def extend_webdriver_with_forwardable
        return if Selenium::WebDriver::Driver.kind_of? Forwardable
        Selenium::WebDriver::Driver.class_eval do
          extend Forwardable
        end
      end

      # @private
      def delegate_driver_method(method)
        return if Selenium::WebDriver::Driver.method_defined? method
        Selenium::WebDriver::Driver.class_eval { def_delegator :@bridge, method}
      end

      # @private
      def delegate_appium_driver_method(method)
        def_delegator :@driver, method
      end

      # @private
      def create_bridge_command(method, verb, path)
        # Don't clobber methods that are moved into Selenium
        if selenium_has method
          log_reimplemented_warning(method, path)
          return
        end

        Selenium::WebDriver::Remote::Bridge.class_eval do
          command method, verb, path
          if block_given?
            class_eval &Proc.new
          else
            define_method(method) {execute method}
          end
        end
      end

      # @private
      def selenium_has(method)
        Selenium::WebDriver::Remote::Bridge.method_defined? method
      end

      # @private
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

    # Perform a block within the given context, then switch back to the starting context.
    # @param context (String) The context to switch to for the duration of the block.
    #
    # ```ruby
    # within_context('NATIVE_APP') do 
    #   find_element [:tag, "button"]
    # ```
    def within_context(context)
      existing_context = current_context
      yield if block_given?
      current_context = existing_context
    end

    # Change to the default context.  This is equivalent to `current_context= nil`.
    def switch_to_default_context
      current_context = nil
    end

    # @!method current_context=
    #   Change the context to the given context.
    #   @param [String] The context to change to
    #
    #   ```ruby
    #   current_context= "NATIVE_APP"
    #   ```

    # @!method current_context
    #   @return [String] The context currently being used.

    # @!method available_contexts
    # @return [Array<String>] All usable contexts, as an array of strings
  end
end