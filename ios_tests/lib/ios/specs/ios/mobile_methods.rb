# rake ios[ios/command/pasteboard]
describe 'ios/command/pasteboard' do
  def before_first
    screen.must_equal catalog
  end

  t 'an element with class chain' do
    element = find_element :class_chain, 'XCUIElementTypeWindow/*/*/XCUIElementTypeStaticText'

    element.name.must_equal catalog
  end

  t 'elements with class chain' do
    elements = find_elements :class_chain, 'XCUIElementTypeWindow/*/*'

    elements.size.must_equal 4
    elements[0].name.must_equal catalog
    elements[1].name.must_be_nil
  end
end
