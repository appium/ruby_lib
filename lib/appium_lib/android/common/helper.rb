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

module Appium
  module Android
    # @private
    # http://nokogiri.org/Nokogiri/XML/SAX.html
    class AndroidElements < Nokogiri::XML::SAX::Document
      attr_reader :result, :keys, :filter

      # convert to string to support symbols
      def filter=(value)
        # nil and false disable the filter
        return @filter = false unless value # rubocop:disable Lint/ReturnInVoidContext

        @filter = value.to_s.downcase
      end

      def initialize
        reset
        @filter   = false
      end

      def reset
        @result   = ''
        @keys     = %w(text resource-id content-desc)
      end

      # http://nokogiri.org/Nokogiri/XML/SAX/Document.html
      def start_element(name, attrs = [], driver = $driver)
        return if filter && !name.downcase.include?(filter)

        attributes = {}

        attrs.each do |key, value|
          attributes[key] = value if keys.include?(key) && !value.empty?
        end

        # scoped to: text resource-id content-desc
        attributes_values = attributes.values
        strings           = driver.lazy_load_strings
        id_matches = strings.empty? ? [] : strings.select { |_key, value| attributes_values.include? value }

        string_ids = nil

        if id_matches && !id_matches.empty?
          space_suffix = ' ' * 15 # 15 is '  strings.xml: '.length
          string_ids   = ''

          # add first
          string_ids += "#{id_matches.shift[0]}\n"

          # use padding for remaining values
          # [0] = key, [1] = value
          id_matches.each do |match|
            string_ids += "#{space_suffix}#{match[0]}\n"
          end
        end

        string = ''
        text   = attributes['text']
        desc   = attributes['content-desc']
        id     = attributes['resource-id']

        if !text.nil? && text == desc
          string += "  text, desc: #{text}\n"
        else
          string += "  text: #{text}\n" unless text.nil?
          string += "  desc: #{desc}\n" unless desc.nil?
        end
        string += "  id: #{id}\n" unless id.nil?
        string += "  strings.xml: #{string_ids}" unless string_ids.nil?

        @result += "\n#{name}\n#{string}" unless attributes.empty?
      end
    end # class AndroidElements

    # Android only.
    # Returns a string containing interesting elements.
    # The text, content description, and id are returned.
    # @param class_name [String] the class name to filter on.
    # if false (default) then all classes will be inspected
    # @return [String]
    def get_android_inspect(class_name = false)
      source = get_source

      doctype_string = '<!doctyp'
      source_header  = source[0..doctype_string.length].downcase
      source_is_html = source_header.start_with?(doctype_string, '<html')

      parser = if source_is_html # parse html from webview
                 @android_html_parser ||= Nokogiri::HTML::SAX::Parser.new(Appium::Common::HTMLElements.new)
               else
                 @android_native_parser ||= Nokogiri::XML::SAX::Parser.new(AndroidElements.new)
               end
      parser.document.reset # ensure document is reset before parsing
      parser.document.filter = class_name
      parser.parse source
      result = parser.document.result
      parser.document.reset # clean up any created objects after parsing
      result
    end

    # Intended for use with console.
    # Inspects and prints the current page.
    # Will return XHTML for Web contexts because of a quirk with Nokogiri.
    # @option class [Symbol] the class name to filter on. case insensitive include match.
    # if nil (default) then all classes will be inspected
    # @return [void]
    def page(opts = {})
      class_name = opts.is_a?(Hash) ? opts.fetch(:class, nil) : opts
      puts get_android_inspect class_name
      nil
    end

    # Find the first matching element by id
    # @param id [String] the id to search for
    # @return [Element]
    def id(id)
      # Android auto resolves strings.xml ids
      find_element :id, id
    end

    # Find all matching elements by id
    # @param id [String] the id to search for
    # @return [Element]
    def ids(id)
      # Android auto resolves strings.xml ids
      find_elements :id, id
    end

    # Find the element of type class_name at matching index.
    # @param class_name [String] the class name to find
    # @param index [Integer] the index
    # @return [Element] the found element of type class_name
    def ele_index(class_name, index)
      results = tags(class_name)
      if index == 'last()'
        index = results.length
        index -= 1 if index >= 0
      else
        raise 'Index must be >= 1' unless index >= 1

        index -= 1 if index >= 1
      end

      # uiautomator has issues with index/instance so calculate the index
      # client side.
      results[index]
    end

    # Find the first element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def first_ele(class_name)
      tag(class_name)
    end

    # Find the last element that matches class_name
    # @param class_name [String] the tag to match
    # @return [Element]
    def last_ele(class_name)
      ele_index class_name, 'last()'
    end

    # Find the first element of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tag(class_name)
      find_element :class, class_name
    end

    # Find all elements of type class_name
    #
    # @param class_name [String] the class_name to search for
    # @return [Element]
    def tags(class_name)
      find_elements :class, class_name
    end

    # @private
    # Detects if the string represents a resourceId
    # resourceId is only supported on API >= 18 devices
    #
    # @param string [String] the string check for a resourceId
    #                        value will be auto unquoted
    # @param on_match [String] the string to return on resourceId match
    #
    # @return [String] empty string on failure, on_match on successful match
    def resource_id(string, on_match)
      return '' unless string

      # unquote the string
      # "com.example.Test:id/enter" -> com.example.Test:id/enter
      unquote = string.match(/"(.+)"/)
      string = unquote[1] if unquote

      # java_package : type / name
      #
      # com.example.Test:id/enter
      #
      # ^[a-zA-Z_]      - Java package must start with letter or underscore
      # [a-zA-Z0-9\._]* - Java package may contain letters, numbers, periods and underscores
      # :               - : ends the package and starts the type
      # [^\/]+          - type is made up of at least one non-/ characters
      # \\/             - / ends the type and starts the name
      # [\S]+$          - the name contains at least one non-space character and then the line is ended
      resource_id = /^[a-zA-Z_][a-zA-Z0-9\._]*:[^\/]+\/[\S]+$/
      string.match(resource_id) ? on_match : ''
    end

    # Returns a string that matches the first element that contains value
    # For automationName is uiautomator2
    # example: string_visible_contains_xpath 'UIATextField', 'sign in'
    # note for XPath: https://github.com/appium/ruby_lib/pull/561
    #
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains_xpath(class_name, value)
      r_id = resource_id(value, " or @resource-id='#{value}'")

      if class_name == '*'
        return "//*[contains(translate(@text,'#{value.upcase}', '#{value}'), '#{value}')" \
          " or contains(translate(@content-desc,'#{value.upcase}', '#{value}'), '#{value}')" + r_id + ']'
      end

      "//#{class_name}[contains(translate(@text,'#{value.upcase}', '#{value}'), '#{value}')" \
        " or contains(translate(@content-desc,'#{value.upcase}', '#{value}'), '#{value}')" + r_id + ']'
    end

    # Returns a string that matches the first element that contains value
    # For automationName is Appium
    # example: string_visible_contains 'UIATextField', 'sign in'
    # note for XPath: https://github.com/appium/ruby_lib/pull/561
    #
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_contains(class_name, value)
      value = %("#{value}")
      if class_name == '*'
        return (resource_id(value, "new UiSelector().resourceId(#{value});") +
          "new UiSelector().descriptionContains(#{value});" \
          "new UiSelector().textContains(#{value});")
      end

      class_name = %("#{class_name}")
      resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
        "new UiSelector().className(#{class_name}).descriptionContains(#{value});" \
        "new UiSelector().className(#{class_name}).textContains(#{value});"
    end

    # Find the first element that contains value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_contains(class_name, value)
      find_element :uiautomator, string_visible_contains(class_name, value)
    end

    # Find all elements containing value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Array<Element>]
    def complex_finds_contains(class_name, value)
      find_elements :uiautomator, string_visible_contains(class_name, value)
    end

    # @private
    # Create an string to exactly match the first element with target value
    # For automationName is uiautomator2
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact_xpath(class_name, value)
      r_id = resource_id(value, " or @resource-id='#{value}'")

      return "//*[@text='#{value}' or @content-desc='#{value}'" + r_id + ']' if class_name == '*'

      "//#{class_name}[@text='#{value}' or @content-desc='#{value}'" + r_id + ']'
    end

    # @private
    # Create an string to exactly match the first element with target value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [String]
    def string_visible_exact(class_name, value)
      value = %("#{value}")

      if class_name == '*'
        return (resource_id(value, "new UiSelector().resourceId(#{value});") +
          "new UiSelector().description(#{value});" \
          "new UiSelector().text(#{value});")
      end

      class_name = %("#{class_name}")
      resource_id(value, "new UiSelector().className(#{class_name}).resourceId(#{value});") +
        "new UiSelector().className(#{class_name}).description(#{value});" \
        "new UiSelector().className(#{class_name}).text(#{value});"
    end

    # Find the first element exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_find_exact(class_name, value)
      find_element :uiautomator, string_visible_exact(class_name, value)
    end

    # Find all elements exactly matching value
    # @param class_name [String] the class name for the element
    # @param value [String] the value to search for
    # @return [Element]
    def complex_finds_exact(class_name, value)
      find_elements :uiautomator, string_visible_exact(class_name, value)
    end
  end # module Android
end # module Appium
