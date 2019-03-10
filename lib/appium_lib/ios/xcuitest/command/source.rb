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
      # Instance method have `xcuitest_` prefix to prevent conflicts for core commands.
      module Source
        # @param [String|Symbol] format :xml or :json. :xml is by default.
        #
        #   ```ruby
        #   xcuitest_source format: :json
        #   ```
        def xcuitest_source(format: :xml)
          format = format.to_s if format.is_a? Symbol
          args = { format: format }

          @driver.execute_script 'mobile: source', args
        end
      end # module Gesture
    end # module Xcuitest
  end # module Ios
end # module Appium
