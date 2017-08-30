# rake android[core/element/window]
describe 'core/element/window' do
  # rubocop:disable Lint/UnifiedInteger
  t 'window_size' do
    wait do
      size = window_size
      size.width.class.must_equal Fixnum
      size.height.class.must_equal Fixnum
    end
  end
end
