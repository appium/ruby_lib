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
    swipe start_x: start_x, start_y: start_y, delta_x: 0, delta_y: - 50
    ele_index(UI::Inventory.static_text, 2).text.must_equal 'Chris Armstrong - 0'
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
