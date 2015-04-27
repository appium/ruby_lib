# rake android['android/element/button']
describe 'android/element/button' do
  def before_first
    # nav to buttons activity
    wait { find('App').click }
    wait { find('Activity').click }
    wait { find('Animation').click }
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
    2.times { wait { button(1).name.must_equal fade_in } }

    # by name contains
    wait { button('ade').name.must_equal fade_in }
  end

  t 'buttons' do
    exp = ['Zoom in', 'Modern zoom in', 'Thumbnail zoom']
    wait { buttons('zoom').map(&:text).must_equal exp }
    wait { buttons.length.must_equal 6 }
  end

  t 'first_button' do
    wait { first_button.name.must_equal fade_in }
  end

  t 'last_button' do
    wait { last_button.name.must_equal 'Thumbnail zoom' }
  end

  t 'button_exact' do
    wait { button_exact(fade_in).name.must_equal fade_in }
  end

  t 'buttons_exact' do
    2.times { wait { buttons_exact(fade_in).first.name.must_equal fade_in } }
  end

  t { after_last }
end
