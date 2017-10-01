require_relative '../core/core'
require_relative '../version'

module Appium
  module Http
    class Default < ::Appium::Core::Base::Http::Default
      DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze
    end
  end
end
