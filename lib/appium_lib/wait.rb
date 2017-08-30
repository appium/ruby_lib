require_relative 'core/wait'

module Appium
  module Common
    class Wait < ::Appium::Core::Wait
      def initialize(opts = {})
        super(opts)
      end
    end
  end
end
