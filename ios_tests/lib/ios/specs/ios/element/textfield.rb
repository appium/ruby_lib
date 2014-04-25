# encoding: utf-8
# rake ios[ios/element/textfield]
describe 'ios/element/textfield' do
  def enter_text
    '<enter text>'
  end

  def enter_password
    '<enter password>'
  end

  def before_first
    go_to_textfields
  end

  def after_last
    set_wait 30
  end

  t 'before_first' do
    before_first
  end

  t 'e_textfields' do
    e_textfields.length.must_equal 4
  end

  t 'first_textfield' do
    first_textfield.text.must_equal enter_text
  end

  t 'last_textfield' do
    last_textfield.text.must_equal enter_password
  end

  t 'textfield' do
    textfield(1).text.must_equal(enter_text)
    textfield(enter_text).text.must_equal(enter_text)
  end

  t 'textfields' do
    values = textfields('enter').map { |e| e.value }
    values.include?('<enter text>').must_equal true
    values.include?('<enter password>').must_equal true
  end

  t 'textfield_include' do
    textfield_include('word').text.must_equal enter_password
  end

  t 'textfield_exact' do
    textfield_exact(enter_password).text.must_equal enter_password
  end

  def keyboard_exists?
    !! ignore { wait_true(3) { execute_script 'au.mainApp().keyboard().type() !== "UIAElementNil"' } }
  end

  def keyboard_must_not_exist
    keyboard_exists?.must_equal false
  end

  def keyboard_must_exist
    keyboard_exists?.must_equal true
  end

  t 'textfield type' do
    # Regular send keys triggers the keyboard and doesn't dismiss
    keyboard_must_not_exist
    textfield(1).send_keys 'ok'
    keyboard_must_exist

    # type will dismiss the keyboard
    message = 'type test type'
    textfield(1).type message
    keyboard_must_not_exist
    textfield(1).text.must_equal message
  end

  def must_raise_no_element &block
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  # test textfield methods with no textfields
  t 'no textfields' do
    set_wait 1
    # must leave textfield screen for the rest of the tests
    leave_textfields
    e_textfields.must_equal []
  end

  t 'no e_textfields' do
    e_textfields.length.must_equal 0
  end

  t 'no first_textfield' do
    must_raise_no_element { first_textfield }
  end

  t 'no last_textfield' do
    must_raise_no_element { last_textfield }
  end

  t 'no textfield' do
    must_raise_no_element { textfield(1) }
    must_raise_no_element { textfield('does not exist') }
  end

  t 'no textfield_include' do
    must_raise_no_element { textfield_include('does not exist') }
  end

  t 'no textfield_exact' do
    must_raise_no_element { textfield_exact('does not exist') }
  end

  t 'after_last' do
    after_last
  end
end