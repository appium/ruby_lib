# Implement useful features for element.
class Selenium::WebDriver::Element
  # Note: For testing .text should be used over value, and name.

  # Fixes NoMethodError: undefined method `value' for #<Selenium::WebDriver::Element:0x..fa4a9148235390a44 id="1">
  def value
    self.attribute :value
  end
  
  # Fixes NoMethodError: undefined method `name' for #<Selenium::WebDriver::Element
  def name
    self.attribute :name
  end
  
  # Use tag_name to get element's type.
  #
  # Tag name appears to be the same as type.
  #
  # Fixes Selenium::WebDriver::Error::UnknownError: Not yet implemented
  def tag_name
    self.attribute :type
  end

  # Cross platform way of entering text into a textfield
  def type text
  # enter text then tap window to hide the keyboard.
  js = %Q(
    au.getElement('#{self.ref}').setValue('#{text}');
    au.lookup('window')[0].tap()
  )
  $driver.execute_script js
  end if $os == :ios

  # Cross platform way of entering text into a textfield
  def type text
    self.send_keys text
  end if $os == :android

  # For use with mobile tap.
  #
  # $driver.execute_script 'mobile: tap', :x => 0.0, :y => 0.98
  #
  # https://github.com/appium/appium/wiki/Automating-mobile-gestures
  # @return [OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }
  def location_rel
    xy = self.location
    w = window_size
    OpenStruct.new( x: xy.x.to_f / w.width.to_f,
                    y: xy.y.to_f / w.height.to_f )
  end
end

# Print JSON posted to Appium
#
# Requires from lib/selenium/webdriver/remote.rb
require 'selenium/webdriver/remote/capabilities'
require 'selenium/webdriver/remote/bridge'
require 'selenium/webdriver/remote/server_error'
require 'selenium/webdriver/remote/response'
require 'selenium/webdriver/remote/commands'
require 'selenium/webdriver/remote/http/common'
require 'selenium/webdriver/remote/http/default'

# Show http calls to the Selenium server.
#
# Invaluable for debugging.
module Selenium::WebDriver::Remote
  class Bridge
    # Code from lib/selenium/webdriver/remote/bridge.rb
    def raw_execute(command, opts = {}, command_hash = nil)
      verb, path = COMMANDS[command] || raise(ArgumentError, "unknown command: #{command.inspect}")
      path       = path.dup
      
      path[':session_id'] = @session_id if path.include?(":session_id")
      
      begin
        opts.each { |key, value| path[key.inspect] = escaper.escape(value.to_s) }
        rescue IndexError
        raise ArgumentError, "#{opts.inspect} invalid for #{command.inspect}"
      end
      
      # change path from session/efac972c-941a-499c-803c-d7d008749/execute
      # to /execute
      # path may be nil, session, or not have anything after the session_id.
      path_str = ''
      path_match = path.match /.*\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/
      path_str = path.sub(path_match[0], '') unless path_match.nil?

      puts "#{verb} #{path_str}"
      puts command_hash.to_json unless command_hash.to_json == 'null'
      # puts "verb: #{verb}, path #{path}, command_hash #{command_hash.to_json}"
      http.call verb, path, command_hash
    end # def
  end # class
end if defined?(Pry)# module