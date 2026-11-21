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
    # @option opts [Array<Class>, Class] :ignored Exceptions to retry (default: Selenium::WebDriver::Error::NoSuchElementError)
    #
    # @example
    #
    #     wait_true(timeout: 20, interval: 0.2, message: 'custom message') { button_exact('Back') }.click
    #     wait_true(20) { button_exact('Back') }.click
    #
    # @example Retrying Minitest assertions with core 14+
    #
    #     # Assertion failures propagate immediately by default.
    #     # ignored replaces the default list; include NoSuchElementError to keep retrying missing elements.
    #     wait_true(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError]) do
    #       assert_equal 'Ready', find_element(:accessibility_id, 'status').text
    #       true # wait_true requires a truthy result after the assertion succeeds.
    #     end
    #
    def wait_true(opts = {})
      opts = { timeout: opts } if opts.is_a? Numeric

      if opts.is_a? Hash
        opts.empty? ? @core.wait_true { yield } : @core.wait_true(**opts) { yield }
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
    # @option opts [Array<Class>, Class] :ignored Exceptions to retry (default: Selenium::WebDriver::Error::NoSuchElementError)
    #
    # @example
    #
    #     wait(timeout: 20, interval: 0.2, message: 'custom message') { button_exact('Back') }.click
    #     wait(20) { button_exact('Back') }.click
    #
    # @example Retrying Minitest assertions with core 14+
    #
    #     # This fails immediately if the assertion fails; it no longer retries automatically.
    #     wait { assert_equal 'Ready', find_element(:accessibility_id, 'status').text }
    #
    #     # ignored replaces the default list; include NoSuchElementError to keep retrying missing elements.
    #     wait(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError]) do
    #       assert_equal 'Ready', find_element(:accessibility_id, 'status').text
    #     end
    #
    def wait(opts = {})
      opts = { timeout: opts } if opts.is_a? Numeric
      if opts.is_a? Hash
        opts.empty? ? @core.wait { yield } : @core.wait(**opts) { yield }
      else
        ::Appium::Logger.warn('Arguments should be Hash like {timeout: 100}')
      end
    end
  end
end
