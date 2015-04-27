# rubocop:disable Lint/HandleExceptions

# rake ios['ios/element/text']
describe 'ios/element/text' do
  def ui_catalog
    'UICatalog'
  end

  def uiview_transitions
    'Transitions'
  end

  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'first_text' do
    first_text.text.must_equal ui_catalog
  end

  t 'last_text' do
    last_text.text.must_equal uiview_transitions
    last_text.name.must_equal uiview_transitions
  end

  t 'text' do
    text('siti').text.must_equal uiview_transitions
    text(1).text.must_equal ui_catalog
    text('siti').name.must_equal uiview_transitions
  end

  t 'texts' do
    exp = ['Controls', 'Various uses of UIControl', 'Various uses of UISegmentedControl']
    texts.length.must_equal 24
    texts('trol').map(&:name).must_equal exp
    texts('uses').length.must_equal 7
  end

  t 'text_exact' do
    # should fail
    set_wait 0
    act = begin
      text_exact 'mos'
    rescue
      # nop
    end
    act.must_be_nil
    set_wait

    # should pass
    text_exact(ui_catalog).text.must_equal ui_catalog
  end

  t 'texts_exact' do
    texts_exact('UICatalog').length.must_equal 1
  end
end
