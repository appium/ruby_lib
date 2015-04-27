# rake ios[ios/element/alert]
describe 'ios/element/alert' do
  def nav_once
    screen.must_equal catalog
    wait_true do
      text('alerts').click
      tag('UIANavigationBar').name == 'Alerts' # wait for true
    end

    tag('UIANavigationBar').name.must_equal 'Alerts'

    # redefine method as no-op after it's invoked once
    self.class.send :define_method, :nav_once, proc {}
  end

  def after_last
    alert_accept if exists { text('UIActionSheet <title>') }
    back_click
    screen.must_equal catalog
    sleep 1
  end

  before do
    nav_once
    open_alert
  end

  def open_alert
    wait_true do
      return true if exists { text('UIActionSheet <title>') }
      text('Show OK-Cancel').click
      text('UIActionSheet <title>').displayed?
    end
  end

  t 'alert_accept' do
    alert_accept
  end

  t 'alert_dismiss' do
    alert_dismiss
  end

  t 'after_last' do
    after_last
  end
end
