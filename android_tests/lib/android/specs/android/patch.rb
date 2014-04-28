describe 'android/patch.rb' do
  t 'type' do
    # nav to textfield
    find('app').click
    find('search').click
    find('invoke').click

    ele = first_textfield
    ele.type 'ok'
    ele.text.must_equal 'ok'

    # nav to start activity
    3.times { back }
  end
end