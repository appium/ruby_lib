describe 'device/device' do
  def before_first
    screen.must_equal catalog
  end

  # go back to the main page
  def go_back
    back
    wait { !exists { id 'ArrowButton'  } } # successfully transitioned back
  end

  t 'before_first' do
    before_first
  end

  t 'app_installed' do
    installed = app_installed? 'Derrp'
    installed.must_equal false
  end

  t 'background_app homescreen' do
    background_app(-1) # background_app(nil) should work as same.

    # The app goes to background and never come back
    proc { screen }.must_raise ::Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'reset' do
    reset
  end

  t 'app_strings' do
    app_strings.must_include 'SearchBarExplain'
    app_strings('en').must_include 'SearchBarExplain'
  end

  t 'action_chain' do
    if automation_name_is_xcuitest?
      element = text(app_strings['ButtonsExplain'])
      tap(x: 0, y: 0, element: element)
    else
      Appium::TouchAction.new.press(element: text(app_strings['ButtonsExplain'])).perform
    end

    wait { text 'Back' } # successfully transitioned to buttons page
    go_back
  end

  t 'swipe' do
    touch_action = Appium::TouchAction.new.swipe(start_x: 75, start_y: 500,
                                                 offset_x: 75, offset_y: 20, duration: 500).perform
    touch_action.actions.must_equal []

    touch_action = Appium::TouchAction.new.swipe(start_x: 75, start_y: 500, offset_x: 75, offset_y: 20, duration: 500)

    touch_action.actions[0][:action].must_equal :press
    touch_action.actions[0][:options].must_equal(x: 75, y: 500)

    touch_action.actions[1][:action].must_equal :wait,
                                                touch_action.actions[1][:options].must_equal(ms: 500)

    touch_action.actions[2][:action].must_equal :moveTo
    touch_action.actions[2][:options].must_equal(x: 75, y: 20)

    touch_action.actions[3][:action].must_equal :release

    touch_action.perform
    touch_action.actions.must_equal []
  end
end
