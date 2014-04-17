# encoding: utf-8
# rake ios[ios/element/alert]
describe 'ios/element/alert' do

  before_first do
    screen.must_equal catalog
    wait_true { s_text('alerts').click; tag('navigationBar').name == 'Alerts' } # wait for true
    tag('navigationBar').name.must_equal 'Alerts'
  end

  after_last do
    back_click
    screen.must_equal catalog
    mobile :flick, endX: 0.5, endY: 0.9
    sleep 1
  end

  before do
    open_alert
  end

  def open_alert
    wait_true { s_text('Show OK-Cancel').click; alert_accept_text == 'OK' }
  end

  def ios7_alert_detected
    # iOS 7 doesn't use the standard .alert() method
    execute_script 'UIATarget.localTarget().frontMostApp().alert().isNil()'
  end

  # UIAlertView
  t 'alert_click' do
    if ios7_alert_detected
      # iOS 7 is not using the alert methods anymore so alert_click
      # is not possible to implement in a meaningful way
      # for this test, we're going to skip testing alert_click on iOS 7
      alert_accept
    else
      alert_click 'OK'
    end
  end

  t 'alert_text' do
    if ios7_alert_detected
      # iOS 7 is not using the alert methods anymore so alert_text
      # is not possible to implement in a meaningful way
      # for this test, we're going to skip testing alert_text on iOS 7
      alert_accept
    else
      alert_text.must_equal 'UIAlertView'
      alert_accept
    end
  end

  t 'alert_accept' do
    alert_accept
  end

  t 'alert_accept_text' do
    alert_accept_text.must_equal 'OK'
    alert_accept
  end

  t 'alert_dismiss' do
    alert_dismiss
  end

  t 'alert_dismiss_text' do
    alert_dismiss_text.must_equal 'Cancel'
    alert_dismiss
  end
end