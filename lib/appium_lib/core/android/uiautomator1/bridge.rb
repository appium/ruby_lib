require_relative '../../android'

module Appium
  module Core
    module Android
      module Uiautomator1
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
