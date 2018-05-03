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
