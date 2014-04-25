describe 'android/element/textfield' do
  def left
    'Left is best'
  end

  def right
    'Right is always right'
  end

  def before_first
    # nav to activity
    text('app').click
    text('activity').click
    text('custom title').click
  end

  def after_last
    # back to start
    3.times { back }
  end

  t { before_first }

  t 'textfields' do
    exp = [left, right]
    textfields.must_equal exp
  end

  t 'e_textfields' do
    e_textfields.length.must_equal 2
  end

  t 'first_textfield' do
    first_textfield.text.must_equal left
  end

  t 'last_textfield' do
    last_textfield.text.must_equal right
  end

  t 'textfield' do
    textfield('right').text.must_equal right
    textfield(1).text.must_equal left
  end

  t 'textfield_exact' do
    res = begin; textfield_exact 'zz'; rescue; end
    res.must_be_nil

    res = textfield_exact left
    res.text.must_equal left
  end

  t { after_last }
end