require 'appium_lib_core'

module Appium
  module Common
    class Wait < ::Appium::Core::Base::Wait
      def initialize(opts = {})
        super(opts)
      end
    end

    # Check every interval seconds to see if yield returns a truthy value.
    # Note this isn't a strict boolean true, any truthy value is accepted.
    # false and nil are considered failures.
    # Give up after timeout seconds.
    #
    # Wait code from the selenium Ruby gem
    # https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb
    #
    # If only a number is provided then it's treated as the timeout value.
    #
    # @param [Hash] opts Options
    # @option opts [Numeric] :timeout Seconds to wait before timing out. Set default by `appium_wait_timeout` (30).
    # @option opts [Numeric] :interval Seconds to sleep between polls. Set default by `appium_wait_interval` (0.5).
    # @option opts [String] :message Exception message if timed out.
    # @option opts [Array, Exception] :ignore Exceptions to ignore while polling (default: Exception)
    def wait_true(opts = {})
      @core.wait_true(opts) { yield }
    end

    # Check every interval seconds to see if yield doesn't raise an exception.
    # Give up after timeout seconds.
    #
    # Wait code from the selenium Ruby gem
    # https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb
    #
    # If only a number is provided then it's treated as the timeout value.
    #
    # @param [Hash] opts Options
    # @option opts [Numeric] :timeout Seconds to wait before timing out. Set default by `appium_wait_timeout` (30).
    # @option opts [Numeric] :interval Seconds to sleep between polls. Set default by `appium_wait_interval` (0.5).
    # @option opts [String] :message Exception message if timed out.
    # @option opts [Array, Exception] :ignore Exceptions to ignore while polling (default: Exception)
    def wait(opts = {})
      @core.wait(opts) { yield }
    end
  end
end
