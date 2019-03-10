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
  module Android
    # Click the first alert button that contains value or by index.
    # @param value [Integer, String] either an integer index of the button or the button's name
    # @return [void]
    def alert_click(value)
      button(value).click
    end

    # Accept the alert.
    # The last button is considered "accept."
    # @return [void]
    def alert_accept
      last_button.click
    end

    # Get the text of the alert's accept button.
    # The last button is considered "accept."
    # @return [String]
    def alert_accept_text
      last_button.text
    end

    # Dismiss the alert.
    # The first button is considered "dismiss."
    # @return [void]
    def alert_dismiss
      first_button.click
    end

    # Get the text of the alert's dismiss button.
    # The first button is considered "dismiss."
    # @return [String]
    def alert_dismiss_text
      first_button.text
    end
  end # module Android
end # module Appium
