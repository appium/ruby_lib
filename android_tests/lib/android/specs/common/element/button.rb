# encoding: utf-8

describe 'common/element/button' do
  def before_first
    # nav to buttons activity
    text('App').click
    text('Activity').click
    text('Animation').click
  end

  def after_last
    # nav back to home activity
    3.times { back }
  end

  def fade_in
    'Fade in'
  end

  t { before_first }

  t 'button' do
    # by index
    button(1).name.must_equal fade_in

    # by name contains
    button('ade').name.must_equal fade_in
  end

  t 'buttons' do
    exp = ['Fade in', 'Zoom in', 'Modern fade in', 'Modern zoom in', 'Scale up', 'Thumbnail zoom']
    buttons.must_equal exp
  end

  t 'first_button' do
    first_button.name.must_equal fade_in
  end

  t 'last_button' do
    last_button.name.must_equal 'Thumbnail zoom'
  end

  t 'button_exact' do
    button_exact(fade_in).name.must_equal fade_in
  end

  t 'buttons_exact' do
    buttons_exact(fade_in).first.name.must_equal fade_in
  end

  t 'e_buttons' do
    e_buttons.length.must_equal 6
  end

  t 'button_num' do
    # select the second button containing 'in'
    button_num('in', 2).name.must_equal 'Zoom in'
  end

  t { after_last }
end