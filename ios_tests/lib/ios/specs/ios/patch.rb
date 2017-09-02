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
    textfields[1].label.must_equal 'Rounded'
  end

  t 'type' do
    text('textfields').click # nav to textfield

    ele = first_textfield

    ele.clear
    ele.type 'ok'
    ele.text.must_equal 'ok'
  end

  t 'after_last' do
    after_last
  end
end
