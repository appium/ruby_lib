require_relative 'search_context'
require_relative 'command'
require_relative 'device'

require_relative 'common/helper'
require_relative 'common/patch'
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
        target.extend Appium::Ios::SearchContext
        target.extend Appium::Ios::Device
      end
    end
  end
end
