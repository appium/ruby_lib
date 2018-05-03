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
