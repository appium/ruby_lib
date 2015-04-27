# rake android[android/element/alert]
describe 'android/element/alert' do
  def open_alert
    # trigger the alert
    wait { button('OK Cancel dialog with a message').click }
  end

  t 'alert_click' do
    # nav to alert activity
    wait { find('app').click }
    wait { find('alert').click }

    # test
    wait { open_alert }
    wait { alert_click('OK') }
  end

  t 'alert_accept' do
    wait { open_alert }
    wait { alert_accept }
  end

  t 'alert_accept_text' do
    wait { open_alert }
    wait { alert_accept_text.must_equal 'OK' }
    wait { alert_accept }
  end

  t 'alert_dismiss' do
    wait { open_alert }
    wait { alert_dismiss }
  end

  t 'alert_dismiss_text' do
    wait { open_alert }

    # alert dialog button placement changed:
    # 'OK Cancel dialog with a long message'
    # Android L: 'Something, Cancel, Ok'
    # Android 19: 'Cancel, Something, Ok'

    wait { alert_dismiss_text.must_equal 'Cancel' }
    wait { alert_dismiss }

    # nav to start activity
    2.times { back }
  end
end
