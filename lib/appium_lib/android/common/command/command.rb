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
    module Command
      # Conduct an adb shell script on Appium server.
      # Require `--relaxed-security` arguments when run Appium server as server side arguments.
      #
      # @param [String] command Command for "adb shell"
      # @param [Array] arguments Arguments for the adb command
      #
      # @example
      #
      #   shell "echo", "list" #=> "list"
      #
      def shell(command, arguments)
        args = { command: command, args: arguments }
        # --relaxed-security
        @driver.execute_script 'mobile: shell', args
      end

      # Starts Android logcat broadcast websocket
      #
      # @param [String] logcat_file A file path to write messages from a logcat WebSocket client
      #
      # @example
      #
      #   start_logs_broadcast 'outputfile.log' #=> #<Appium::Android::Command::WsLogcat:...>
      #
      def start_logs_broadcast(logcat_file = 'logcat.log')
        @driver.execute_script 'mobile: startLogsBroadcast'

        socket_url = "ws://#{URI.parse(server_url).host}:#{@core.port}/ws/session/#{@driver.session_id}/appium/device/logcat"
        @logcat_client = ::Appium::Common::Command::WsLogcat.new(url: socket_url, output_file: logcat_file)
      end

      # Stop Android logcat broadcast websocket
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
