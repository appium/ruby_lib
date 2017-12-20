require_relative '../android'

module Appium
  module Android
    module Espresso
      class Bridge
        def self.for(target)
          target.extend Appium::Android
          target.extend Appium::Android::Command
          target.extend Appium::Android::Espresso
        end
      end
    end
  end
end
