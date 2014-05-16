# Tests specifically for areas where the web_context differs in behaviour
describe 'the web context' do

  t 'get_android_inspect' do
    text('Web, Use of UIWebView').click
    set_context 'WEBVIEW'
    current_context.must_equal 'WEBVIEW_1'
    sleep 1  #Give a chance to load
    page.start_with?("\nhtml\n").must_equal true
  end
end