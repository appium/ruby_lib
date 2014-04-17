# encoding: utf-8

describe 'ios/patch' do
  before_first do
    screen.must_equal catalog
    go_to_textfields
  end

  after_last { leave_textfields }

  t 'type' do
    # nav to textfield
    s_text('textfields').click

    ele = first_textfield
    ele.type 'ok'
    ele.text.must_equal 'ok'
  end
end