# encoding: utf-8

describe 'common/element/text' do
  def before_first
    screen.must_equal catalog
  end

  t { before_first }

  t 's_texts' do
    exp = ['UICatalog', 'Buttons, Various uses of UIButton', 'Controls, Various uses of UIControl', 'TextFields, Uses of UITextField', 'SearchBar, Use of UISearchBar', 'TextView, Use of UITextField', 'Pickers, Uses of UIDatePicker, UIPickerView', 'Images, Use of UIImageView', 'Web, Use of UIWebView', 'Segments, Various uses of UISegmentedControl', 'Toolbar, Uses of UIToolbar', 'Alerts, Various uses of UIAlertView, UIActionSheet', 'Transitions, Shows UIViewAnimationTransitions']
    s_texts_names.must_equal exp
  end

  t 'e_s_texts' do
    e_s_texts.length.must_equal 13
  end

  def ui_catalog
    'UICatalog'
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
    s_text('mat').name.must_equal 'Transitions, Shows UIViewAnimationTransitions'
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

  t 's_texts' do
    s_texts('uses').length.must_equal 7
  end

  t 's_texts_exact' do
    s_texts_exact('UICatalog').length.must_equal 1
  end
end