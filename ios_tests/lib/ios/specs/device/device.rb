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

  t 'device_time' do
    Date.parse(device_time)
  end

  t 'lock' do
    raise NotImplementedError, "XCUITest(Appium1.6.2) doesn't support yet" if UI::Inventory.xcuitest?

    lock 5
    tag(UI::Inventory.button).name.must_equal 'SlideToUnlock'

    # It appears that lockForDuration doesn't.
    close_app
    launch_app
  end

  t 'background_app' do
    background_app 5
    screen.must_equal catalog
  end

  t 'app_installed' do
    raise NotImplementedError, "XCUITest(Appium1.6.2) doesn't support yet" if UI::Inventory.xcuitest?

    installed = app_installed? 'Derrp'
    installed.must_equal false
  end

  t 'shake' do
    raise NotImplementedError, "XCUITest(Appium1.6.2) doesn't support yet" if UI::Inventory.xcuitest?

    shake
  end

  t 'close and launch' do
    close_app
    launch_app
    tag(UI::Inventory.navbar).name.must_equal 'UICatalog'
  end

  t 'reset' do
    reset
  end

  t 'available_contexts' do
    available_contexts.must_equal ['NATIVE_APP']
  end

  t 'current_context' do
    current_context.must_equal 'NATIVE_APP'
  end

  t 'switch_to_default_context' do
    switch_to_default_context
    current_context.must_equal 'NATIVE_APP'
  end

  t 'app_strings' do
    app_strings.must_include 'SearchBarExplain'
    app_strings('en').must_include 'SearchBarExplain'
  end

  t 'action_chain' do
    Appium::TouchAction.new.press(element: id('ButtonsExplain')).perform
    wait { id 'ArrowButton' } # successfully transitioned to buttons page
    go_back
  end

  t 'swipe' do
    swipe start_x: 75, start_y: 500, offset_x: 75, offset_y: 0, duration: 800
  end

  t 'pull_file' do
    # Selenium::WebDriver::Error::UnknownError: An unknown server-side error occurred while processing the command.
    # Original error: Cannot read property 'getDir' of undefined
    raise NotImplementedError, "XCUITest(Appium1.6.2) doesn't support yet" if UI::Inventory.xcuitest?

    read_file = pull_file 'Library/AddressBook/AddressBook.sqlitedb'
    read_file.start_with?('SQLite format').must_equal true
  end

  t 'pull_folder' do
    # Selenium::WebDriver::Error::UnknownError: An unknown server-side error occurred while processing the command.
    # Original error: Cannot read property 'getDir' of undefined
    raise NotImplementedError, "XCUITest(Appium1.6.2) doesn't support yet" if UI::Inventory.xcuitest?

    data = pull_folder 'Library/AddressBook'
    data.length.must_be :>, 1
  end
end
