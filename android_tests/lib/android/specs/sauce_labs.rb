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

# rake "android[sauce_labs]"
class AndroidTest
  class SauceLabs < Minitest::Test
    def test_sauce_settings
      opt = {}
      sauce_username = 'sauce_name'
      sauce_access_key = 'abcdefghijklmn'
      sauce_endpoint = 'ondemand.saucelabs.com:443/wd/hub'

      opt[:sauce_username] = sauce_username
      opt[:sauce_access_key] = sauce_access_key
      opt[:sauce_endpoint] = sauce_endpoint

      sauce = Appium::SauceLabs.new(opt)

      assert_equal sauce.username, sauce_username
      assert_equal sauce.access_key, sauce_access_key
      assert_equal sauce.endpoint, sauce_endpoint
      assert_equal sauce.sauce_server_url?, true
      assert_equal sauce.server_url, 'https://sauce_name:abcdefghijklmn@ondemand.saucelabs.com:443/wd/hub'
    end

    def test_no_sauce_settings
      opt = {}
      sauce = Appium::SauceLabs.new(opt)

      assert_equal sauce.sauce_server_url?, false
      assert_equal sauce.server_url, 'http://127.0.0.1:4723/wd/hub'
    end
  end
end
