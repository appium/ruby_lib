describe 'android/element/generic' do
  def m method
    r = method(method).call 'tent'
    r = r.first if r.kind_of? Array
    r.class.must_equal Selenium::WebDriver::Element
    r.text.must_equal 'Content'
  end

  t 'find' do
    m :find
  end

  t 'tag' do
    tag 'TextView'
  end

  t 'tags' do
    tags('TextView').length
  end

  t 'text' do
    m :text
  end

  t 'texts' do
    m :texts
  end

  t 'name' do
    m :name
  end

  t 'name_exact' do
    name_exact 'App'
  end

  t 'names' do
    names('a').length.must_be :>=, 5
  end

  t 'scroll_to' do
    text('Views').click
    e = scroll_to 'rotating button'
    e.text.must_equal 'Rotating Button'
    # back to start activity
    back
  end

  t 'scroll_to_exact' do
    text('Views').click
    e = scroll_to_exact 'Rotating Button'
    e.text.must_equal 'Rotating Button'
    # back to start activity
    back
  end

  t 'mobile find works before and after source' do
    m :text
    get_source.class.must_equal Hash
    m :text
  end
end