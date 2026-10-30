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
# rake "ios[common/web_context]"

require_relative '../../../fixture_server'

class IosTest
  class Common
    class WebContext < Minitest::Test
      include IosTestNavigation

      SAFARI_BUNDLE_ID = 'com.apple.mobilesafari'

      def loaded_webview
        context = nil
        wait_true(timeout: 60) do
          context = xcuitest_get_contexts.find do |candidate|
            candidate['id'].start_with?('WEBVIEW_') &&
              candidate['url'] == @fixture.url
          end
        end
        context
      end

      def setup
        super
        @fixture = IosFixtureServer.new
        # UICatalog's legacy UIWebView uses a protocol removed by RemoteDebugger.
        # Safari exercises web-context inspection with a supported WebKit target.
        driver.execute_script 'mobile: deepLink', url: @fixture.url, bundleId: SAFARI_BUNDLE_ID
      end

      def teardown
        set_context 'NATIVE_APP'
        driver.terminate_app SAFARI_BUNDLE_ID
      ensure
        @fixture&.close
        super
      end

      def test_get_ios_inspect
        webview = loaded_webview
        set_context webview.fetch('id')
        assert_equal webview.fetch('id'), current_context
        wait_true { execute_script('return document.readyState') == 'complete' }
        assert_includes page, "\nbody\n  text: ruby-lib-webview"
        assert_includes get_source, 'ruby-lib-webview'
      ensure
        set_context 'NATIVE_APP'
      end

      def test_xcuitest_get_contexts
        webview = loaded_webview
        assert_includes xcuitest_get_contexts, { 'id' => 'NATIVE_APP' }
        assert_includes available_contexts, webview.fetch('id')
        assert_equal SAFARI_BUNDLE_ID, webview.fetch('bundleId')
        assert_equal @fixture.url, webview.fetch('url')
      end
    end
  end
end
