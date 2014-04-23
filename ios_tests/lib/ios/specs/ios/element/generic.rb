# encoding: utf-8
# rake ios['ios/element/generic']
describe 'ios/element/generic' do
  def before_first
    screen.must_equal catalog
  end

  def exp_text
    'TextFields, Uses of UITextField'
  end

  def search_text
    'TextFields'
  end

  t 'before_first' do
    before_first
  end

  t 'find' do
    el = find search_text
    el_text = el.text
    el = el_text.empty? ? el.name : el_text
    el.must_equal exp_text
  end

  t 'finds' do
    el = finds(search_text).first
    el_text = el.text
    el = el_text.empty? ? el.name : el_text

    el.must_equal exp_text
  end

  t 'text' do
    el = text 'rows'
    el_text = el.text
    el = el_text.empty? ? el.name : el_text

    el.include?('rows').must_equal true
  end

  t 'texts' do
    el = texts('rows').first
    el_text = el.text
    el = el_text.empty? ? el.name : el_text

    el.include?('rows').must_equal true
  end

  t 'name' do
    name(search_text).name.must_equal exp_text
  end

  t 'names' do
    names(search_text).first.name.must_equal exp_text
  end

  t 'name_exact' do
    name_exact(exp_text).name.must_equal exp_text
  end
end