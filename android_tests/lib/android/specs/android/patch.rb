describe 'android/patch.rb' do
  t 'type' do
    # nav to textfield
    wait { find('app').click }
    wait { find('search').click }
    wait { find('invoke').click }

    wait { first_textfield.type 'ok' }
    wait { first_textfield.text.must_equal 'ok' }

    # nav to start activity
    3.times { back }
  end
end