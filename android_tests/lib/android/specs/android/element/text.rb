# rake android['android/element/text']
describe 'android/element/text' do

  def must_raise_no_element &block
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 's_text' do
    wait { s_text(1).text.must_equal 'API Demos' }
    wait { s_text('mos').text.must_equal 'API Demos' }
  end

  t 's_texts' do
    wait { s_texts('i').length.must_equal 7 }
  end

  t 'first_s_text' do
    wait { first_s_text.text.must_equal 'API Demos' }
  end

  t 'last_s_text' do
    wait { last_s_text.text.must_equal 'Views' }
  end

  t 's_text_exact' do
    must_raise_no_element { s_text_exact 'mos' }

    # should pass
    wait { s_text_exact('API Demos').text.must_equal 'API Demos' }
  end

  t 's_texts_exact' do
    wait { s_texts_exact('API Demos').length.must_equal 1 }
  end

  t 'e_s_texts' do
    wait { e_s_texts.length.must_equal 14 }
  end
end