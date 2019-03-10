# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Appium
  class SauceLabs
    # Username for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_USERNAME is in ENV.
    attr_reader :username
    # Access Key for use on Sauce Labs. Set `false` to disable Sauce, even when SAUCE_ACCESS_KEY is in ENV.
    attr_reader :access_key
    # Override the Sauce Appium endpoint to allow e.g. TestObject tests. Default is 'ondemand.saucelabs.com:443/wd/hub'.
    attr_reader :endpoint

    #
    # Create a SauceLabs instance to manage sauce labs related attributes.
    #
    # @param [Hash] appium_lib_opts Appium library parameter
    # @return [Appium::SauceLabs]
    #
    # @example
    #
    #   opts_blank = {}
    #   sauce_labs_blank = Appium::SauceLabs.new(opts_blank)
    #   sauce_labs_blank.username   #=> nil
    #   sauce_labs_blank.access_key #=> nil
    #   sauce_labs_blank.endpoint   #=> "ondemand.saucelabs.com:443/wd/hub"
    #
    #   opts = { sauce_username: "user-name",
    #            sauce_access_key: "access-key-to-sauce-labs",
    #            sauce_endpoint: "ondemand.other_saucelabs.com:443/wd/hub",
    #          }
    #   sauce_labs = Appium::SauceLabs.new(opts)
    #   sauce_labs.username   #=> "user-name"
    #   sauce_labs.access_key #=> "access-key-to-sauce-labs"
    #   sauce_labs.endpoint   #=> "ondemand.other-saucelabs.com:443/wd/hub"
    #
    def initialize(appium_lib_opts)
      @username   = appium_lib_opts.fetch :sauce_username, ENV['SAUCE_USERNAME']
      @username   = nil if !@username || (@username.is_a?(String) && @username.empty?)

      @access_key = appium_lib_opts.fetch :sauce_access_key, ENV['SAUCE_ACCESS_KEY']
      @access_key = nil if !@access_key || (@access_key.is_a?(String) && @access_key.empty?)

      @endpoint   = appium_lib_opts.fetch :sauce_endpoint, ENV['SAUCE_ENDPOINT']
      @endpoint   = 'ondemand.saucelabs.com:443/wd/hub' if !@endpoint || (@endpoint.is_a?(String) && @endpoint.empty?)
    end

    #
    # Return true if an instance of Appium::SauceLabs has sauce_username and sauce_access_key.
    # @return [Boolean]
    #
    # @example
    #
    #   sauce_labs_blank.sauce_server_url? #=> false
    #   sauce_labs.sauce_server_url?       #=> true
    #
    def sauce_server_url?
      !username.nil? && !access_key.nil?
    end

    #
    # Return a particular server url to access to. Default is the local address.
    # @return [String]
    #
    # @example
    #
    #   sauce_labs_blank.server_url #=> "http://127.0.0.1:4723/wd/hub"
    #   sauce_labs.server_url #=> "https://user-name:access-key-to-sauce-labs@ondemand.other-saucelabs.com:443/wd/hub"
    #
    def server_url
      sauce_server_url? ? "https://#{username}:#{access_key}@#{endpoint}" : 'http://127.0.0.1:4723/wd/hub'
    end
  end
end
