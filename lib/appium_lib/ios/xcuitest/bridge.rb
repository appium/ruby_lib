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

require_relative '../ios'

module Appium
  module Ios
    module Xcuitest
      class Bridge
        def self.for(target)
          target.extend Appium::Ios
          target.extend Appium::Ios::Xcuitest
          target.extend Appium::Ios::Xcuitest::PasteBoard
          target.extend Appium::Ios::Xcuitest::Source
          target.extend Appium::Ios::Xcuitest::Helper
          target.extend Appium::Ios::Xcuitest::Gesture
          target.extend Appium::Ios::Xcuitest::MultiAppHandler
          target.extend Appium::Ios::Xcuitest::Element
          target.extend Appium::Ios::Xcuitest::Command
          target.extend Appium::Ios::Xcuitest::GetContext
        end
      end
    end
  end
end
