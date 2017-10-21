require 'selenium-webdriver'

require_relative 'common'
require_relative 'patch'
require_relative 'driver'

# for multi touch related methods
require_relative 'device/touch_actions'

require_relative 'android'
require_relative 'android_uiautomator2'
require_relative 'android_espresso'

require_relative 'ios'
require_relative 'ios_xcuitest'

module Appium
  # convert all keys (including nested) to symbols
  #
  # based on deep_symbolize_keys & deep_transform_keys from rails
  # https://github.com/rails/docrails/blob/a3b1105ada3da64acfa3843b164b14b734456a50/activesupport/lib/active_support/core_ext/hash/keys.rb#L84
  # @param [Hash] hash Hash value to make symbolise
  def self.symbolize_keys(hash)
    raise 'symbolize_keys requires a hash' unless hash.is_a? Hash
    result = {}
    hash.each do |key, value|
      key = key.to_sym rescue key # rubocop:disable Style/RescueModifier
      result[key] = value.is_a?(Hash) ? symbolize_keys(value) : value
    end
    result
  end

  module Core
    # Creates a new global driver and extend particular methods to `target`
    # @param [Class] target Extend particular methods to this target.
    # @param [Hash] opts A options include capabilities for the Appium Server and for the client.
    #
    # @example
    #
    #     require 'rubygems'
    #     require 'appium_lib'
    #
    #     # Start iOS driver
    #     opts = {
    #              caps: {
    #                platformName: :ios,
    #                app: '/path/to/MyiOS.app'
    #              },
    #              appium_lib: {
    #                server_url: "http://custom-host:8080/wd/hub.com",
    #                export_session: false,
    #                port: 8080,
    #                wait: 0,
    #                wait_timeout: 20,
    #                wait_interval: 0.3,
    #                listener: nil,
    #              }
    #            }
    #     @core_driver = Appium::Core.for(self, opts) # create a core driver with `opts` and extend methods into `self`
    #     @core_driver.start_driver(server_url: server_url, http_client_ops: http_client_ops) # start driver
    #
    def self.for(*args)
      Core::Driver.for(*args)
    end
  end
end
