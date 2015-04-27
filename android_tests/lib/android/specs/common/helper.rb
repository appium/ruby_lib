describe 'common/helper' do
  wait_opts = { timeout: 0.2, interval: 0.2 } # max_wait, interval

  # There's no `must_not_raise` as the opposite of must_raise

  # By default code is expected to not raise exceptions.
  # must_not_raise is a no-op.

  # wait is a success unless an error is raised
  # max_wait=0 is infinity to use 0.1
  t 'wait' do
    # successful wait should not raise error
    wait(wait_opts) { true }
    wait(wait_opts) { false }
    wait(wait_opts) { nil }

    # failed wait should error
    proc { wait(wait_opts) { fail } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait(wait_opts) { fail NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait(timeout: 0.2, interval: 0.0) { fail NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # invalid keys are rejected
    proc { wait(invalidkey: 2) { true } }.must_raise RuntimeError
  end

  t 'ignore' do
    # ignore should rescue all exceptions
    ignore { true }
    ignore { false }
    ignore { nil }
    ignore { fail }
    ignore { fail NoMemoryError }
  end

  # wait_true is a success unless the value is not true
  t 'wait_true' do
    # successful wait should not error
    wait_true(wait_opts) { true }

    # failed wait should error
    proc { wait_true(wait_opts) { false } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait_true(wait_opts) { nil } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # raise should error
    proc { wait_true(wait_opts) { fail } }.must_raise Selenium::WebDriver::Error::TimeOutError

    # regular rescue will not handle exceptions outside of StandardError hierarchy
    # must rescue Exception explicitly to rescue everything
    proc { wait_true(wait_opts) { fail NoMemoryError } }.must_raise Selenium::WebDriver::Error::TimeOutError
    proc { wait_true(timeout: 0.2, interval: 0.0) { fail NoMemoryError } }
      .must_raise Selenium::WebDriver::Error::TimeOutError

    # invalid keys are rejected
    proc { wait_true(invalidkey: 2) { true } }.must_raise RuntimeError
  end

  t 'back' do
    # start page
    wait { texts.length.must_equal 13 }
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
    wait { session_id.must_match(/\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/) }
  end

  t 'xpath' do
    wait { xpath('//android.widget.TextView').name.must_equal 'API Demos' }
  end

  t 'xpaths' do
    wait { xpaths('//android.widget.TextView').length.must_equal 13 }
  end

  t 'ele_index' do
    wait { ele_index('android.widget.TextView', 3).name.must_equal 'Accessibility' }
  end

  t 'tags' do
    wait { tags('android.widget.TextView').length.must_equal 13 }
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
