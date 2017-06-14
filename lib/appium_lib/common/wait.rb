module Appium
  module Common
    class Wait < ::Selenium::WebDriver::Wait
      def initialize(opts = {})
        valid_keys = [:timeout, :interval, :message, :ignore, :return_if_true]
        invalid_keys = []
        opts.keys.each { |key| invalid_keys << key unless valid_keys.include?(key) }
        # [:one, :two] => :one, :two
        raise "Invalid keys #{invalid_keys.to_s[1..-2]}. Valid keys are #{valid_keys.to_s[1..-2]}" unless invalid_keys.empty?

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
    end

    # process opts before calling _generic_wait
    def _process_wait_opts(opts)
      opts = { timeout: opts } if opts.is_a?(Numeric)
      raise 'opts must be a hash' unless opts.is_a? Hash
      opts
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
      opts = _process_wait_opts(opts).merge(return_if_true: true)

      opts[:timeout]  ||= @appium_wait_timeout
      opts[:interval] ||= @appium_wait_interval

      wait = ::Appium::Common::Wait.new opts
      wait.until { yield }
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
      opts = _process_wait_opts(opts).merge(return_if_true: false)

      opts[:timeout]  ||= @appium_wait_timeout
      opts[:interval] ||= @appium_wait_interval

      wait = ::Appium::Common::Wait.new opts
      wait.until { yield }
    end
  end # module Common
end # module Appium
