require_relative '../../android'

module Appium
  module Core
    module Android
      module Uiautomator1
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
