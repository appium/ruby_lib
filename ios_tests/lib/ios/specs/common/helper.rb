# encoding: utf-8
# rake ios[common/helper]
describe 'common/helper.rb' do
  before_first { screen.must_equal catalog }
  wait_time = [0.2, 0.2] # max_wait, interval

=begin
There's no `must_not_raise` as the opposite of must_raise

By default code is expected to not raise exceptions.
must_not_raise is a no-op.
=end

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
    proc { wait(*wait_time) { raise NoMemoryError } }.must_raise Timeout::Error
  end

  t 'ignore' do
    # ignore should rescue all exceptions
    ignore { true }
    ignore { false }
    ignore { nil }
    ignore { raise }
    ignore { raise NoMemoryError }
  end

  # t 'id' # id is for Selendroid

  t 'back' do
    # start page
    tag('navigationBar').name.must_equal 'UICatalog'
    # nav to new page.
    wait_true { s_text('buttons').click; tag('navigationBar').name == 'Buttons' }
    tag('navigationBar').name.must_equal 'Buttons'
    # go back
    back_click
    # start page
    tag('navigationBar').name.must_equal 'UICatalog'
  end

  t 'session_id' do
    # Sauce doesn't return '-' so make them optional.
    session_id.must_match /\h{8}-?\h{4}-?\h{4}-?\h{4}-?\h{12}/
  end

  t 'xpath' do
    xpath('//text').name.must_equal 'UICatalog'
  end

  t 'xpaths' do
    xpaths('//text').length.must_equal 13
  end

  def uibutton_text
    'Buttons, Various uses of UIButton'
  end

  t 'ele_index' do
    ele_index('text', 2).name.must_equal uibutton_text
  end

  t 'find_eles' do
    find_eles('text').length.must_equal 13
  end

  t 'find_ele_by_text' do
    el_id = find_ele_by_text(:text, uibutton_text).instance_variable_get :@id
    el_id.must_match /\d+/
  end

  t 'find_eles_by_text' do
    # '!' clears the input buffer in Pry so make sure there's
    # no space after the !
    set_wait 1
    # empty array returned when no match
    found = !find_eles_by_text(:text, uibutton_text).empty?
    found.must_equal true

    found = !find_eles_by_text(:text, 'zz').empty?
    found.must_equal false
    set_wait
  end

  t 'find_ele_by_attr_include' do
    el_text = find_ele_by_attr_include(:text, :text, 'button').text
    el_text.must_equal ''

    el_name = find_ele_by_attr_include(:text, :name, 'button').name
    el_name.must_equal uibutton_text
  end

  t 'find_eles_by_attr_include' do
    ele_count = find_eles_by_attr_include(:text, :text, 'e').length
    ele_count.must_equal 12
  end

  t 'find_ele_by_text_include' do
    el = find_ele_by_text_include(:text, 'bu')
    el_text = el.text
    el_text = el.name if el_text.nil? || el_text.empty?

    el_text.must_equal uibutton_text
  end

  t 'find_eles_by_text_include' do
    ele_count = find_eles_by_text_include(:text, 'e').length
    ele_count.must_equal 12
  end

  t 'first_ele' do
    first_ele(:text).text.must_equal 'UICatalog'
  end

  t 'last_ele' do
    el = last_ele(:text)
    el.text.must_equal ''
    el.name.must_equal 'Transitions, Shows UIViewAnimationTransitions'
  end

  # t 'source' do # tested by get_source

  t 'get_source' do
    get_source.class.must_equal Hash
  end

  t 'find_name' do
    find_name(uibutton_text).name.must_equal uibutton_text
  end

  t 'find_names' do
    find_names(uibutton_text).first.name.must_equal uibutton_text
  end

  t 'id' do
    id 'ButtonsExplain' # 'Various uses of UIButton'
  end

  t 'invalid id should error' do
    begin
      id 'does not exist'
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'Invalid id `does not exist`'

    # resource id should error on ios
    begin
      id 'android:id/text1'
    rescue Exception => e
      message = e.message
    end
    message.must_equal 'Invalid id `android:id/text1`'
  end

  t 'tag' do
    tag('UIATableCell').name.must_equal 'Buttons, Various uses of UIButton'
  end

  t 'tags' do
    tags('UIATableCell').length.must_equal 12
  end
end