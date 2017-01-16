# rake ios[device/touch_actions]
describe 'device/touch_actions' do
  def after_last
    back_click
  end

  t 'swipe_default_duration' do
    wait_true do
      wait { UI::Inventory.xcuitest? ? find_element(:name, 'Pickers').click : text('pickers').click }
      screen == 'Pickers'
    end

    ele_index(UI::Inventory.static_text, 2).text.must_equal 'John Appleseed - 0'
    picker = ele_index(UI::Inventory.picker, 1)
    loc = picker.location.to_h
    size = picker.size.to_h
    start_x = loc[:x] + size[:width] / 2
    start_y = loc[:y] + size[:height] / 2
    # rubocop:disable Metrics/LineLength
    # Example for iOS's log with XCUITest
    # [0] pry(#<device/touch_actions>)> swipe start_x: start_x, start_y: start_y, offset_x: 0, offset_y: - 50
    # [debug] [WebDriverAgent] Sim: Jan 14 16:35:05 rrcs-172-254-99-35 CoreSimulatorBridge[65868]: KEYMAP: Chose mode=en_US@hw=Automatic;sw=QWERTY from match=en_US@hw=Automatic;sw=QWERTY from language=en
    # [HTTP] --> POST /wd/hub/session/cd65fa75-cbd7-4348-a7d6-60cbde28db47/touch/perform {"actions":[{"action":"press","options":{"x":187,"y":201}},{"action":"wait","options":{"ms":200}},{"action":"moveTo","options":{"x":0,"y":-50}},{"action":"release"}]}
    # [debug] [MJSONWP] Calling AppiumDriver.performTouch() with args: [[{"action":"press","options":{"x":187,"y":201}},{"action":"wait","options":{"ms":200}},{"action":"moveTo","options":{"x":0,"y":-50}},{"action":"release"}],"cd65fa75-cbd7-4348-a7d6-60cbde28db47"]
    # [debug] [XCUITest] Executing command 'performTouch'
    # [debug] [XCUITest] Received the following touch action: press-wait-moveTo-release
    # [debug] [JSONWP Proxy] Proxying [POST /uiaTarget/0/dragfromtoforduration] to [POST http://localhost:8100/session/0D2991FB-A997-4D6C-94FC-D65CC252EC4B/uiaTarget/0/dragfromtoforduration] with body: {"fromX":187,"fromY":201,"toX":187,"toY":151,"duration":0.2}
    # [debug] [WebDriverAgent] Sim: Jan 14 16:35:05 rrcs-172-254-99-35 CoreSimulatorBridge[65868]: Switching to keyboard: en
    #
    # Example for iOS's log with Instruments
    # [0] pry(#<device/touch_actions>)> swipe start_x: start_x, start_y: start_y, offset_x: 0, offset_y: - 50, duration: 1000
    # [HTTP] <-- POST /wd/hub/session/8b651f03-0fbc-43f0-aaf2-243d0650f6aa/touch/perform 200 2048 ms - 74
    # [HTTP] --> POST /wd/hub/session/8b651f03-0fbc-43f0-aaf2-243d0650f6aa/touch/perform {"actions":[{"action":"press","options":{"x":187,"y":201.078125}},{"action":"wait","options":{"ms":1000}},{"action":"moveTo","options":{"x":0,"y":-50}},{"action":"release"}]}
    # [debug] [MJSONWP] Calling AppiumDriver.performTouch() with args: [[{"action":"press","options":{"x":187,"y":201.078125}},{"action":"wait","options":{"ms":1000}},{"action":"moveTo","options":{"x":0,"y":-50}},{"action":"release"}],"8b651f03-0fbc-43f0-aaf2-243d0650f6aa"]
    # [debug] [iOS] Executing iOS command 'performTouch'
    # [debug] [UIAuto] Sending command to instruments: au.dragApp(187, 201.078125, 187, 151.078125, 1)
    # [debug] [Instruments] [INST] 2017-01-14 08:22:57 +0000 Debug: Got new command 12 from instruments: au.dragApp(187, 201.078125, 187, 151.078125, 1)
    # [debug] [Instruments] [INST] 2017-01-14 08:22:57 +0000 Debug: evaluating au.dragApp(187, 201.078125, 187, 151.078125, 1)
    # [debug] [Instruments] [INST] 2017-01-14 08:22:57 +0000 Debug: target.dragFromToForDuration({x:"187", y:"201.078125"}, {x:"187", y:"151.078125"}, "1")
    # [debug] [Instruments] [INST] 2017-01-14 08:22:58 +0000 Debug: evaluation finished
    # [debug] [Instruments] [INST] 2017-01-14 08:22:58 +0000 Debug: responding with:
    # [debug] [UIAuto] Socket data received (25 bytes)
    # [debug] [UIAuto] Got result from instruments: {"status":0,"value":""}
    # [debug] [MJSONWP] Responding to client with driver.performTouch() result: ""
    # [HTTP] <-- POST /wd/hub/session/8b651f03-0fbc-43f0-aaf2-243d0650f6aa/touch/perform 200 1895 ms - 74
    # rubocop:enable Metrics/LineLength
    swipe start_x: start_x, start_y: start_y, offset_x: 0, offset_y: - 50
    ele_index(UI::Inventory.static_text, 2).text.must_equal 'Chris Armstrong - 0'
  end

  t 'swipe_coordinates_end_x_end_y' do
    s = Appium::TouchAction.new.swipe_coordinates(offset_x: 1, offset_y: 2)
    s[:offset_x].must_equal 1
    s[:offset_y].must_equal 2
  end

  t 'swipe_coordinates_end_x' do
    s = Appium::TouchAction.new.swipe_coordinates(offset_x: 1)
    s[:offset_x].must_equal 1
    s[:offset_y].must_equal 0
  end

  t 'swipe_coordinates_end_y' do
    s = Appium::TouchAction.new.swipe_coordinates(offset_y: 1)
    s[:offset_x].must_equal 0
    s[:offset_y].must_equal 1
  end

  t 'swipe_coordinates_offset' do
    s = Appium::TouchAction.new.swipe_coordinates
    s[:offset_x].must_equal 0
    s[:offset_y].must_equal 0
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
