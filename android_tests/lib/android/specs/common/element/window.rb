describe 'common/element/window' do
  t 'window_size' do
    wait do
      size = window_size
      size.width.class.must_equal Fixnum
      size.height.class.must_equal Fixnum
    end
  end
end
