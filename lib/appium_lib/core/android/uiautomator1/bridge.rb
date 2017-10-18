require_relative '../../android'

module Appium
  module Core
    module Android
      module Uiautomator1
        module Bridge
          def self.for(target)
            target.extend Appium::Android::Device
            ::Appium::Core::Android::SearchContext.extend

            ::Appium::Core::Android::Touch.extend_touch_actions
            ::Appium::Core::Android::Touch.extend_multi_touch
          end
        end
      end
    end
  end
end
