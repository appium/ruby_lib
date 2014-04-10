# encoding: utf-8

describe 'common/element/window' do
  before_first { screen.must_equal catalog }
  t 'window_size' do
    size = window_size
    size.width.class.must_equal Fixnum
    size.height.class.must_equal Fixnum
  end
end