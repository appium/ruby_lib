# rake ios[ios/command/source]
describe 'ios/command/source' do
  t 'source' do
    # TODO: need assert
    xcuitest_source format: :json
    xcuitest_source format: :xml
  end
end
