require_relative '../android'

module Appium
  module Android
    module Uiautomator2
      class Bridge
        def self.for(target)
          target.extend Appium::Android
          target.extend Appium::Android::Command
          target.extend Appium::Android::Uiautomator2
          target.extend Appium::Android::Uiautomator2::Helper
          target.extend Appium::Android::Uiautomator2::Element
        end
      end
    end
  end
end
