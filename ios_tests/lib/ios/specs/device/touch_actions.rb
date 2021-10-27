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

# rake "ios[device/touch_actions]"
describe 'device/touch_actions' do
  def after_last
    back_click
  end

  t 'swipe_default_duration' do
    wait_true do
      wait { automation_name_is_xcuitest? ? find_element(:name, 'Picker View').click : text('pickers').click }
      screen == 'Picker View'
    end

    ele_index(ui_ios.picker_wheel, 1).text.must_equal '65'
    picker = ele_index(ui_ios.picker_wheel, 1)
    picker_rect = picker.rect
    start_x = picker_rect.x + picker_rect.width / 2 + 50
    start_y = picker_rect.y + picker_rect.height / 2 + 60

    args = { x: start_x, y: start_y }
    args[:element] = picker.id if picker
    execute_script 'mobile: tap', args

    puts window_rect

    action.move_to_location(start_x, start_y).pointer_down(:left)
          .move_to_location(start_x, start_y - 10).pointer_up(:left).perform

    ele_index(ui_ios.picker_wheel, 1).text.must_equal '70'
  end

  t 'after_last' do
    after_last
  end
end

# TODO: write tests
#
# move_to
# long_press
# press
# release
# tap
# wait
# swipe
# perform
# cancel
