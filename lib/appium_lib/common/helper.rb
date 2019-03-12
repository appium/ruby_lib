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

# Generic helper methods not specific to a particular tag name
module Appium
  module Common
    # iOS .name returns the accessibility attribute if it's set. if not set, the string value is used.
    # Android .name returns the accessibility attribute and nothing if it's not set.
    #
    # .text should be cross platform so prefer that over name, unless both
    # Android and iOS have proper accessibility attributes.
    # .text and .value should be the same so use .text over .value.
    #
    # secure class_name is iOS only because it can't be implemented using uiautomator for Android.
    #
    # find_element :text doesn't work so use XPath to find by text.

    # Return yield and ignore any exceptions.
    def ignore
      yield
    rescue Exception # rubocop:disable Lint/HandleExceptions, Lint/RescueException
    end

    # Navigate back.
    # @return [void]
    def back
      @driver.navigate.back
    end

    # For Sauce Labs reporting. Returns the current session id.
    # @return [String]
    #
    # @example
    #
    #   @driver.session_id #=> "some-session-ids"
    #
    def session_id
      @driver.session_id
    end

    # Returns the first element that matches the provided xpath.
    #
    # @param xpath_str [String] the XPath string
    # @return [Element]
    def xpath(xpath_str)
      @driver.find_element :xpath, xpath_str
    end

    # Returns all elements that match the provided xpath.
    #
    # @param xpath_str [String] the XPath string
    # @return [Array<Element>]
    def xpaths(xpath_str)
      @driver.find_elements :xpath, xpath_str
    end

    # json and ap are required for the source method.
    require 'json'

    # @private
    # http://nokogiri.org/Nokogiri/XML/SAX.html
    class CountElements < Nokogiri::XML::SAX::Document
      attr_reader :result

      def initialize(platform)
        reset
        @platform = platform
      end

      def reset
        @result = Hash.new 0
      end

      # http://nokogiri.org/Nokogiri/XML/SAX/Document.html
      def start_element(name, attrs = [])
        element_visible = case @platform.to_sym
                          when :android
                            true
                          else # :ios, :windows
                            Hash[attrs]['visible'] == 'true'
                          end

        @result[name] += 1 if element_visible
      end

      def formatted_result
        @result
          .sort_by { |_element, count| count }
          .reverse
          .reduce('') { |acc, element| "#{acc}#{element[1]}x #{element[0]}\n" }
          .strip
      end
    end # class CountElements

    # Returns a string of class counts of visible elements.
    # @return [String]
    #
    # @example
    #
    #   get_page_class #=> "24x XCUIElementTypeStaticText\n12x XCUIElementTypeCell\n8x XCUIElementTypeOther\n
    #                  #    2x XCUIElementTypeWindow\n1x XCUIElementTypeStatusBar\n1x XCUIElementTypeTable\n1
    #                  #    x XCUIElementTypeNavigationBar\n1x XCUIElementTypeApplication"
    #
    def get_page_class
      parser = @count_elements_parser ||= Nokogiri::XML::SAX::Parser.new(CountElements.new(@core.device))

      parser.document.reset
      parser.parse get_source

      parser.document.formatted_result
    end

    # Count all classes on screen and print to stdout.
    # Useful for appium_console.
    # @return [nil]
    #
    # @example
    #
    #   page_class
    #     # 24x XCUIElementTypeStaticText
    #     # 12x XCUIElementTypeCell
    #     # 8x XCUIElementTypeOther
    #     # 2x XCUIElementTypeWindow
    #     # 1x XCUIElementTypeStatusBar
    #     # 1x XCUIElementTypeTable
    #     # 1x XCUIElementTypeNavigationBar
    #     # 1x XCUIElementTypeApplication
    #
    def page_class
      puts get_page_class
      nil
    end

    # Prints xml of the current page
    # @return [void]
    def source
      _print_source get_source
    end

    # Returns XML string for the current page
    # Same as driver.page_source
    # @return [String]
    def get_source
      @driver.page_source
    end

    # Converts pixel values to window relative values
    #
    # @example
    #
    #   px_to_window_rel x: 50, y: 150 #=> #<OpenStruct x="50.0 / 375.0", y="150.0 / 667.0">
    #
    def px_to_window_rel(opts = {}, driver = $driver)
      w = driver.window_size
      x = opts.fetch :x, 0
      y = opts.fetch :y, 0

      OpenStruct.new(x: "#{x.to_f} / #{w.width.to_f}",
                     y: "#{y.to_f} / #{w.height.to_f}")
    end

    # @private
    def lazy_load_strings
      # app strings only works on local apps.
      # on disk apps (ex: com.android.settings) will error
      @lazy_load_strings ||= ignore { app_strings } || {}
    end

    # Search strings.xml's values for target.
    # @param target [String] the target to search for in strings.xml values
    # @return [Array]
    def xml_keys(target)
      lazy_load_strings
      @lazy_load_strings.select { |key, _value| key.downcase.include? target.downcase }
    end

    # Search strings.xml's keys for target.
    # @param target [String] the target to search for in strings.xml keys
    # @return [Array]
    def xml_values(target)
      lazy_load_strings
      @lazy_load_strings.select { |_key, value| value.downcase.include? target.downcase }
    end

    # Resolve id in strings.xml and return the value.
    # @param id [String] the id to resolve
    # @return [String]
    def resolve_id(id)
      lazy_load_strings
      @lazy_load_strings[id]
    end

    # @private
    class HTMLElements < Nokogiri::XML::SAX::Document
      attr_reader :filter

      # convert to string to support symbols
      def filter=(value)
        # nil and false disable the filter
        return @filter = false unless value # rubocop:disable Lint/ReturnInVoidContext

        @filter = value.to_s.downcase
      end

      def initialize
        reset
        @filter = false
      end

      def reset
        @element_stack     = []
        @elements_in_order = []
        @skip_element      = false
      end

      def result
        @elements_in_order.reduce('') do |r, e|
          name = e.delete :name
          attr_string = e.reduce('') do |string, attr|
            attr1 = attr[1] ? attr[1].strip : attr[1]
            "#{string}  #{attr[0]}: #{attr1}\n"
          end

          r.concat "\n#{name}\n#{attr_string}" unless attr_string.nil? || attr_string.empty?
          r
        end
      end

      def start_element(name, attrs = [])
        @skip_element = filter && !filter.include?(name.downcase)
        return if @skip_element

        element = { name: name }
        attrs.each { |a| element[a[0]] = a[1] }
        @element_stack.push element
        @elements_in_order.push element
      end

      def end_element(name)
        return if filter && !filter.include?(name.downcase)

        element_index = @element_stack.rindex { |e| e[:name] == name }
        @element_stack.delete_at element_index
      end

      def characters(chars)
        return if @skip_element

        element        = @element_stack.last
        element[:text] = chars
      end
    end

    # @private
    def _no_such_element
      error_message = 'An element could not be located on the page using the given search parameters.'
      raise Selenium::WebDriver::Error::NoSuchElementError, error_message
    end

    # @private
    def _print_source(source)
      opts = Nokogiri::XML::ParseOptions::NOBLANKS | Nokogiri::XML::ParseOptions::NONET
      doc = if source.start_with? '<html'
              Nokogiri::HTML(source) { |cfg| cfg.options = opts }
            else
              Nokogiri::XML(source)  { |cfg| cfg.options = opts }
            end
      puts doc.to_xml indent: 2
    end
  end
end
