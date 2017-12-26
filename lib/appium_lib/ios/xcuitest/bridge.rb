require_relative '../ios'

module Appium
  module Ios
    module Xcuitest
      class Bridge
        def self.for(target)
          target.extend Appium::Ios
          target.extend Appium::Ios::Device
          target.extend Appium::Ios::Xcuitest
          target.extend Appium::Ios::Xcuitest::PasteBoard
          target.extend Appium::Ios::Xcuitest::Source
          target.extend Appium::Ios::Xcuitest::Helper
          target.extend Appium::Ios::Xcuitest::Gesture
          target.extend Appium::Ios::Xcuitest::MultiAppHandler
          target.extend Appium::Ios::Xcuitest::Element
        end
      end
    end
  end
end
