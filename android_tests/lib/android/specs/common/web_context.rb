# Tests specifically for areas where the web_context differs in behaviour
# rake android[common/web_context]
describe 'the web context' do
  # appium's context support is broken on android

  t 'available_contexts' do
    wait_true { available_contexts.include? 'NATIVE_APP' }
  end

  t 'current_context' do
    wait { current_context.must_equal 'NATIVE_APP' }
  end

  t 'set_context' do
    wait { scroll_to('Views').click }
    wait { scroll_to('WebView').click }

    def undo_setcontext_nav
      back
      wait { find('WebView') }
      back
      wait { find 'Views' }
    end

    contexts        = available_contexts
    webview_context = contexts.detect { |e| e.start_with?('WEBVIEW') }

    if webview_context.nil?
      undo_setcontext_nav
      fail "No webview context found. contexts are: #{contexts}"
    end

    wait { set_context webview_context }
    wait { current_context.must_equal webview_context }

    # verify inspect within webview works
    get_android_inspect.split("\n").length.must_be :>=, 3

    wait { set_context 'NATIVE_APP' }
    wait { current_context.must_equal 'NATIVE_APP' }

    undo_setcontext_nav
  end

  t 'within_context' do
    $driver.within_context 'NATIVE_APP' do
      wait { current_context.must_equal 'NATIVE_APP' }
    end
  end

  t 'switch_to_default_context' do
    wait do
      switch_to_default_context
      current_context.must_equal 'NATIVE_APP'
    end

    wait { set_context 'NATIVE_APP' }
    wait { current_context.must_equal 'NATIVE_APP' }
  end
end
