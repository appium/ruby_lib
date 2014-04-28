describe 'android/element/textfield' do
  def must_raise_no_element &block
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  def left
    'Left is best'
  end

  def right
    'Right is always right'
  end

  def before_first
    # nav to activity
    find('app').click
    find('activity').click
    find('custom title').click
  end

  def after_last
    # back to start
    3.times { back }
  end

  t { before_first }

  t 'textfield' do
    textfield(1).text.must_equal left
    textfield('right').text.must_equal right
  end

  t 'textfields' do
    textfields('right').first.text.must_equal right
  end

  t 'first_textfield' do
    first_textfield.text.must_equal left
  end

  t 'last_textfield' do
    last_textfield.text.must_equal right
  end

  t 'textfield_exact' do
    must_raise_no_element { textfield_exact 'zz' }
    textfield_exact(left).text.must_equal left
  end

  t 'textfields_exact' do
    textfields_exact('zz').must_equal []
    textfields_exact(left).first.text.must_equal left
  end

  t 'e_textfields' do
    e_textfields.length.must_equal 2
  end

  t { after_last }
end