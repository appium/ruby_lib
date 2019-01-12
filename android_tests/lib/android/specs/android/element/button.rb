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
    if automation_name_is_espresso?
      'Fade in'
    else
      'FADE IN'
    end
  end

  t { before_first }

  t 'button' do
    # by index
    2.times { wait { button(1).text.upcase.must_equal fade_in.upcase } }

    # by name contains
    wait { button('ade').text.upcase.must_equal fade_in.upcase }
  end

  t 'buttons' do
    exp = ['ZOOM IN', 'MODERN ZOOM IN', 'THUMBNAIL ZOOM']
    wait { buttons('zoom').map(&:text).map(&:upcase).must_equal exp }
    wait { buttons.length.must_equal 6 }
  end

  t 'first_button' do
    wait { first_button.text.upcase.must_equal fade_in.upcase }
  end

  t 'last_button' do
    wait { last_button.text.upcase.must_equal 'THUMBNAIL ZOOM' }
  end

  t 'button_exact' do
    wait { button_exact(fade_in).text.upcase.must_equal fade_in.upcase }
  end

  t 'buttons_exact' do
    2.times { wait { buttons_exact(fade_in).first.text.upcase.must_equal fade_in.upcase } }
  end

  t { after_last }
end
