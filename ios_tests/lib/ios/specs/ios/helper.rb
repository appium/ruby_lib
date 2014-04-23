# encoding: utf-8
# rake ios[ios/helper]
describe 'ios/helper' do
  def before_first
    screen.must_equal catalog
  end

  t { before_first }

  t 'find_eles_attr' do
    find_eles_attr(:text, :text).length.must_equal 13
  end

  t 'find_2_eles_attr' do
    # find all elements of tag type :text and return the :text value plus
    # find all elements of tag type :text and return the :text value
    # use case is: find_2_eles_attr :textfield, :secure, :text
    find_2_eles_attr(:text, :text, :text).length.must_equal 26
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

  t 'fast_duration' do
    fast_duration.must_equal 0.5
  end
end