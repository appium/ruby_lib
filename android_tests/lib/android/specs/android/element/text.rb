# rake android['android/element/text']
describe 'android/element/text' do

  def must_raise_no_element &block
    proc { block.call }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 's_text' do
    s_text(1).text.must_equal 'API Demos'
    s_text('mos').text.must_equal 'API Demos'
  end

  t 's_texts' do
    s_texts('i').length.must_equal 6
  end

  t 'first_s_text' do
    first_s_text.text.must_equal 'API Demos'
  end

  t 'last_s_text' do
    last_s_text.text.must_equal 'Views'
  end

  t 's_text_exact' do
    must_raise_no_element { s_text_exact 'mos' }

    # should pass
    s_text_exact('API Demos').text.must_equal 'API Demos'
  end

  t 's_texts_exact' do
    s_texts_exact('API Demos').length.must_equal 1
  end

  t 'e_s_texts' do
    e_s_texts.length.must_equal 12
  end
end