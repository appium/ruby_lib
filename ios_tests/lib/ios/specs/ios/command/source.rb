# rake ios[ios/command/source]
describe 'ios/command/source' do
  t 'source' do
    xcuitest_source(format: :json).is_a?(Hash).must_equal true
    xcuitest_source(format: :xml).is_a?(String).must_equal true
  end
end
