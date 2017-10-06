require_relative '../../ios'

module Appium
  module Core
    module Ios
      module Uiautomation
        module Bridge
          def self.for(target)
            Core::Ios::SearchContext.extend
            target.extend Appium::Ios::Device

            Core::Ios::Uiautomation.patch_webdriver_element
          end
        end
      end
    end
  end
end
