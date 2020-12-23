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

# rake android[device/touch_actions]
describe 'device/touch_actions' do
  def swipe_till_text_visible(seen_text)
    start_x = window_size[:width] / 2
    start_y = window_size[:height] / 2
    wait(timeout: 0.6) do
      # rubocop:disable Layout/LineLength
      # Example for Android's log
      # [0] pry(#<device/touch_actions>)> swipe start_x: start_x, start_y: start_y, end_x: start_y, end_y: start_y - 100
      # [HTTP] --> POST /wd/hub/session/9baa18bf-a19b-4654-be4a-d0db0334bbc0/touch/perform {"actions":[{"action":"press","options":{"x":600,"y":919}},{"action":"wait","options":{"ms":200}},{"action":"moveTo","options":{"x":600,"y":819}},{"action":"release"}]}
      # [debug] [MJSONWP] Calling AppiumDriver.performTouch() with args: [[{"action":"press","options":{"x":600,"y":919}},{"action":"wait","options":{"ms":200}},{"action":"moveTo","options":{"x":600,"y":819}},{"action":"release"}],"9baa18bf-a19b-4654-be4a-d0db0334bbc0"]
      # [debug] [AndroidBootstrap] Sending command to android: {"cmd":"action","action":"swipe","params":{"startX":600,"startY":919,"endX":600,"endY":819,"steps":6}}
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Got data from client: {"cmd":"action","action":"swipe","params":{"startX":600,"startY":919,"endX":600,"endY":819,"steps":6}}
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Got command of type ACTION
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Got command action: swipe
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Display bounds: [0,0][1200,1838]
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Display bounds: [0,0][1200,1838]
      # [AndroidBootstrap] [BOOTSTRAP LOG] [debug] Swiping from [x=600.0, y=919.0] to [x=600.0, y=819.0] with steps: 6
      # [debug] [AndroidBootstrap] Received command result from bootstrap
      # rubocop:enable Layout/LineLength
      swipe start_x: start_x, start_y: start_y, end_x: 0.0, end_y: - 100
      text(seen_text).displayed?
    end
  end

  t 'swipe_default_duration' do
    swipe_till_text_visible('views')
    text('views').click
    wait_true do
      text('animation').displayed?
    end
    text('animation').text.must_equal 'Animation'
    swipe_till_text_visible('lists')
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
