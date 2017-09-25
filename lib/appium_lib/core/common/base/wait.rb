module Appium
  module Core
    class Base
      class Wait < ::Selenium::WebDriver::Wait
        require 'timeout' # for wait

        def initialize(opts = {})
          valid_keys = [:timeout, :interval, :message, :ignore, :return_if_true]
          invalid_keys = []
          opts.keys.each { |key| invalid_keys << key unless valid_keys.include?(key) }
          # [:one, :two] => :one, :two
          unless invalid_keys.empty?
            raise "Invalid keys #{invalid_keys.to_s[1..-2]}. Valid keys are #{valid_keys.to_s[1..-2]}"
          end

          @timeout        = opts.fetch(:timeout, DEFAULT_TIMEOUT)
          @interval       = opts.fetch(:interval, DEFAULT_INTERVAL)
          @message        = opts[:message]
          @ignored        = Array(opts[:ignore] || ::Exception)
          @return_if_true = opts[:return_if_true]

          super(timeout: @timeout, interval: @interval, message: @message, ignore: @ignored)
        end

        # Wait code from the selenium Ruby gem
        # https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb
        # @override
        def until
          end_time   = Time.now + @timeout
          last_error = nil

          until Time.now > end_time
            begin
              return yield unless @return_if_true

              result = yield
              return result if result
            rescue ::Errno::ECONNREFUSED => e
              raise e
            rescue *@ignored => last_error # rubocop:disable Lint/HandleExceptions
              # swallowed
            end

            sleep @interval
          end

          msg = @message ? @message.dup : "timed out after #{@timeout} seconds"

          msg << " (#{last_error.message})" if last_error

          raise Selenium::WebDriver::Error::TimeOutError, msg
        end
      end # module Wait
    end # module Base
  end # module Core
end # module Appium
