# Tests specifically for areas where the web_context differs in behaviour
# rake android[common/web_context]
describe 'the web context' do

  t 'get_android_inspect' do
    scroll_to 'Views'
    last_text.click
    scroll_to 'WebView'
    last_text.click

    webview_context = available_contexts.detect { |e| e.start_with?('WEBVIEW') }

    set_context webview_context
    current_context.must_equal webview_context
    get_android_inspect.split("\n").length.must_be :>=, 3
  end
end