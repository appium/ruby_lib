# rake android['android/element/text']
describe 'android/element/text' do
  def must_raise_no_element(&block)
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'text' do
    wait { text(1).text.must_equal 'API Demos' }
    wait { text('mos').text.must_equal 'API Demos' }
  end

  t 'texts' do
    wait { texts('i').length.must_equal 7 }
    wait { texts.length.must_equal 13 }
  end

  t 'first_text' do
    wait { first_text.text.must_equal 'API Demos' }
  end

  t 'last_text' do
    wait { last_text.text.must_equal 'Views' }
  end

  t 'text_exact' do
    must_raise_no_element { text_exact 'mos' }

    # should pass
    wait { text_exact('API Demos').text.must_equal 'API Demos' }
  end

  t 'texts_exact' do
    wait { texts_exact('API Demos').length.must_equal 1 }
  end
end
