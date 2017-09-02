module Appium
  module Core
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
