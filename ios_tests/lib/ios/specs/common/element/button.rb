# encoding: utf-8
# rake ios['common/element/button']
describe 'common/element/button' do
  def before_first
    screen.must_equal catalog
    # nav to buttons activity
    wait { name('buttons').click }
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
    exp = ['Back', 'Back', 'Gray', 'Right pointing arrow', 'Rounded', 'Custom Text', 'More info', 'More info', 'More info', 'Add contact']
    buttons.must_equal exp
  end

  t 'first_button' do
    first_button.name.must_equal 'Back'
  end

  t 'last_button' do
    last_button.name.must_equal 'Add contact'
  end

  t 'button_exact' do
    button_exact(gray).name.must_equal gray
  end

  t 'buttons_exact' do
    buttons_exact(gray).first.name.must_equal gray
  end

  t 'e_buttons' do
    e_buttons.length.must_equal 10
  end

  t 'button_num' do
    # select the second button containing 'in'
    button_num('in', 2).name.must_equal 'More info'
  end

  t 'after_last' do
    after_last
  end
end