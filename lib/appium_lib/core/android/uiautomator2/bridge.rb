require_relative '../../android_uiautomator2'

module Appium
  module Core
    module Android
      module Uiautomator2
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
