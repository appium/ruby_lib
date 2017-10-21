require_relative '../../android_uiautomator2'

module Appium
  module Core
    module Android
      module Uiautomator2
        module Bridge
          def self.for(target)
            target.extend Appium::Android::Device
            Core::Android::SearchContext.extend

            Core::Android::Touch.extend_touch_actions
          end
        end
      end
    end
  end
end
