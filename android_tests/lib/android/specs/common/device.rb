describe 'common/device' do
  # Not yet implemented
  t 'shake' do
    # todo: write test
  end

  t 'remove & install' do
    # todo: write test
    #remove 'com.example.android.apis'
    #install ENV['APP_PATH']
  end

  t 'background_app' do
    background_app 5
  end

  t 'is_installed' do
    is_installed?('fake_app').must_equal false
  end

  t 'reset' do
    reset
    s_text(1).text.must_equal 'API Demos'
  end

  t 'close & launch' do
    closeApp
    launch
  end

  t 'current_activity' do
    current_activity.must_equal '.ApiDemos'
  end

  t 'available_contexts' do
    available_contexts.must_equal ["NATIVE_APP"]
  end

  t 'current_context' do
    current_context.must_equal "NATIVE_APP"
  end

  t 'current_context=' do
    current_context= "WEBVIEW"
    current_context.must_equal "WEBVIEW"
  end

  t 'within_context' do
    $driver.within_context "NATIVE_APP" do
      current_context.must_equal "NATIVE_APP"
    end
  end

  t 'switch_to_default_context' do
    switch_to_default_context
    current_context.must_equal 'NATIVE_APP'
  end

  t 'app_strings' do
    strs = app_strings
    strs.has_key?("activity_save_restore").must_equal true
  end

  t 'complex_find' do
    act = complex_find [[3, 'Accessibility'], [14, true]]
    act.class.must_equal Selenium::WebDriver::Element
  end

  t 'key_event' do
    key_event key: 176
  end

  t 'action_chain' do
    e = find_element(:name, "Accessibility")
    Appium::TouchAction.new.press(:element => e, x: 0.5, y: 0.5).release(:element => e).perform
    sleep 2
    find_element(:name, "Custom View")
    back
  end

  t 'swipe' do
    Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.75, end_y: 0.5, duration: 1.5).perform
  end

  t 'pinch & zoom' do
    s_text('Graphics').click
    s_text('BitmapMesh').click
    zoom 200
    pinch 75
  end

  t 'push and pull file' do
    file = "A Fine Day"
    path = "/data/local/tmp/remote.txt"
    push_file path, file
    read_file = pull_file path
    read_file.must_equal file
  end
end