# encoding: utf-8
# rake ios[ios/helper]
describe 'ios/helper' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'find_eles_by_attr_include' do
    find_eles_by_attr_include('UIATableCell', 'name', 'Use').length.must_equal 7
  end

  t 'ios_password' do
    ios_password.must_equal '•'
    ios_password(2).must_equal '•' * 2
  end

  # t 'get_page' do # prints to stdout

  t 'get_page_class' do
    # 8 local. 9 on sauce.
    get_page_class.split("\n").length.must_be :>=, 8
  end

  # t 'page' do # prints to stdout

  t 'source_window' do
    source_window.length.must_equal 11
  end

  # t 'page_window' do # prints to stdout
end