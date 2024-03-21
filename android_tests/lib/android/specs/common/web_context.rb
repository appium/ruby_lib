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
class AndroidTest
  class Common
    class WebContext < Minitest::Test
      # appium's context support is broken on android

      def test_01_available_contexts
        wait_true { available_contexts.include? 'NATIVE_APP' }
      end

      def test_02_current_context
        wait { assert_equal current_context, 'NATIVE_APP' }
      end

      def undo_setcontext_nav
        back
        wait { find('WebView') }
        back
        wait { find 'Views' }
      end

      def test_03_set_context
        wait { scroll_to('Views').click }
        wait { scroll_to('WebView').click }

        wait_true { !available_contexts.detect { |e| e.start_with?('WEBVIEW') }.nil? }

        webview_context = available_contexts.detect { |e| e.start_with?('WEBVIEW') }

        if webview_context.nil?
          undo_setcontext_nav
          raise "No webview context found. contexts are: #{contexts}"
        end

        wait { set_context webview_context }
        wait { assert_equal current_context, webview_context }

        # verify inspect within webview works
        assert get_android_inspect.split("\n").length >= 3

        wait { set_context 'NATIVE_APP' }
        wait { assert_equal current_context, 'NATIVE_APP' }

        undo_setcontext_nav
      end
    end
  end
end
