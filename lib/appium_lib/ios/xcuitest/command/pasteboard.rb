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
      module PasteBoard
        # @param [string] content The content of the pasteboard. The previous content is going to be overridden.
        #                         The parameter is mandatory
        # @option opts [string] :encoding Encoding of the given content. UTF-8 by default.
        #
        #   ```ruby
        #   set_pasteboard content: "sample content"
        #   ```
        def set_pasteboard(content:, encoding: nil)
          args = { content: content }
          args[:encoding] = encoding if encoding

          @driver.execute_script 'mobile: setPasteboard', args
        end

        # @option opts [string] :encoding Encoding of the received pasteboard content. UTF-8 by default.
        #
        #   ```ruby
        #   get_pasteboard encoding: "shift-jis"
        #   ```
        def get_pasteboard(encoding: nil)
          args = {}
          args[:encoding] = encoding if encoding

          @driver.execute_script 'mobile: getPasteboard', args
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
