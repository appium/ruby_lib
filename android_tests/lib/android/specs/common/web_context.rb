# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Tests specifically for areas where the web_context differs in behaviour
# rake "android[common/web_context]"
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

    wait_true { !available_contexts.detect { |e| e.start_with?('WEBVIEW') }.nil? }

    webview_context = available_contexts.detect { |e| e.start_with?('WEBVIEW') }

    if webview_context.nil?
      undo_setcontext_nav
      raise "No webview context found. contexts are: #{contexts}"
    end

    wait { set_context webview_context }
    wait { current_context.must_equal webview_context }

    # verify inspect within webview works
    get_android_inspect.split("\n").length.must_be :>=, 3

    wait { set_context 'NATIVE_APP' }
    wait { current_context.must_equal 'NATIVE_APP' }

    undo_setcontext_nav
  end
end
