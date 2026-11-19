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
      include AndroidTestNavigation

      def setup
        super
        reset_test_app
      end

      def teardown
        reset_test_app
      ensure
        super
      end

      def test_01_available_contexts
        wait_true { available_contexts.include? 'NATIVE_APP' }
      end

      def test_02_current_context
        assert_equal 'NATIVE_APP', current_context
      end

      def test_03_set_context
        wait { scroll_to_exact('Views') }.click
        wait { scroll_to_exact('WebView') }.click

        webview_context = wait_true do
          available_contexts.find { |context| context.start_with?('WEBVIEW') }
        end

        set_context webview_context
        wait_true { current_context == webview_context }

        # verify inspect within webview works
        assert get_android_inspect.split("\n").length >= 3

        set_context 'NATIVE_APP'
        wait_true { current_context == 'NATIVE_APP' }
      end
    end
  end
end
