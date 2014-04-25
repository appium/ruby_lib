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
    # secure class_name is iOS only because it can't be implemented using uiautomator for Android.
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

    # Get the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index class_name, index
      # XPath index starts at 1.
      raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0
      find_element :xpath, "//#{class_name}[#{index}]"
    end

    def string_attr_exact class_name, attr, value
      %Q(//#{class_name}[@visible="true" and @#{attr}='#{value}'])
    end

    def find_ele_by_attr class_name, attr, value
      @driver.find_element :xpath, string_attr_exact(class_name, attr, value)
    end

    def find_eles_by_attr class_name, attr, value
      @driver.find_elements :xpath, string_attr_exact(class_name, attr, value)
    end

    def string_attr_include class_name, attr, value
      %Q(//#{class_name}[@visible="true" and contains(translate(@#{attr},'#{value.upcase}', '#{value}'), '#{value}')])
    end

    # Get the first tag by attribute that exactly matches value.
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Element] the element of type tag who's attribute includes value
    def find_ele_by_attr_include class_name, attr, value
      @driver.find_element :xpath, string_attr_include(class_name, attr, value)
    end

    # Get tags by attribute that include value.
    # @param class_name [String] the tag name to match
    # @param attr [String] the attribute to compare
    # @param value [String] the value of the attribute that the element must include
    # @return [Array<Element>] the elements of type tag who's attribute includes value
    def find_eles_by_attr_include class_name, attr, value
      @driver.find_elements :xpath, string_attr_include(class_name, attr, value)
    end

    # Get the first tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele class_name
      # XPath index starts at 1
      find_element :xpath, "//#{class_name}[1]"
    end

    # Get the last tag that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele class_name
      xpath "//#{class_name}[last()]"
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

    # Returns the first element matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag class_name
      find_element :class, class_name
    end

    # Returns all elements matching class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags class_name
      find_elements :class, class_name
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

    # xpath fragment helper
    # example: xpath_visible_contains 'UIATextField', text
    def string_visible_contains element, value
      result = []
      attributes = %w[name hint label value]

      value_up = value.upcase
      value_down = value.downcase

      attributes.each do |attribute|
        result << %Q(contains(translate(@#{attribute},"#{value_up}","#{value_down}"), "#{value_down}"))
      end

      result = result.join(' or ')
      result = %Q(@visible="true" and (#{result}))
      "//#{element}[#{result}]"
    end

    def xpath_visible_contains element, value
      xpath string_visible_contains element, value
    end

    def xpaths_visible_contains element, value
      xpaths string_visible_contains element, value
    end

    def string_visible_exact element, value
      result = []
      attributes = %w[name hint label value]

      attributes.each do |attribute|
        result << %Q(@#{attribute}="#{value}")
      end

      result = result.join(' or ')
      result = %Q(@visible="true" and (#{result}))
      "//#{element}[#{result}]"
    end

    def xpath_visible_exact element, value
      xpath string_visible_exact element, value
    end

    def xpaths_visible_exact element, value
      xpaths string_visible_exact element, value
    end

    # Used to error when finding a single element fails.
    def raise_no_element_error
      raise Selenium::WebDriver::Error::NoSuchElementError, 'An element could not be located on the page using the given search parameters.'
    end
  end # module Common
end # module Appium