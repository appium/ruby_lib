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
    wait { s_text(1).text.must_equal 'API Demos' }
  end

  t 'close & launch' do
    close_app
    launch
  end

  t 'current_activity' do
    wait { current_activity.must_equal '.ApiDemos' }
  end

  t 'available_contexts' do
    wait { available_contexts.must_equal ['NATIVE_APP'] }
  end

  t 'current_context' do
    wait { current_context.must_equal 'NATIVE_APP' }
  end

  t 'set_context' do
    wait do
      Appium::TouchAction.swipe(start_x: 0.5, start_y: 0.0, end_x: 0.5, end_y: 1)
      scroll_to "Views"
      last_s_text.click
      scroll_to 'WebView'
      last_s_text.click
      set_context 'WEBVIEW'
      current_context.must_equal 'WEBVIEW_1'
    end
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
  end

  t 'app_strings' do
    wait do
      strs = app_strings
      strs.has_key?('activity_save_restore').must_equal true
    end
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

  t 'key_event' do
    key_event 176
  end

  t 'action_chain' do
    wait do
      e = find_element(:name, 'Accessibility')
      Appium::TouchAction.new.press(:element => e, x: 0.5, y: 0.5).release(:element => e).perform
    end
    wait { find_element(:name, 'Custom View') }
    back
    wait { s_text_exact 'NFC' }
  end

  t 'swipe' do
    wait { Appium::TouchAction.new.swipe(start_x: 0.75, start_y: 0.25, end_x: 0.75, end_y: 0.5, duration: 1.5).perform }
    wait { ! exists { s_text_exact 'NFC' } }
    back
    wait { s_text_exact 'NFC' }
  end

  t 'pinch & zoom' do
    wait { s_text_exact 'NFC' }
    wait { s_text_exact('Graphics').click }
    wait { s_text('BitmapMesh').click }
    wait do
      zoom 200
      pinch 75
    end
  end

  t 'push and pull file' do
    wait do
      file = "A Fine Day"
      path = "/data/local/tmp/remote.txt"
      push_file path, file
      read_file = pull_file path
      read_file.must_equal file
    end
  end
end