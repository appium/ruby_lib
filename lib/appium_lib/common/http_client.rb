require 'appium_lib_core'
require_relative '../version'

module Appium
  module Http
    class Default < ::Appium::Core::Base::Http::Default
      # Default HTTP client inherit Appium::Core::Base::Http::Default, but has different DEFAULT_HEADERS
      DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze
    end
  end
end
