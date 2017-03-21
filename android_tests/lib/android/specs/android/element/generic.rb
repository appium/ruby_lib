# rake android['android/element/generic']
describe 'android/element/generic' do
  def content
    'Content'
  end

  def partial
    'tent'
  end

  t 'find works before and after get_source' do
    wait { find(partial).text.must_equal content }
    wait { get_source.class.must_equal String }
    wait { find(partial).text.must_equal content }
  end

  t 'find' do
    wait { find(partial).text.must_equal content }
  end

  t 'finds' do
    wait { finds(partial).first.text.must_equal content }
  end

  t 'find_exact' do
    wait { find_exact(content).text.must_equal content }
  end

  t 'finds_exact' do
    wait { finds_exact(content).first.text.must_equal content }
  end

  # scroll_to is broken
  t 'scroll_to' do
    wait { find('Views').click }
    wait { scroll_to('scrollbars').text.must_equal 'ScrollBars' }

    wait { find('ScrollBars').click }
    wait { text('style').click }
    wait { scroll_to('Developers', 1).text.must_include 'What would it take to build a better mobile phone?' }
    back
    back
    # back to start activity
    back
  end

  t 'scroll_to_exact' do
    wait { find('Views').click }

    wait { scroll_to_exact('ScrollBars').text.must_equal 'ScrollBars' }
    wait { find('ScrollBars').click }
    wait { text('style').click }
    back
    back
    # back to start activity
    back
  end
end
