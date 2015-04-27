require_relative 'version'

module Appium
  module Common
    # Implement useful features for element.
    class Selenium::WebDriver::Element # rubocop:disable Style/ClassAndModuleChildren
      # Note: For testing .text should be used over value, and name.

      # Returns the value attribute
      #
      # Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element
      def value
        attribute :value
      end

      # Returns the name attribute
      #
      # Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element
      def name
        attribute :name
      end

      # For use with mobile tap.
      #
      # ```ruby
      # execute_script 'mobile: tap', :x => 0.0, :y => 0.98
      # ```
      #
      # https://github.com/appium/appium/wiki/Automating-mobile-gestures
      # @return [OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }
      def location_rel
        location   = self.location
        location_x = location.x.to_f
        location_y = location.y.to_f

        size        = self.size
        size_width  = size.width.to_f
        size_height = size.height.to_f

        center_x = location_x + (size_width / 2.0)
        center_y = location_y + (size_height / 2.0)

        w = $driver.window_size
        OpenStruct.new(x: "#{center_x} / #{w.width.to_f}",
                       y: "#{center_y} / #{w.height.to_f}")
      end
    end
  end # module Common
end # module Appium

# Print JSON posted to Appium. Not scoped to an Appium module.
#
# Requires from lib/selenium/webdriver/remote.rb
require 'selenium/webdriver/remote/capabilities'
require 'selenium/webdriver/remote/bridge'
require 'selenium/webdriver/remote/server_error'
require 'selenium/webdriver/remote/response'
require 'selenium/webdriver/remote/commands'
require 'selenium/webdriver/remote/http/common'
require 'selenium/webdriver/remote/http/default'

# @private
# Show http calls to the Selenium server.
#
# Invaluable for debugging.
def patch_webdriver_bridge
  Selenium::WebDriver::Remote::Bridge.class_eval do
    # Code from lib/selenium/webdriver/remote/bridge.rb
    def raw_execute(command, opts = {}, command_hash = nil)
      verb, path = Selenium::WebDriver::Remote::COMMANDS[command] ||
                   fail(ArgumentError, "unknown command: #{command.inspect}")
      path       = path.dup

      path[':session_id'] = @session_id if path.include?(':session_id')

      begin
        opts.each { |key, value| path[key.inspect] = escaper.escape(value.to_s) }
      rescue IndexError
        raise ArgumentError, "#{opts.inspect} invalid for #{command.inspect}"
      end

      # convert /// into /
      path.gsub!(/\/+/, '/')

      # change path from session/efac972c-941a-499c-803c-d7d008749/execute
      # to /execute
      # path may be nil, session, or not have anything after the session_id.
      path_str   = path
      path_str   = '/' + path_str unless path_str.nil? || path_str.length <= 0 || path_str[0] == '/'
      path_match = path.match(/.*\h{8}-?\h{4}-?\h{4}-?\h{4}-?\h{12}/)
      path_str   = path.sub(path_match[0], '') unless path_match.nil?

      Appium::Logger.info "#{verb} #{path_str}"

      # must check to see if command_hash is a hash. sometimes it's not.
      if command_hash.is_a?(Hash) && !command_hash.empty?
        print_command = command_hash.clone

        print_command.delete :args if print_command[:args] == []

        if print_command[:using] == '-android uiautomator'
          value                 = print_command[:value].split(';').map { |v| "#{v};" }
          print_command[:value] = value.length == 1 ? value[0] : value

          # avoid backslash escape quotes in strings. "\"a\"" => "a"
          Appium::Logger.info print_command.ai.gsub('\"', '"')
        else
          Appium::Logger.ap_info print_command
        end
      else # non-standard command hash
        # It's important to output this for debugging problems.
        # for example invalid JSON will not be a Hash
        Appium::Logger.ap_info command_hash if command_hash
      end
      delay = $driver.global_webdriver_http_sleep
      sleep delay if !delay.nil? && delay > 0
      # Appium::Logger.info "verb: #{verb}, path #{path}, command_hash #{command_hash.to_json}"
      http.call verb, path, command_hash
    end # def
  end # class
end

# Print Appium's origValue error messages.
# rubocop:disable Style/ClassAndModuleChildren
# rubocop:disable Style/AndOr
class Selenium::WebDriver::Remote::Response
  # @private
  def error_message
    val = value

    case val
    when Hash
      msg = val['origValue'] || val['message'] or return 'unknown error'
      msg << " (#{ val['class'] })" if val['class']
    when String
      msg = val
    else
      msg = "unknown error, status=#{status}: #{val.inspect}"
    end

    msg
  end
end

class Selenium::WebDriver::Remote::Http::Common # rubocop:disable Style/ClassAndModuleChildren
  remove_const :DEFAULT_HEADERS if defined? DEFAULT_HEADERS
  DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }
end
