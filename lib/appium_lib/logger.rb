module Appium
  module Logger
    class << self
      extend Forwardable
      def_delegators :@logger, :warn, :error, :info

      # @private
      def logger
        @logger ||= Logger.new
      end
    end
  end
end