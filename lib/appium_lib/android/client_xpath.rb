require 'nokogiri'

module Appium
  module Android
    def _nodeset_to_uiselector(opts = {})
      results = ''

      nodes = opts[:nodes]
      first = opts[:first]

      nodes = [nodes[0]] if first

      nodes.each do |node|
        results += %(new UiSelector().className("#{node.name}").instance(#{node.attr('instance')});)
      end

      results.strip
    end

    def _client_xpath(opts = {})
      root_node = Nokogiri::XML(get_source).children.first

      instance = Hash.new(-1)

      root_node.traverse do |node|
        number = instance[node.name] += 1
        node.set_attribute 'instance', number
      end

      nodes = root_node.xpath(opts[:xpath])
      first = opts[:first]

      _nodeset_to_uiselector nodes: nodes, first: first
    end

    def client_xpath(xpath)
      find_element :uiautomator, _client_xpath(xpath: xpath, first: true)
    end

    def client_xpaths(xpath)
      find_elements :uiautomator, _client_xpath(xpath: xpath, first: false)
    end
  end
end

# http://stackoverflow.com/questions/9199415/getting-first-node-in-xpath-result-set
# '(//android.widget.TextView)[1]' not '//android.widget.TextView[1]'
