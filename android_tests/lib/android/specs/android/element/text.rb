# rake android['android/element/text']
describe 'android/element/text' do
  def must_raise_no_element
    proc { yield }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'text' do
    wait { ['API Demos', "Access'ibility"].must_include text(1).text }
    wait { text('mos').text.must_equal 'API Demos' }
  end

  t 'texts' do
    wait { texts('i').length.must_equal 7 }
    wait { texts.length.must_equal 13 }
  end

  t 'first_text' do
    wait { ['API Demos', "Access'ibility"].must_include first_text.text }
  end

  t 'last_text' do
    wait { ['API Demos', 'Views'].must_include last_text.text }
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
