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

require 'appium_lib_core'

module Appium
  module Common
    class Wait
      include ::Appium::Core::Waitable
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
    # @param [Hash|Numeric] opts Options. If the value is _Numeric_, the value is set as `{ timeout: value }`
    # @option opts [Numeric] :timeout Seconds to wait before timing out. Set default by `appium_wait_timeout` (30).
    # @option opts [Numeric] :interval Seconds to sleep between polls. Set default by `appium_wait_interval` (0.5).
    # @option opts [String] :message Exception message if timed out.
    # @option opts [Array, Exception] :ignore Exceptions to ignore while polling (default: Exception)
    #
    # @example
    #
    #     wait_true(timeout: 20, interval: 0.2, message: 'custom message') { button_exact('Back') }.click
    #     wait_true(20) { button_exact('Back') }.click
    #
    def wait_true(opts = {})
      opts = opts.is_a?(Numeric) ? { timeout: opts } : opts

      if opts.is_a? Hash
        opts.empty? ? @core.wait_true { yield } : @core.wait_true(opts) { yield }
      else
        ::Appium::Logger.warn('Arguments should be Hash like {timeout: 100}')
      end
    end

    # Check every interval seconds to see if yield doesn't raise an exception.
    # Give up after timeout seconds.
    #
    # Wait code from the selenium Ruby gem
    # https://github.com/SeleniumHQ/selenium/blob/cf501dda3f0ed12233de51ce8170c0e8090f0c20/rb/lib/selenium/webdriver/common/wait.rb
    #
    # If only a number is provided then it's treated as the timeout value.
    #
    # @param [Hash|Numeric] opts Options. If the value is _Numeric_, the value is set as `{ timeout: value }`
    # @option opts [Numeric] :timeout Seconds to wait before timing out. Set default by `appium_wait_timeout` (30).
    # @option opts [Numeric] :interval Seconds to sleep between polls. Set default by `appium_wait_interval` (0.5).
    # @option opts [String] :message Exception message if timed out.
    # @option opts [Array, Exception] :ignore Exceptions to ignore while polling (default: Exception)
    #
    # @example
    #
    #     wait(timeout: 20, interval: 0.2, message: 'custom message') { button_exact('Back') }.click
    #     wait(20) { button_exact('Back') }.click
    #
    def wait(opts = {})
      opts = opts.is_a?(Numeric) ? { timeout: opts } : opts

      if opts.is_a? Hash
        opts.empty? ? @core.wait { yield } : @core.wait(opts) { yield }
      else
        ::Appium::Logger.warn('Arguments should be Hash like {timeout: 100}')
      end
    end
  end
end
