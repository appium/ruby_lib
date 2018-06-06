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
