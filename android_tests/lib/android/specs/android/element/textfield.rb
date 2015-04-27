describe 'android/element/textfield' do
  def must_raise_no_element(&block)
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
    wait { find('app').click }
    wait { find('activity').click }
    wait { find('custom title').click }
  end

  def after_last
    # back to start
    3.times { back }
  end

  t { before_first }

  t 'textfield' do
    wait { textfield(1).text.must_equal left }
    wait { textfield('right').text.must_equal right }
  end

  t 'textfields' do
    wait { textfields('right').first.text.must_equal right }
    wait { textfields.length.must_equal 2 }
  end

  t 'first_textfield' do
    wait { first_textfield.text.must_equal left }
  end

  t 'last_textfield' do
    wait { last_textfield.text.must_equal right }
  end

  t 'textfield_exact' do
    must_raise_no_element { textfield_exact 'zz' }
    wait { textfield_exact(left).text.must_equal left }
  end

  t 'textfields_exact' do
    wait { textfields_exact('zz').must_equal [] }
    wait { textfields_exact(left).first.text.must_equal left }
  end

  t 'hide_keyboard' do
    first_textfield.click
    hide_keyboard
  end

  t { after_last }
end
