require 'logger'

module Appium
  module Logger
    #
    # @example Use logger manually
    #   Appium::Logger.debug('This is info message')
    #   Appium::Logger.warn('This is warning message')
    #
    class << self
      extend Forwardable
      def_delegators :logger, :ap, :fatal, :error, :warn, :info, :debug, :level, :level=, :formatter, :formatter=

      [:fatal, :error, :warn, :info, :debug].each do |level|
        define_method("ap_#{level}") { |obj| logger.ap(obj, level) }
      end

      attr_writer :logger

      private

      def logger
        @logger ||= begin
          logger = ::Logger.new($stdout)
          logger.progname = 'ruby_lib'
          logger.level = ::Logger::WARN
          logger.formatter = proc { |_severity, _datetime, _progname, msg| "#{msg}\n" } # do no special formatting
          logger
        end
      end
    end # class << self
  end # module Logger
end # module Appium
