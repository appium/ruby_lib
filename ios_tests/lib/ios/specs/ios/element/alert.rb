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

# rake "ios[ios/element/alert]"
describe 'ios/element/alert' do
  def nav_once
    screen.must_equal catalog
    wait_true do
      find_element(:name, 'Alert Views').click
      tag(ui_ios.navbar).name == 'Alert Views' # wait for true
    end
  end

  def after_last
    back_click
    screen.must_equal catalog
    sleep 1
  end

  def open_alert
    wait_true do
      find_element(:name, 'Okay / Cancel').click
      find_element(:name, 'A Short Title Is Best').displayed?
    end
  end

  t 'before' do
    nav_once
  end

  t 'alert_accept' do
    open_alert
    alert_accept
  end

  t 'alert_dismiss' do
    open_alert
    alert_dismiss
  end

  t 'after_last' do
    after_last
  end
end
