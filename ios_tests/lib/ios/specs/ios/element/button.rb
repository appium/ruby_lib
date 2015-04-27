# rake ios['ios/element/button']
describe 'ios/element/button' do
  def before_first
    screen.must_equal catalog
    # nav to buttons activity
    wait { text('buttons').click }
  end

  def after_last
    # nav back to start
    back_click
  end

  t 'before_first' do
    before_first
  end

  def gray
    'Gray'
  end

  t 'button' do
    # by index
    button(3).name.must_equal gray

    # by name contains
    button('ray').name.must_equal gray
  end

  t 'buttons' do
    exp = ['Back', 'Back', 'Gray', 'Right pointing arrow']
    target_buttons = buttons('a')
    target_buttons.map(&:name).must_equal exp
    target_buttons.length.must_equal exp.length
  end

  t 'first_button' do
    first_button.name.must_equal 'Back'
  end

  t 'last_button' do
    last_button.name.must_equal 'Rounded'
  end

  t 'button_exact' do
    button_exact(gray).name.must_equal gray
  end

  t 'buttons_exact' do
    buttons_exact(gray).first.name.must_equal gray
  end

  t 'after_last' do
    after_last
  end
end
