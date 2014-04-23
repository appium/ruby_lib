# encoding: utf-8
# Generic helper methods not specific
# to a particular tag name
module Appium
  module Common
    # json and ap are required for the source method.
    require 'json'
    require 'ap' # awesome print
    require 'timeout' # for wait

    # iOS .name returns the accessibility attribute if it's set. if not set, the string value is used.
    # Android .name returns the accessibility attribute and nothing if it's not set.
    #
    # .text should be cross platform so prefer that over name, unless both
    # Android and iOS have proper accessibility attributes.
    # .text and .value should be the same so use .text over .value.
    #
    # secure tag_name is iOS only because it can't be implemented using uiautomator for Android.
    #
    # find_element :text doesn't work so use XPath to find by text.

    # Check every 0.5 seconds to see if block.call doesn't raise an exception.
    # if .call raises an exception then it will be tried again.
    # if .call doesn't raise an exception then it will stop waiting.
    #
    # Example: wait { name('back').click }
    #
    # Give up after 30 seconds.
    # @param max_wait [Integer] the maximum time in seconds to wait for.
    #         Note that max wait 0 means infinity.
    # @param interval [Float] the time in seconds to wait after calling the block
    # @param block [Block] the block to call
    # @return [Object] the result of block.call
    def wait max_wait=30, interval=0.5, &block
      max_wait = 1 if max_wait <= 0
      result   = nil
      timeout max_wait do
        until (
        begin
          result = block.call || true
        rescue Exception
        end)
          sleep interval
        end
      end
      result
    end

    # Return block.call and ignore any exceptions.
    def ignore &block
      begin
        block.call
      rescue Exception
      end
    end

    # Check every 0.5 seconds to see if block.call returns a truthy value.
    # Note this isn't a strict boolean true, any truthy value is accepted.
    # false and nil are considered failures.
    # Give up after 30 seconds.
    # @param max_wait [Integer] the maximum time in seconds to wait for
    # @param interval [Float] the time in seconds to wait after calling the block
    # @param block [Block] the block to call
    # @return [Object] the result of block.call
    def wait_true max_wait=30, interval=0.5, &block
      max_wait = 1 if max_wait <= 0
      result   = nil
      timeout max_wait do
        until (
        begin
          result = block.call
        rescue Exception
        end)
          sleep interval
        end
      end
      result
    end

    # Navigate back.
    # @return [void]
    def back
      @driver.navigate.back
    end

    # For Sauce Labs reporting. Returns the current session id.
    def session_id
      @driver.session_id
    end

    # Returns the first element that matches the provided xpath.
    #
    # @param xpath_str [String] the XPath string
    # @return [Element]
    def xpath xpath_str
      find_element :xpath, xpath_str
    end

    # Returns all elements that match the provided xpath.
    #
    # @param xpath_str [String] the XPath string
    # @return [Array<Element>]
    def xpaths xpath_str
      find_elements :xpath, xpath_str
    end

    # Get the element of type tag_name at matching index.
    # @param tag_name [String] the tag name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type tag_name
    def ele_index tag_name, index
      # XPath index starts at 1.
      raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0
      find_element :xpath, "//#{tag_name}[#{index}]"
    end

    # Get all elements exactly matching tag name
    # @param tag_name [String] the tag name to find
    # @return [Array<Element>] the found elements of type tag_name
    def find_eles tag_name
      @driver.find_elements :tag_name, tag_name
    end

    # Get the first tag that exactly matches tag and text.
    # @param tag [String] the tag name to match
    # @param text [String] the text to exactly match
    # @return [Element] the element of type tag exactly matching text
    def find_ele_by_text tag, text
      @driver.find_element :xpath, %Q(#{tag}[@text='#{text}'])
    end

    # Get all tags that exactly match tag and text.
    # @param tag [String] the tag name to match
    # @param text [String] the text to exactly match
    # @return [Array<Element>] the elements of type tag exactly matching text
    def find_eles_by_text tag, text
      @driver.find_elements :xpath, %Q(#{tag}[@text='#{text}'])
    end

    # Get the first tag by attribute that exactly matches value.
    # @param tag [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Element] the element of type tag who's attribute includes value
    def find_ele_by_attr_include tag, attr, value
      @driver.find_element :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
    end

    # Get tags by attribute that include value.
    # @param tag [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Array<Element>] the elements of type tag who's attribute includes value
    def find_eles_by_attr_include tag, attr, value
      @driver.find_elements :xpath, %Q(#{tag}[contains(@#{attr}, '#{value}')])
    end

    # Get the first tag that includes text.
    # @param tag [String] the tag name to match
    # @param text [String] the text the element must include
    # @return [Element] the element of type tag that includes text
    # element.attribute(:text).include? text
    def find_ele_by_text_include tag, text
      find_ele_by_attr_include tag, :text, text
    end

    # Get the tags that include text.
    # @param tag [String] the tag name to match
    # @param text [String] the text the element must include
    # @return [Array<Element>] the elements of type tag that includes text
    # element.attribute(:text).include? text
    def find_eles_by_text_include tag, text
      find_eles_by_attr_include tag, :text, text
    end

    # Get the first tag that matches tag_name
    # @param tag_name [String] the tag to match
    # @return [Element]
    def first_ele tag_name
      # XPath index starts at 1
      find_element :xpath, "//#{tag_name}[1]"
    end

    # Get the last tag that matches tag_name
    # @param tag_name [String] the tag to match
    # @return [Element]
    def last_ele tag_name
      xpath "//#{tag_name}[last()]"
    end

    # Prints xml of the current page
    # @return [void]
    def source
      doc = Nokogiri::XML(@driver.page_source) do |config|
        config.options = Nokogiri::XML::ParseOptions::NOBLANKS | Nokogiri::XML::ParseOptions::NONET
      end
      puts doc.to_xml indent: 2
    end


    # Returns XML string for the current page
    # Same as driver.page_source
    # @return [String]
    def get_source
      @driver.page_source
    end

    # http://nokogiri.org/Nokogiri/XML/SAX.html
    class CountElements < Nokogiri::XML::SAX::Document
      attr_reader :result

      def initialize
        reset
      end

      def reset
        @result = Hash.new 0
      end

      # http://nokogiri.org/Nokogiri/XML/SAX/Document.html
      def start_element name, attrs = []
        @result[name] += 1
      end

      def formatted_result
        message = ''
        sorted  = @result.sort_by { |element, count| count }.reverse
        sorted.each do |element, count|
          message += "#{count}x #{element}\n"
        end
        message.strip
      end
    end # class CountElements

    # Returns a string of class counts.
    def get_page_class
      parser = @count_elements_parser ||= Nokogiri::XML::SAX::Parser.new(CountElements.new)

      parser.document.reset
      parser.parse get_source

      parser.document.formatted_result
    end

    # Count all classes on screen and print to stdout.
    # Useful for appium_console.
    def page_class
      puts get_page_class
      nil
    end

    # Returns the first element that exactly matches name
    #
    # @param name [String] the name to exactly match
    # @return [Element]
    def find_name name
      find_element :name, name
    end

    # Returns all elements that exactly match name
    #
    # @param name [String] the name to exactly match
    # @return [Array<Element>]
    def find_names name
      find_elements :name, name
    end

    # Returns the first element matching tag_name
    #
    # @param tag_name [String] the tag_name to search for
    # @return [Element]
    def tag tag_name
      find_element :tag_name, tag_name
    end

    # Returns all elements matching tag_name
    #
    # @param tag_name [String] the tag_name to search for
    # @return [Element]
    def tags tag_name
      find_elements :tag_name, tag_name
    end

    # Converts pixel values to window relative values
    #
    # ```ruby
    # px_to_window_rel x: 50, y: 150
    # ```

    def px_to_window_rel opts={}

      w = $driver.window_size
      x = opts.fetch :x, 0
      y = opts.fetch :y, 0

      OpenStruct.new(x: "#{x.to_f} / #{w.width.to_f}",
                     y: "#{y.to_f} / #{w.height.to_f}")
    end

    def lazy_load_strings
      @strings_xml ||= app_strings
    end

    # Search strings.xml's values for target.
    # @param target [String] the target to search for in strings.xml values
    # @return [Array]
    def xml_keys target
      lazy_load_strings
      @strings_xml.select { |key, value| key.downcase.include? target.downcase }
    end

    # Search strings.xml's keys for target.
    # @param target [String] the target to search for in strings.xml keys
    # @return [Array]
    def xml_values target
      lazy_load_strings
      @strings_xml.select { |key, value| value.downcase.include? target.downcase }
    end

    # Resolve id in strings.xml and return the value.
    # @param id [String] the id to resolve
    # @return [String]
    def resolve_id id
      lazy_load_strings
      @strings_xml[id]
    end

    # Used to error when finding a single element fails.
    def raise_no_element_error
      raise Selenium::WebDriver::Error::NoSuchElementError, 'An element could not be located on the page using the given search parameters.'
    end
  end # module Common
end # module Appium