require_relative '../../android_espresso'

module Appium
  module Core
    module Android
      module Espresso
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
