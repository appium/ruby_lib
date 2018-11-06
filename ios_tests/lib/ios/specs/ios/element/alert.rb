# rake ios[ios/element/alert]
describe 'ios/element/alert' do
  def nav_once
    screen.must_equal catalog
    wait_true do
      automation_name_is_xcuitest? ? find_element(:name, 'Alerts').click : text('alerts').click
      tag(ui_ios.navbar).name == 'Alerts' # wait for true
    end
  end

  def after_last
    back_click
    screen.must_equal catalog
    sleep 1
  end

  def open_alert
    wait_true do
      if automation_name_is_xcuitest?
        find_element(:name, 'Show OK-Cancel').click
        find_element(:name, 'UIActionSheet <title>').displayed?
      else
        text('Show OK-Cancel').click
        text('UIActionSheet <title>').displayed?
      end
    end
  end

  t 'before' do
    nav_once
  end

  t 'alert_accept' do
    open_alert
    alert_accept
  end

  t 'alert_dismiss' do
    open_alert
    alert_dismiss
  end

  t 'after_last' do
    after_last
  end
end
