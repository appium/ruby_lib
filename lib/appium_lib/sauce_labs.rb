module Appium
  class SauceLabs
    # Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
    attr_reader :username
    # Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
    attr_reader :access_key
    # Override the Sauce Appium endpoint to allow e.g. TestObject tests
    attr_reader :endpoint

    def initialize(appium_lib_opts)
      @username   = appium_lib_opts.fetch :sauce_username, ENV['SAUCE_USERNAME']
      @username   = nil if !@username || (@username.is_a?(String) && @username.empty?)

      @access_key = appium_lib_opts.fetch :sauce_access_key, ENV['SAUCE_ACCESS_KEY']
      @access_key = nil if !@access_key || (@access_key.is_a?(String) && @access_key.empty?)

      @endpoint   = appium_lib_opts.fetch :sauce_endpoint, ENV['SAUCE_ENDPOINT']
      @endpoint   = 'ondemand.saucelabs.com:443/wd/hub' if
          !@endpoint || (@endpoint.is_a?(String) && @endpoint.empty?)
    end

    def sauce_server_url?
      !username.nil? && !access_key.nil?
    end

    def server_url
      sauce_server_url? ? "https://#{username}:#{access_key}@#{endpoint}" : 'http://127.0.0.1:4723/wd/hub'
    end
  end
end
