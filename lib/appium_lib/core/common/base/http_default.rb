module Appium
  module Core
    module Base
      module Http
        class Default < Selenium::WebDriver::Remote::Http::Default
          # TODO: when divide the core to the other gem, then update here. appium/ruby_lib_core/#{version}
          DEFAULT_HEADERS = { 'Accept' => CONTENT_TYPE, 'User-Agent' => "appium/ruby_lib/#{::Appium::VERSION}" }.freeze
        end
      end
    end
  end
end
