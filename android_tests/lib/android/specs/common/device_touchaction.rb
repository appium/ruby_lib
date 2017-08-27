# rake android[common/device_touchaction]
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
    wait { Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.75, end_y: 50).perform }
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
