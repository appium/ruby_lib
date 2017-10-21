# rake android[device/touch_actions]
describe 'device/touch_actions' do
  def swipe_till_text_visible(seen_text)
    start_x = window_size[:width] / 2
    start_y = window_size[:height] / 2
    wait(60) do
      # rubocop:disable Metrics/LineLength
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
      # rubocop:enable Metrics/LineLength
      swipe start_x: start_x, start_y: start_y, offset_x: 0.0, offset_y: - 100
      text(seen_text).displayed?
    end
  end

  t 'swipe_coordinates_offset' do
    s = Appium::TouchAction.new.swipe_coordinates
    s[:offset_x].must_equal 0
    s[:offset_y].must_equal 0
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
