module Appium
  module Core
    class Logs
      def initialize(bridge)
        @bridge = bridge
      end

      # @param [String|Hash] type You can get particular type's logs.
      # @return [[Selenium::WebDriver::LogEntry]] A list of logs data.
      #
      # @example
      #   Appium::Core::Logs.new(driver).get(“syslog”) #=> [[Selenium::WebDriver::LogEntry]]
      #   Appium::Core::Logs.new(driver).get(:syslog)  #=> [[Selenium::WebDriver::LogEntry]]
      #
      def get(type)
        @bridge.get type
      end

      # Get a list of available log types
      #
      # @return [[Hash]] A list of available log types.
      # @example
      #   Appium::Core::Logs.new(driver).available_types #=>  [:syslog, :crashlog, :performance]
      #
      def available_types
        @bridge.available_types
      end
    end
  end # module Core
end # module Appium
