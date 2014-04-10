# encoding: utf-8

describe 'android/patch.rb' do
  t 'type' do
    # nav to textfield
    text('app').click
    text('search').click
    text('invoke').click

    ele = first_textfield
    ele.type 'ok'
    ele.text.must_equal 'ok'

    # nav to start activity
    3.times { back }
  end
end