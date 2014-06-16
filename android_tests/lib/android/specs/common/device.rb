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
    wait { background_app 5 }
  end

  t 'is_installed' do
    wait { is_installed?('fake_app').must_equal false }
  end

  t 'reset' do
    reset
    wait { text(1).text.must_equal 'API Demos' }
  end

  t 'close & launch' do
    close_app
    launch
  end

  t 'current_activity' do
    wait { current_activity.must_equal '.ApiDemos' }
  end

  # appium's context support is broken on android

  t 'available_contexts' do
    wait_true { available_contexts.include? 'NATIVE_APP' }
  end

  t 'current_context' do
    wait { current_context.must_equal 'NATIVE_APP' }
  end

  t 'set_context' do
    wait { scroll_to('Views').click }
    wait { scroll_to('WebView').click }

    webview_context = available_contexts.detect { |e| e.start_with?('WEBVIEW') }

    wait { set_context webview_context }
    wait { current_context.must_equal webview_context }

    wait { set_context 'NATIVE_APP' }
    wait { current_context.must_equal 'NATIVE_APP' }

    2.times { back; sleep 1 }
  end

  t 'within_context' do
    $driver.within_context 'NATIVE_APP' do
      wait { current_context.must_equal 'NATIVE_APP' }
    end
  end

  t 'switch_to_default_context' do
    wait do
      switch_to_default_context
      current_context.must_equal 'NATIVE_APP'
    end

    wait { set_context 'NATIVE_APP' }
    wait { current_context.must_equal 'NATIVE_APP' }
  end

  t 'app_strings' do
    wait_true { app_strings.has_key? 'activity_save_restore' }
  end

  def must_return_element element
    element.class.must_equal Selenium::WebDriver::Element
  end

  t 'complex_find' do
    wait { find('Views').click }
    wait { must_return_element complex_find(mode: 'scroll', selectors: [[[3, 'tabs']]]) }
    wait { must_return_element complex_find(mode: 'all', selectors: [[[3, 'i']]]).first }
    wait { must_return_element complex_find(selectors: [[[3, 'tabs']]]) }
    back
  end

  t 'press_keycode' do
    # http://developer.android.com/reference/android/view/KeyEvent.html
    press_keycode 176
  end

  t 'long_press_keycode' do
    # http://developer.android.com/reference/android/view/KeyEvent.html
    long_press_keycode 176
  end

  t 'action_chain' do
    wait do
      e = find_element(:name, 'Accessibility')
      Appium::TouchAction.new.press(:element => e, x: 0.5, y: 0.5).release(:element => e).perform
    end
    wait { find_element(:name, 'Custom View') }
    back
    wait { text_exact 'NFC' }
  end

  t 'swipe' do
    wait { Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.75, end_y: 0.5, duration: 1.5).perform }
    wait { !exists { text_exact 'NFC' } }
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
  end

  t 'push and pull file' do
    file = 'A Fine Day'
    path = '/data/local/tmp/remote.txt'
    wait do
      push_file path, file
      read_file = pull_file path
      read_file.must_equal file
    end
  end
end