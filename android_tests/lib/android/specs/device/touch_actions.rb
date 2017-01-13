describe 'device/touch_actions' do
  def swipe_till_text_visible(seen_text)
    start_x = window_size[:width] / 2
    start_y = window_size[:height] / 2
    wait(60) do
      swipe start_x: start_x, start_y: start_y, offset_x: start_x, offset_y: start_y - 100
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
