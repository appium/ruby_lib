module Appium
  module Common
    # @param [String|Hash] type You can get particular type's logs.
    # @return [[Selenium::WebDriver::LogEntry]] A list of logs data.
    #
    # @example
    #
    #   @driver.get_log("syslog") #=> [[Selenium::WebDriver::LogEntry]]
    #   @driver.get_log(:syslog)  #=> [[Selenium::WebDriver::LogEntry]]
    #
    def get_log(type)
      @driver.logs.get type
    end

    # Get a list of available log types
    #
    # @return [[String]] A list of available log types.
    #
    # @example
    #
    #   @driver.get_available_log_types #=> [:syslog, :crashlog, :performance]
    #
    def get_available_log_types
      @driver.logs.available_types
    end
  end # module Common
end # module Appium
