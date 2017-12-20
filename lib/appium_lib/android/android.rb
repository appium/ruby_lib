require_relative 'common/helper'
require_relative 'common/command/command'

require_relative 'element/alert'
require_relative 'element/button'
require_relative 'element/generic'
require_relative 'element/textfield'
require_relative 'element/text'

# android - uiautomator2
require_relative 'uiautomator2'

# android - espresso
require_relative 'espresso'

module Appium
  module Android
    class Bridge
      def self.for(target)
        target.extend Appium::Android
        target.extend Appium::Android::Command
      end
    end
  end
end
