# encoding: utf-8
describe 'android/element/alert.rb' do
  def open_alert
    # trigger the alert
    button('OK Cancel dialog with a long message').click
  end

  t 'alert_click' do
    # nav to alert activity
    text('app').click
    text('alert').click

    # test
    open_alert
    alert_click('Something')
  end

  t 'alert_accept' do
    open_alert
    alert_accept
  end

  t 'alert_accept_text' do
    open_alert
    alert_accept_text.must_equal 'OK'
    alert_accept
  end

  t 'alert_dismiss' do
    open_alert
    alert_dismiss
  end

  t 'alert_dismiss_text' do
    open_alert
    alert_dismiss_text.must_equal 'Cancel'
    alert_dismiss

    # nav to start activity
    2.times { back }
  end
end