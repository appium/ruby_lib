# rake ios['ios/element/text']
describe 'ios/element/text' do
  def ui_catalog
    'UICatalog'
  end

  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'e_s_texts' do
    e_s_texts.length.must_equal 13
  end

  t 'first_s_text' do
    first_s_text.text.must_equal ui_catalog
  end

  t 'last_s_text' do
    last_s_text.text.must_equal ''
    last_s_text.name.must_equal 'Transitions, Shows UIViewAnimationTransitions'
  end

  t 's_text' do
    s_text('mat').text.must_equal ''
    s_text(1).text.must_equal ui_catalog
    s_text('mat').name.must_equal 'Transitions, Shows UIViewAnimationTransitions'
  end

  t 's_texts' do
    exp = ['Controls, Various uses of UIControl', 'Segments, Various uses of UISegmentedControl']
    s_texts('trol').map { |e| e.name }.must_equal exp
    s_texts('uses').length.must_equal 7
  end

  t 's_text_exact' do
    # should fail
    set_wait 0
    act = begin; s_text_exact 'mos'; rescue; end
    act.must_be_nil
    set_wait

    # should pass
    s_text_exact(ui_catalog).text.must_equal ui_catalog
  end

  t 's_texts_exact' do
    s_texts_exact('UICatalog').length.must_equal 1
  end
end