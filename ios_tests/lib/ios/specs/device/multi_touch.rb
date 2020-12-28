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

# rake "ios[device/multi_touch]"
describe 'device/multi_touch' do
  def before_first
    screen.must_equal catalog
  end

  # go back to the main page
  def go_back
    back
    wait { find_ele_by_predicate_include(class_name: 'XCUIElementTypeNavigationBar', value: 'UICatalog') }
  end

  t 'before_first' do
    before_first
  end

  t 'pinch & zoom' do
    wait { id('Image View').click }
    # both of these appear to do nothing on iOS 8
    Appium::MultiTouch.zoom 200
    Appium::MultiTouch.pinch 75
    go_back
  end
end

# TODO: write tests
# pinch
# zoom
# initialize
# add
# perform
