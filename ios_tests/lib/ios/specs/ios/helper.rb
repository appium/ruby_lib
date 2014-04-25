# encoding: utf-8
# rake ios[ios/helper]
describe 'ios/helper' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'ios_password' do
    ios_password.must_equal '•'
    ios_password(2).must_equal '•' * 2
  end

  # todo: t 'get_page' do

  # t 'page' do # writes to std out

  t 'source_window' do
    source_window.length.must_equal 11
  end

  # todo: t 'page_window' do
  # todo: t 'id' do
  # todo: t 'ios_version' do
end