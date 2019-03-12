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

# rake ios[ios/xcuitest_gestures]
describe 'ios/xcuitest_gestures' do
  def before_first
    screen.must_equal catalog
  end

  def after_last
    screen.must_equal catalog
  end

  def open_alert_ok_cancel
    wait_true do
      find_element(:name, 'Show OK-Cancel').click
      find_element(:name, 'UIActionSheet <title>').displayed?
    end
  end

  def open_alert_custom
    wait_true do
      find_element(:name, 'Show Customized').click
      find_element(:name, 'UIActionSheet <title>').displayed?
    end
  end

  t 'before_first' do
    before_first
  end

  t 'tap' do
    element = text('controls')
    tap(x: 0, y: 0, element: element)

    back_click

    rect = element.rect
    tap(x: rect.x + rect.width / 2, y: rect.y + rect.height / 2)
  end

  t 'double_tap' do
    element = button('Tinted')
    double_tap(element: element)
  end

  t 'touch_and_hold' do
    element = button('Tinted')
    touch_and_hold(element: element, duration: 4.0)
    touch_and_hold(x: 100, y: 100)
  end

  t 'scroll' do
    scroll direction: 'down'
    text('Style Default').displayed?.must_equal true
  end

  t 'swipe' do
    swipe direction: 'down'
    swipe direction: 'down'

    proc { text('Style Default') }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'drag_from_to_for_duration' do
    drag_from_to_for_duration from_x: 100, from_y: 100, to_x: 100, to_y: 400
    text('Standard Switch').displayed?.must_equal true
  end

  t 'pinch' do
    pinch(scale: 0.5, velocity: -1)
  end

  t 'back to top' do
    back_click
  end

  t 'select_picker_wheel' do
    element = text('pickers')
    tap(x: 0, y: 0, element: element)

    e = find_element :name, 'John Appleseed'
    select_picker_wheel(element: e, order: 'next')

    e.displayed?.must_be false
    find_element(:name, 'Serena Auroux').displayed?.must_equal true
  end

  t 'back to top' do
    back_click
  end

  t 'alert' do
    wait_true do
      automation_name_is_xcuitest? ? find_element(:name, 'Alerts').click : text('alerts').click
      tag(ui_ios.navbar).name == 'Alerts' # wait for true
    end

    open_alert_ok_cancel
    alert action: 'accept'

    open_alert_ok_cancel
    alert action: 'dismiss'

    open_alert_custom
    list = alert action: 'getButtons'
    list.must_equal %w(Button1 Button2)
    alert action: 'accept', button_label: 'Button1'
  end

  t 'back to top' do
    back_click
  end

  t 'after_last' do
    after_last
  end
end
