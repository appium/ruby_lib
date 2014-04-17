# encoding: utf-8
describe 'ios/element/textfield' do
  before_first { go_to_textfields }
  after_last { set_wait 30 }

  t 'textfields' do
    textfields.include?('<enter text>').must_equal true
    textfields.include?('<enter password>').must_equal true
  end

  t 'e_textfields' do
    e_textfields.length.must_equal 4
  end

  def enter_text
    '<enter text>'
  end

  t 'first_textfield' do
    first_textfield.text.must_equal enter_text
  end

  def enter_password
    '<enter password>'
  end

  t 'last_textfield' do
    last_textfield.text.must_equal enter_password
  end

  t 'textfield' do
    textfield(1).text.must_equal(enter_text)
    textfield(enter_text).text.must_equal(enter_text)
  end

  t 'textfield_include' do
    textfield_include('word').text.must_equal enter_password
  end

  t 'textfield_exact' do
    textfield_exact(enter_password).text.must_equal enter_password
  end

  def must_raise_no_element &block
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  # test textfield methods with no textfields
  t 'no textfields' do
    set_wait 1
    # must leave textfield screen for the rest of the tests
    leave_textfields
    textfields.must_equal []
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
end