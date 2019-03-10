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
  module Device
    extend Forwardable

    class << self
      def extended(_mod)
        add_touch_actions
      end

      private

      def add_touch_actions
        actions = Appium::TouchAction::COMPLEX_ACTIONS
        actions.each do |method|
          delegate_from_appium_driver(method, Appium::TouchAction)
        end

        # To keep compatibility
        # pinch and zoom are defined in Appium::MultiTouch.
        delegate_from_appium_driver(:pinch, Appium::MultiTouch)
        delegate_from_appium_driver(:zoom, Appium::MultiTouch)
      end

      def delegate_from_appium_driver(method, delegation_target)
        def_delegator delegation_target, method
      end
    end # class << self
  end # module Device
end # module Appium
