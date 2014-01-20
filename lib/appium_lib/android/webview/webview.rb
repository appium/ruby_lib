# encoding: utf-8
# system requires
require 'net/http'

# 3rd party gems
require 'rubygems'
require 'json'
require 'posix/spawn'
require 'webkit_remote' # https://github.com/pwnall/webkit_remote/

module Appium; end # fix module not defined
module Android; end
module Appium::Android::Webview
  class << self
    # @private
    def adb_cmd cmd
      _pid, _in, _out, _err = POSIX::Spawn::popen4 cmd, {:err => [:child, :out]}
      _in.close

      output = ''

      begin
        Process.waitpid _pid
        output = _out.read
        [_out, _err].each { |io| io.close unless io.nil? || io.closed? }
      rescue # no such process
      end

      output
    end

    # @private
    # returns nil if not found
    def package_to_pid package
      # USER     PID   PPID  VSIZE  RSS     WCHAN    PC         NAME
      # use detect to return the first match
      ps = adb_cmd('adb shell ps').split("\r\n").detect { |l| l.split(' ').last == package }
      ps ? ps.split(' ')[1].to_i : nil # return pid
    end

    # @private
    # 1 pid may have many webviews. The path remains the same
    #
    #["00000000: 00000002 00000000 00010000 0001 01  4716 @webview_devtools_remote_1597",
    # "00000000: 00000003 00000000 00000000 0001 03 55080 @webview_devtools_remote_1597",
    # "00000000: 00000003 00000000 00000000 0001 03 55078 @webview_devtools_remote_1597"]
    #
    # returns nil if not found
    def pid_to_webview pid
      return nil if pid.nil?
      # Num       RefCount Protocol Flags    Type St Inode Path
      cat_proc = adb_cmd 'adb shell cat /proc/net/unix'
      pid_webview = "@webview_devtools_remote_#{pid}"
      found = cat_proc.split("\r\n").detect { |l| l.include?(pid_webview) }
      # must remove '@' prefix for use with adb forward command
      found ? found.split(' ').last.sub('@', '') : nil
    end

    # @private
    # connect_to_webview package: 'com.example.Package'
    def connect_to_webview opts={}
      package = opts[:package]
      raise 'Must provide package' unless package
      port = opts.fetch :port, 9000

      unix_socket = pid_to_webview package_to_pid 'com.litl.Woven'
      raise 'No webview found' unless unix_socket
      adb_cmd "adb forward tcp:#{port} localabstract:#{unix_socket}"
    end

    # @public
    #
    # ```ruby
    # webview = Appium::Android::Webview.attach_to_tab package: 'com.example.Package', url: 'yahoo.com/'
    # webview.location
    # webview.client
    # webview.client.remote_eval Appium::Android::Webview.javascript
    # ```
    #
    # port: is optional.
    #
    # can't be called more than once.
    #
    # returns URL of connected tab.
    def attach_to_tab opts={}
      connect_to_webview package: opts[:package]
      target_url = opts[:url]
      raise 'Must provide :url' unless target_url
      port = opts.fetch(:port, 9000)

      # webkit_remote defaults to using the last tab.
      # The browser may have many tabs and the last tab is not always correct.
      # Detect the tab by inspecting the URL.
      # https://github.com/pwnall/webkit_remote/blob/590bfd3ace098f2b75d1a07651f36f4392109a23/lib/webkit_remote/top_level.rb#L30
      browser = WebkitRemote::Browser.new host: 'localhost', port: port
      target_tab = browser.tabs.detect { |tab| tab.url.include?(target_url) }

      client = WebkitRemote::Client.new tab: target_tab, close_browser: true
      document_location = client.remote_eval 'document.location.toString()'
      client.clear_all

      OpenStruct.new( client: client, location: document_location )
    end
  end
end