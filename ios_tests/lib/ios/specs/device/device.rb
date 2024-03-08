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

# $ rake "ios[device/device]"
describe 'device/device' do
  def before_first
    screen.must_equal catalog
  end

  # go back to the main page
  def go_back
    back
    wait { find_ele_by_predicate_include(class_name: ui_ios.navbar, value: 'UICatalog') }
  end

  t 'before_first' do
    before_first
  end

  t 'app_installed' do
    installed = app_installed? 'Derrp'
    installed.must_equal false
  end

  t 'background_app homescreen' do
    background_app(-1) # background_app(nil) should work as same.

    # The app goes to background and never come back
    proc { screen }.must_raise ::Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'app_strings' do
    app_strings.must_include 'A Short Title Is Best'
    app_strings('en').must_include 'A Short Title Is Best'
  end

  t 'action_chain' do
    element = text('Buttons')
    one_finger_tap x: 0, y: 0, element: element

    wait { button 'UICatalog' } # successfully transitioned to buttons page
    go_back
  end

  t 'swipe' do
    action.move_to_location(75, 500).pointer_down(:left)
          .move_to_location(75, 20).release.perform
  end
end
