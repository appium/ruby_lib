require_relative '../../android_uiautomator2'

module Appium
  module Core
    module Android
      module Uiautomator2
        module Bridge
          def self.for(target)
            target.extend Appium::Android::Device
            ::Appium::Core::Android::SearchContext.extend
          end
        end
      end
    end
  end
end
