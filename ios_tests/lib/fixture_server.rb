# frozen_string_literal: true

require 'socket'

# A Simulator can reach the host loopback address. Keep web tests offline.
class IosFixtureServer
  attr_reader :url

  def initialize
    @server = TCPServer.new('127.0.0.1', 0)
    @url = "http://127.0.0.1:#{@server.addr[1]}/"
    @thread = Thread.new do
      loop do
        socket = @server.accept
        begin
          while (line = socket.gets) && line != "\r\n"
            # Consume the request headers before returning the fixture.
          end
          body = '<html><head><title>ruby-lib-webview</title></head><body>ruby-lib-webview</body></html>'
          socket.write "HTTP/1.1 200 OK\r\nContent-Type: text/html; charset=utf-8\r\n" \
                       "Content-Length: #{body.bytesize}\r\nConnection: close\r\n\r\n#{body}"
        ensure
          socket.close
        end
      end
    end
  end

  def close
    @thread.kill
    @thread.join
    @server.close
  end
end
