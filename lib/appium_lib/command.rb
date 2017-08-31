require_relative 'core/command'
require_relative 'ios/command'
require_relative 'android/command'

module Appium
  class Driver
    module Commands
      COMMAND_NO_ARG = {}.merge(::Appium::Core::Commands::COMMAND_NO_ARG)
                           .merge(::Appium::Android::Commands::COMMAND_NO_ARG)
                           .merge(::Appium::Ios::Commands::COMMAND_NO_ARG).freeze

      COMMAND = {}.merge(::Appium::Core::Commands::COMMAND)
                    .merge(::Appium::Android::Commands::COMMAND)
                    .merge(::Appium::Ios::Commands::COMMAND)
                    .merge(COMMAND_NO_ARG).freeze

      COMMANDS_EXTEND_OSS = COMMAND.merge(::Selenium::WebDriver::Remote::OSS::Bridge::COMMANDS).freeze
      COMMANDS_EXTEND_W3C = COMMAND.merge(::Selenium::WebDriver::Remote::W3C::Bridge::COMMANDS).freeze
    end
  end
end
