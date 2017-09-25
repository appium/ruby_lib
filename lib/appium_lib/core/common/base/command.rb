module Appium
  module Core
    class Base
      module Commands
        OSS = ::Selenium::WebDriver::Remote::OSS::Bridge::COMMANDS.freeze
        W3C = ::Selenium::WebDriver::Remote::W3C::Bridge::COMMANDS.freeze
      end # module Commands
    end # module Base
  end # module Core
end # module Appium
