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

class IosTest
  class Common
    class WebContext < Minitest::Test
      def test_01_before_first
        driver.terminate_app target_bundle_id
        driver.activate_app target_bundle_id
        assert_equal screen, catalog
      end

      def test_02_get_ios_inspect
        find_eles_by_predicate_include(value: 'Web').first.click

        wait_true { available_contexts.size >= 2 }
        web_view_context = available_contexts.find { |c| c.start_with? 'WEBVIEW' } # Get WEBVIEW_59153.1 for example.

        set_context web_view_context
        assert_equal current_context, web_view_context
        sleep 1 # Give a chance to load
        assert_equal page.start_with?("\nhtml\n"), true
      end

      def test_03_xcuitest_get_contexts
        context = xcuitest_get_contexts
        assert_equal({ 'id' => 'NATIVE_APP' }, context.first)
        assert context[1]['id'].include?('WEBVIEW_')
      end

      def test_04_after_last
        set_context 'NATIVE_APP'
        back_click
      end
    end
  end
end
