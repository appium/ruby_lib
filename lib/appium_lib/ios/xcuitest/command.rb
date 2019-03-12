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

require_relative 'command/pasteboard'
require_relative 'command/gestures'
require_relative 'command/source'
require_relative 'command/multi_app_handler'
require_relative 'command/get_context'

module Appium
  module Ios
    module Xcuitest
      module Command
        # Starts iOS syslog broadcast websocket
        #
        # @param [String] syslog_file A file path to write messages from a syslog WebSocket client
        #
        # @example
        #
        #   start_logs_broadcast 'outputfile.log' #=> #<Appium::Android::Command::WsLogcat:...>
        #
        def start_logs_broadcast(syslog_file = 'syslog.log')
          @driver.execute_script 'mobile: startLogsBroadcast'

          socket_url = "ws://#{URI.parse(server_url).host}:#{@core.port}/ws/session/#{@driver.session_id}/appium/device/syslog"
          @logcat_client = ::Appium::Common::Command::WsLogcat.new(url: socket_url, output_file: syslog_file)
        end

        # Stop iOS syslog broadcast websocket
        #
        # @example
        #
        #   stop_logs_broadcast #=> nil
        #
        def stop_logs_broadcast
          @logcat_client.close

          @driver.execute_script 'mobile: stopLogsBroadcast'
        end
      end
    end
  end
end
