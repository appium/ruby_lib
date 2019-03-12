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

# rake ios[sauce_labs]
describe 'sauce_labs' do
  t 'sauce settings' do
    opt = {}
    sauce_username = 'sauce_name'
    sauce_access_key = 'abcdefghijklmn'
    sauce_endpoint = 'ondemand.saucelabs.com:443/wd/hub'

    opt[:sauce_username] = sauce_username
    opt[:sauce_access_key] = sauce_access_key
    opt[:sauce_endpoint] = sauce_endpoint

    sauce = Appium::SauceLabs.new(opt)

    sauce.username.must_equal sauce_username
    sauce.access_key.must_equal sauce_access_key
    sauce.endpoint.must_equal sauce_endpoint
    sauce.sauce_server_url?.must_equal true
    sauce.server_url.must_equal 'https://sauce_name:abcdefghijklmn@ondemand.saucelabs.com:443/wd/hub'
  end

  t 'no sauce settings' do
    opt = {}
    sauce = Appium::SauceLabs.new(opt)

    sauce.sauce_server_url?.must_equal false
    sauce.server_url.must_equal 'http://127.0.0.1:4723/wd/hub'
  end
end
