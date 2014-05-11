# Tests specifically for areas where the web_context differs in behaviour
describe 'the web context' do

  t 'get_android_inspect' do
    scroll_to "Views"
    last_text.click
    scroll_to 'WebView'
    last_text.click
    set_context 'WEBVIEW'
    current_context.must_equal 'WEBVIEW_1'
    get_android_inspect.split("\n").length.must_be :>=, 3
  end
end