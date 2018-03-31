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

      # Starts Android logcat broadcast websocket on the same host and port
      def start_logs_broadcast
        @driver.execute_script 'mobile: startLogsBroadcast'
      end

      # Stops the previously started logcat broadcasting wesocket server.
      def stop_logs_broadcast
        @driver.execute_script 'mobile: stopLogsBroadcast'
      end
    end
  end
end
