describe 'common/element/window' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'window_size' do
    size = window_size
    size.width.class.must_equal Fixnum
    size.height.class.must_equal Fixnum
  end
end
