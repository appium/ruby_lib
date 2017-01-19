# rake ios[ios/patch]
describe 'ios/patch' do
  def before_first
    screen.must_equal catalog
    go_to_textfields
  end

  def after_last
    leave_textfields
  end

  t 'before_first' do
    before_first
  end

  t 'label' do
    textfield('<enter text>').label.must_equal 'Rounded'
  end

  t 'type' do
    # nav to textfield
    text('textfields').click

    ele = first_textfield

    ele.clear
    ele.type 'ok'
    ele.text.must_equal 'ok'
  end

  t 'after_last' do
    after_last
  end
end
