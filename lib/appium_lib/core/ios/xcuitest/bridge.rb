require_relative '../../ios_xcuitest'

module Appium
  module Core
    module Ios
      module Xcuitest
        module Bridge
          def self.for(target)
            Core::Ios::SearchContext.extend
            Core::Ios::Xcuitest::SearchContext.extend
            target.extend Appium::Ios::Device
            target.extend Appium::Ios::Xcuitest::Device
          end
        end
      end
    end
  end
end
