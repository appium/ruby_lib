# rake ios[ios/helper]
describe 'ios/helper' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'ios_password' do
    ios_password.must_equal 8226.chr('UTF-8')
    ios_password(2).must_equal 8226.chr('UTF-8') * 2
  end

  # TODO: t 'get_page' do

  # t 'page' do # writes to std out

  t 'source_window' do
    source_window.length.must_be :>=, 14_000
  end

  # TODO: t 'page_window' do

  t 'id' do
    id 'Buttons' # 'Various uses of UIButton'
  end

  t 'ios_version' do
    ios_version.wont_be_empty
  end

  t 'tags_include' do
    elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
    elements.length.must_be 24

    elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'u'
    elements.length.must_be 13
  end

  t 'tags_include' do
    elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
    elements.length.must_be 24

    elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'Buttons'
    elements.length.must_be 1
    elements.first.value.must_equal 'Buttons'
  end
end
