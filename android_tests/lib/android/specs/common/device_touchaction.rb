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

# rake "android[common/device_touchaction]"
describe 'common/device_touchaction' do
  def before_first
    wait { text('Accessibility') }
  end

  t 'before test' do
    before_first
  end

  t 'action_chain_press_release' do
    wait do
      e = text('Accessibility')
      touch_action = Appium::TouchAction.new.press(element: e, x: 0.5, y: 0.5).release(element: e)
      touch_action.perform
      touch_action.actions.must_equal []
    end
    wait { text('Custom View') }
    back
    wait { text_exact 'NFC' }
  end

  t 'action_chain_tap' do
    wait do
      e = text('Accessibility')
      touch_action = Appium::TouchAction.new.tap(element: e)
      touch_action.perform
      touch_action.actions.must_equal []
    end
    wait { text('Custom View') }
    back
    wait { text_exact 'NFC' }
  end

  t 'swipe' do
    wait { text('Animation').click }
    wait { text_exact('Bouncing Balls').click }
    wait { Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.0, end_y: 49.75).perform }
    2.times { back }
    wait { text_exact 'NFC' }
  end

  t 'pinch & zoom' do
    wait { text_exact 'NFC' }
    wait { text_exact('Graphics').click }
    wait { scroll_to('Touch Paint').click }
    wait { zoom 200 }
    wait { pinch 75 }
    wait { text('Graphics/Touch Paint') }
    2.times { back }
    wait { text_exact 'NFC' }
  end
end
