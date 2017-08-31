module Appium
  module Core
    def get_log(type)
      Logs.new(@driver.manage.logs).get type
    end

    def get_available_log_types
      Logs.new(@driver.manage.logs).available_types
    end

    # ::Selenium::WebDriver::Logs
    class Logs
      def initialize(bridge)
        @bridge = bridge
      end

      def get(type)
        @bridge.get type
      end

      def available_types
        @bridge.available_types
      end
    end
  end # module Core
end # module Appium
