# rake ios[common/pasteboard]
describe 'ios/command/pasteboard' do
  t 'pasteboard' do
    # set blank before testing because pasteboard is remaining during launching simulators
    set_pasteboard content: ''
    get_pasteboard.must_be_empty

    set_pasteboard content: 'sample content'

    get_pasteboard.must_equal 'sample content'
  end
end
