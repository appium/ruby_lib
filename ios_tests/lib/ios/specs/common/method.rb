# rake ios[common/method]
describe 'common/method' do
  t 'pastboard' do
    get_pasteboard.must_be_empty

    set_pasteboard content: 'sample content'

    get_pasteboard.must_equal 'sample content'
  end
end
