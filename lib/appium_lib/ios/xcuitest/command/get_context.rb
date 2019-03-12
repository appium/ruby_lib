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

module Appium
  module Ios
    module Xcuitest
      # Get the contexts available, with information about the url and title of each webview
      module GetContext
        #
        # Get contexts
        #
        # @example
        #
        #     xcuitest_get_contexts #=> [{ 'id' => 'NATIVE_APP' },
        #                       # { 'id' => 'WEBVIEW_41467.1', 'title' => 'Apple', 'url' => 'https://www.apple.com/' }]
        #
        def xcuitest_get_contexts
          @driver.execute_script 'mobile: getContexts', {}
        end
      end # module GetContext
    end # module Xcuitest
  end # module Ios
end # module Appium
