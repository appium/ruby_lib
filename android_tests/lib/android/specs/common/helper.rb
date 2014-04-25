describe 'common/helper' do
  # wait is a success unless an error is raised
  # max_wait=0 is infinity to use 0.1
  t 'wait' do
    # successful wait should not error
    message = nil
    begin
      wait(0.1,0) { true }
    rescue Exception => e
      message = e.message
    end
    message.must_equal nil

    # failed wait should error
    begin
      wait(0.3) { raise 'error' }
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'execution expired'
  end

  # wait_true is a success unless the value is not true
  t 'wait_true' do
    # successful wait should not error
    message = nil
    begin
      wait_true(0.1,0) { true }
    rescue Exception => e
      message = e.message
    end
    message.must_equal nil

    # failed wait should error
    begin
      wait_true(0.1,0) { false }
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'execution expired'
  end

  # t 'id' # id is for Selendroid

  t 'back' do
    # start page
    eles = e_s_texts
    eles.length.must_equal 12
    # nav to new page.
    # ele 0 is the title and can't be clicked.
    eles[1].click
    eles = e_s_texts
    eles.length.must_equal 5
    # go back
    back
    # start page
    text 'NFC'
  end

  t 'session_id' do
    session_id.must_match /\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/
  end

  t 'xpath' do
    xpath('//text').name.must_equal 'API Demos'
  end

  t 'xpaths' do
    xpaths('//text').length.must_equal 12
  end

  t 'ele_index' do
    ele_index('text', 2).name.must_equal 'Accessibility'
  end

  t 'find_eles' do
    find_eles('text').length.must_equal 12
  end

  t 'find_ele_by_text' do
    el_id = find_ele_by_text(:text, 'Accessibility').instance_variable_get :@id
    el_id.must_match /\d+/
  end

  t 'find_eles_by_text' do
    # '!' clears the input buffer in Pry so make sure there's
    # no space after the !
    # empty array returned when no match
    found = !find_eles_by_text(:text, 'App').empty?
    found.must_equal true

    found = !find_eles_by_text(:text, 'zz').empty?
    found.must_equal false
  end

  t 'find_ele_by_attr_include' do
    el_text = find_ele_by_attr_include(:text, :text,  'acc').text
    el_text.must_equal 'Accessibility'
  end

  t 'find_eles_by_attr_include' do
    ele_count = find_eles_by_attr_include(:text, :text,  'e').length
    ele_count.must_equal 7
  end

  t 'find_ele_by_text_include' do
    el_text = find_ele_by_text_include(:text, 'acc').text
    el_text.must_equal 'Accessibility'
  end

  t 'find_eles_by_text_include' do
    ele_count = find_eles_by_text_include(:text, 'e').length
    ele_count.must_equal 7
  end

  t 'first_ele' do
    first_ele(:text).text.must_equal 'API Demos'
  end

  t 'last_ele' do
    last_ele(:text).text.must_equal 'Views'
  end

  # t 'source' do # tested by get_source

  t 'get_source' do
    get_source.class.must_equal Hash
  end

  t 'find_name' do
    find_name('App').name.must_equal 'App'
  end

  t 'find_names' do
    find_names('App').first.name.must_equal 'App'
  end
end