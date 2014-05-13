describe 'device/device' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'lock' do
    lock 5
    tag('UIAButton').name.must_equal 'SlideToUnlock'

    # It appears that lockForDuration doesn't.
    close_app
    launch
  end

  t 'background_app' do
    background_app 5
    screen.must_equal catalog
  end

  t 'is_installed' do
    installed = is_installed? "Derrp"
    installed.must_equal false
  end

  t 'shake' do
    shake
  end

  t 'close and launch' do
    close_app
    launch
    tag('UIANavigationBar').name.must_equal 'UICatalog'
  end

  t 'reset' do
    reset
  end

  t 'available_contexts' do
    available_contexts.must_equal ["NATIVE_APP"]
  end

  t 'current_context' do
    current_context.must_equal nil
  end

  t 'switch_to_default_context' do
    switch_to_default_context
    current_context.must_equal nil
  end

  t 'app_strings' do
    app_strings.must_include "SearchBarExplain"
    app_strings('en').must_include "SearchBarExplain"
  end

  t 'action_chain' do
    ac = Appium::TouchAction.new
    e  = find_element(:name, 'Buttons, Various uses of UIButton')
    ac.press element: e, x: 10, y: 10
    ac.perform
    back
  end

  t 'swipe' do
    swipe start_x: 75, start_y: 500, end_x: 75, end_y: 0, duration: 0.8
  end

  t 'pinch & zoom' do
    s_text('Images, Use of UIImageView').click
    zoom 200
    pinch 75
  end

  t 'file movement' do
    read_file = pull_file 'Library/AddressBook/AddressBook.sqlitedb'
    read_file.start_with?('SQLite format').must_equal true
  end
end