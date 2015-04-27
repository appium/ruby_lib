# Tests specifically for areas where the web_context differs in behaviour
describe 'the web context' do
  t 'get_android_inspect' do
    text('Web').click
    set_context 'WEBVIEW'
    current_context.must_equal 'WEBVIEW_1'
    sleep 1  # Give a chance to load
    page.start_with?("\nhtml\n").must_equal true
  end

  t 'after_last' do
    set_context 'NATIVE_APP'
    back_click
  end
end
