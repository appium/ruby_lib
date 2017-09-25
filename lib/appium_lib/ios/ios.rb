require_relative 'common/helper'
require_relative 'common/errors'

require_relative 'element/alert'
require_relative 'element/button'
require_relative 'element/generic'
require_relative 'element/textfield'
require_relative 'element/text'

require_relative 'xcuitest'

module Appium
  module Ios
    class Bridge
      def self.for(target)
        target.extend Appium::Ios
      end
    end
  end
end
