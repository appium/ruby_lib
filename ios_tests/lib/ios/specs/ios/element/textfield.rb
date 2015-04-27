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

  t 'textfield' do
    textfield(1).text.must_equal(enter_text)
    textfield(enter_text).text.must_equal(enter_text)
    textfield('word').value.must_equal enter_password
  end

  t 'textfields' do
    values = textfields('enter').map(&:value)
    values.include?('<enter text>').must_equal true
    values.include?('<enter password>').must_equal true
    textfields.length.must_equal 4
  end

  t 'predicate textfields' do
    textfield_count = execute_script(%(au.mainApp().getAllWithPredicate("type contains[c] 'textfield'", true))).length
    textfield_count.must_equal 4
  end

  t 'first_textfield' do
    first_textfield.text.must_equal enter_text
  end

  t 'last_textfield' do
    last_textfield.text.must_equal enter_text
  end

  t 'textfield_exact' do
    textfield_exact(enter_password).value.must_equal enter_password
  end

  t 'textfields_exact' do
    textfields_exact(enter_password).first.value.must_equal enter_password
  end

  def keyboard_exists?
    !!ignore { wait_true(3) { execute_script 'au.mainApp().keyboard().type() !== "UIAElementNil"' } }
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

    # type should not dismiss the keyboard
    message = 'type test type'
    textfield(1).type message
    keyboard_must_exist
    textfield(1).text.must_equal message
  end

  def must_raise_no_element(&block)
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'hide_keyboard' do
    first_textfield.click
    hide_keyboard
  end

  # test textfield methods with no textfields

  t 'leave textfields' do
    set_wait 1
    leave_textfields
  end

  t 'no textfield' do
    must_raise_no_element { textfield(1) }
    must_raise_no_element { textfield('does not exist') }
  end

  t 'no textfields' do
    textfields('does not exist').length.must_equal 0
  end

  t 'no first_textfield' do
    must_raise_no_element { first_textfield }
  end

  t 'no last_textfield' do
    must_raise_no_element { last_textfield }
  end

  t 'no textfield_exact' do
    must_raise_no_element { textfield_exact('does not exist') }
  end

  t 'no textfields_exact' do
    textfields_exact('does not exist').length.must_equal 0
  end

  t 'after_last' do
    after_last
  end
end
