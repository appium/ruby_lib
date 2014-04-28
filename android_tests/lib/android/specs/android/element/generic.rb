# rake android['android/element/generic']
describe 'android/element/generic' do

  def content
    'Content'
  end

  def partial
    'tent'
  end

  t 'find works before and after get_source' do
    find(partial).text.must_equal content
    get_source.class.must_equal String
    find(partial).text.must_equal content
  end

  t 'find' do
    find(partial).text.must_equal content
  end

  t 'finds' do
    finds(partial).first.text.must_equal content
  end

  t 'find_exact' do
    find_exact(content).text.must_equal content
  end

  t 'finds_exact' do
    finds_exact(content).first.text.must_equal content
  end

  # scroll_to is broken
  t 'scroll_to' do
    find('Views').click
    e = scroll_to 'rotating button'
    e.text.must_equal 'Rotating Button'
    # back to start activity
    back
  end

  t 'scroll_to_exact' do
    find('Views').click
    e = scroll_to_exact 'Rotating Button'
    e.text.must_equal 'Rotating Button'
    # back to start activity
    back
  end
end