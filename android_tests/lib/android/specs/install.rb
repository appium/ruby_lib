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

# rake "android[install]"
describe 'install' do
  # To Do: Blocked on https://github.com/appium/appium/issues/3032
  def pkg
    'io.appium.android.apis'
  end

  def installed
    app_installed?(pkg).must_equal true
  end

  def not_installed
    app_installed?(pkg).must_equal false
  end

  t 'install/uninstall' do
    installed
    remove_app 'io.appium.android.apis'
    not_installed
    install_app caps[:app]
    installed
  end

  # no way to launch apk after it's uninstalled/installed
  # blocked on: https://github.com/appium/appium/issues/2969
  # launch_app
end
