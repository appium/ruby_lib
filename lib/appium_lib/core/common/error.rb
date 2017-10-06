module Appium
  module Core
    module Error
      class CoreError < StandardError; end

      class NoCapabilityError < CoreError; end
      class CapabilityStructureError < CoreError; end

      class NotSupportedAppiumServer < CoreError; end
      class NoSuchElementError < CoreError; end

      # Server side error
      class ServerError; end
    end
  end
end
