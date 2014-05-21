describe 'common/helper' do
  wait_time = [0.2, 0.2] # max_wait, interval

  # wait is a success unless an error is raised
  # max_wait=0 is infinity to use 0.1
  t 'wait' do
    # successful wait should not raise error
    wait(*wait_time) { true }
    wait(*wait_time) { false }
    wait(*wait_time) { nil }

    # failed wait should error
    proc { wait(*wait_time) { raise } }.must_raise Timeout::Error

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait(*wait_time) { raise NoMemoryError } }.must_raise Timeout::Error
    proc { wait(0.2, 0.0) { raise NoMemoryError } }.must_raise Timeout::Error
  end

  t 'ignore' do
    # ignore should rescue all exceptions
    ignore { true }
    ignore { false }
    ignore { nil }
    ignore { raise }
    ignore { raise NoMemoryError }
  end

  # wait_true is a success unless the value is not true
  t 'wait_true' do
    # successful wait should not error
    wait_true(*wait_time) { true }

    # failed wait should error
    proc { wait_true(*wait_time) { false } }.must_raise Timeout::Error
    proc { wait_true(*wait_time) { nil } }.must_raise Timeout::Error

    # raise should error
    proc { wait_true(*wait_time) { raise } }.must_raise Timeout::Error

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait_true(*wait_time) { raise NoMemoryError } }.must_raise Timeout::Error
    proc { wait_true(0.2, 0.0) { raise NoMemoryError } }.must_raise Timeout::Error
  end

  t 'back' do
    # start page
    wait { texts.length.must_equal 12 }
    # nav to new page.
    # ele 0 is the title and can't be clicked.
    wait { text(2).click }
    wait { texts.length.must_equal 5 }
    # go back
    back
    # start page
    wait { find 'NFC' }
  end

  t 'session_id' do
    wait { session_id.must_match /\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/ }
  end

  t 'xpath' do
    wait { xpath('//android.widget.TextView').name.must_equal 'API Demos' }
  end

  t 'xpaths' do
    wait { xpaths('//android.widget.TextView').length.must_equal 12 }
  end

  t 'ele_index' do
    wait { ele_index('android.widget.TextView', 2).name.must_equal 'Accessibility' }
  end

  t 'tags' do
    wait { tags('android.widget.TextView').length.must_equal 12 }
  end

  t 'find_ele_by_attr_include' do
    wait do
      el_text = find_ele_by_attr_include('android.widget.TextView', :text, 'acc').text
      el_text.must_equal 'Accessibility'
    end
  end

  t 'find_eles_by_attr_include' do
    wait do
      ele_count = find_eles_by_attr_include('android.widget.TextView', :text, 'e').length
      ele_count.must_equal 7
    end
  end

  t 'first_ele' do
    wait do
      first_ele('android.widget.TextView').text.must_equal 'API Demos'
    end
  end

  t 'last_ele' do
    wait do
      last_ele('android.widget.TextView').text.must_equal 'Views'
    end
  end

  # t 'source' do # tested by get_source

  t 'get_source' do
    wait do
      get_source.class.must_equal String
    end
  end
end