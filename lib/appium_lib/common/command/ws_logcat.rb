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
  module Common
    module Command
      class WsLogcat < ::Appium::Core::WebSocket
        def initialize(url:, output_file: 'logcat.log')
          super(url: url)
          @output_file = output_file
        end

        def handle_message_data(data)
          File.open(@output_file, 'a') { |f| f.write("#{data}\n") }
        end
      end
    end
  end
end
