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
    # Accept the alert.
    # @return [void]
    def alert_accept
      # @driver.switch_to.alert.accept
      # ".switch_to.alert" calls alert_text so use bridge directly
      driver.send(:bridge).accept_alert
    end

    # Dismiss the alert.
    # @return [void]
    def alert_dismiss
      # @driver.switch_to.alert.dismiss
      # ".switch_to.alert" calls alert_text so use bridge directly
      driver.send(:bridge).dismiss_alert
    end
  end # module Ios
end # module Appium
