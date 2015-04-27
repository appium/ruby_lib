# rake ios['ios/element/generic']
describe 'ios/element/generic' do
  def before_first
    screen.must_equal catalog
  end

  def uibutton_text
    'Buttons'
  end

  def verify(element)
    element = element.first if element.is_a? Array
    element.name.must_equal uibutton_text
  end

  t 'before_first' do
    before_first
  end

  t 'find' do
    verify find 'tons'
  end

  t 'finds' do
    verify finds 'tons'
  end

  t 'find_exact' do
    verify find_exact uibutton_text
  end

  t 'finds_exact' do
    verify finds_exact uibutton_text
  end
end
