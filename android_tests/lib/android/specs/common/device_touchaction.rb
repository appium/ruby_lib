# rake android[common/device_touchaction]
describe 'common/device_touchaction' do
  t 'action_chain' do
    wait do
      e = find_element(:name, 'Accessibility')
      Appium::TouchAction.new.press(element: e, x: 0.5, y: 0.5).release(element: e).perform
    end
    wait { find_element(:name, 'Custom View') }
    back
    wait { text_exact 'NFC' }
  end

  t 'swipe' do
    wait { Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.75, end_y: 0.5, duration: 1.5).perform }
    wait { !exists { text_exact 'NFC' } }
    wait { text_exact 'Bouncing Balls' }
    back
    wait { text_exact 'NFC' }
  end

  t 'pinch & zoom' do
    wait { text_exact 'NFC' }
    wait { text_exact('Graphics').click }
    wait { text('BitmapMesh').click }
    wait do
      zoom 200
      pinch 75
    end
    2.times { back }
    wait { text_exact 'NFC' }
  end
end
