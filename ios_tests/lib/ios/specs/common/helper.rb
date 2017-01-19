# rake ios[common/helper]
describe 'common/helper.rb' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  wait_opts = { timeout: 0.2, interval: 0.2 } # max_wait, interval

  # There's no `must_not_raise` as the opposite of must_raise
  #
  # By default code is expected to not raise exceptions.
  # must_not_raise is a no-op.

  # wait is a success unless an error is raised
  # max_wait=0 is infinity to use 0.1
  t 'wait' do
    # successful wait should not raise error
    wait(wait_opts) { true }
    wait(wait_opts) { false }
    wait(wait_opts) { nil }

    # failed wait should error
    proc { wait(wait_opts) { raise } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait(wait_opts) { raise NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait(timeout: 0.2, interval: 0.0) { raise NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # invalid keys are rejected
    proc { wait(invalidkey: 2) { true } }.must_raise RuntimeError
  end

  t 'ignore' do
    # ignore should rescue all exceptions
    ignore { true }
    ignore { false }
    ignore { nil }
    ignore { raise }
    ignore { raise NoMemoryError }
  end

  # wait_true is a success unless the value is not true
  t 'wait_true' do
    # successful wait should not error
    wait_true(wait_opts) { true }

    # failed wait should error
    proc { wait_true(wait_opts) { false } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait_true(wait_opts) { nil } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # raise should error
    proc { wait_true(wait_opts) { raise } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait_true(wait_opts) { raise NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait_true(timeout: 0.2, interval: 0.0) { raise NoMemoryError } }
      .must_raise Selenium::WebDriver::Error::TimeOutError

    # invalid keys are rejected
    proc { wait_true(invalidkey: 2) { true } }.must_raise RuntimeError
  end

  # t 'id' # id is for Selendroid

  t 'back' do
    # start page
    tag(UI::Inventory.navbar).name.must_equal 'UICatalog'
    # nav to new page.
    wait_true do
      text('buttons').click
      tag(UI::Inventory.navbar).name == 'Buttons'
    end

    tag(UI::Inventory.navbar).name.must_equal 'Buttons'
    # go back
    back_click
    # start page
    tag(UI::Inventory.navbar).name.must_equal 'UICatalog'
  end

  t 'session_id' do
    # Sauce doesn't return '-' so make them optional.
    session_id.must_match(/\h{8}-?\h{4}-?\h{4}-?\h{4}-?\h{12}/)
  end

  t 'xpath' do
    xpath("//#{UI::Inventory.static_text}").name.must_equal 'UICatalog'
  end

  t 'xpaths' do
    xpaths("//#{UI::Inventory.static_text}").length.must_equal 25
  end

  def uibutton_text
    'Buttons'
  end

  t 'ele_index' do
    ele_index(UI::Inventory.static_text, 2).name.must_equal uibutton_text
  end

  # TODO: 'string_attr_exact'

  t 'find_ele_by_attr' do
    el_id = find_ele_by_attr(UI::Inventory.static_text, 'name', uibutton_text).instance_variable_get :@id
    el_id.must_match(/\d+/)
  end

  t 'find_eles_by_attr' do
    # '!' clears the input buffer in Pry so make sure there's
    # no space after the !
    set_wait 1
    # empty array returned when no match
    found = !find_eles_by_attr(UI::Inventory.static_text, 'name', uibutton_text).empty?
    found.must_equal true

    found = !find_eles_by_attr(UI::Inventory.static_text, 'name', 'zz').empty?
    found.must_equal false
    set_wait
  end

  # TODO: 'string_attr_include'

  t 'find_ele_by_attr_include' do
    el_text = find_ele_by_attr_include(UI::Inventory.static_text, :name, 'button').text
    el_text.must_equal uibutton_text

    el_name = find_ele_by_attr_include(UI::Inventory.static_text, :name, 'button').name
    el_name.must_equal uibutton_text
  end

  t 'find_eles_by_attr_include' do
    ele_count = find_eles_by_attr_include(UI::Inventory.static_text, :name, 'e').length
    expected = UI::Inventory.xcuitest? ? 20 : 19
    ele_count.must_equal expected
  end

  t 'first_ele' do
    first_ele(UI::Inventory.static_text).name.must_equal 'UICatalog'
  end

  t 'last_ele' do
    expected = 'Transitions'

    el = last_ele(UI::Inventory.static_text)
    el.text.must_equal expected
    el.name.must_equal expected
  end

  # t 'source' do # tested by get_source

  t 'get_source' do
    get_source.class.must_equal String
  end

  t 'invalid id should error' do
    proc { id 'does not exist' }.must_raise Selenium::WebDriver::Error::NoSuchElementError

    # resource id should error on ios
    proc { id 'android:id/text1' }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'tag' do
    tag(UI::Inventory.navbar).name.must_equal 'UICatalog'
  end

  t 'tags' do
    tags(UI::Inventory.table_cell).length.must_equal 12
  end

  t 'find_eles_by_attr_include' do
    find_eles_by_attr_include(UI::Inventory.static_text, 'name', 'Use').length.must_equal 7
  end

  t 'get_page_class' do
    # 8 local. 9 on sauce.
    get_page_class.split("\n").length.must_be :>=, 8
  end

  # TODO: write tests
  # page_class
  # px_to_window_rel
  # lazy_load_strings
  # xml_keys
  # xml_values
  # resolve_id
  # string_visible_contains
  # xpath_visible_contains
  # xpaths_visible_contains
  # string_visible_exact
  # xpath_visible_exact
  # xpaths_visible_exact
  # raise_no_element_error
end
