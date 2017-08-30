module Appium
  module Error
    class NotSupportedAppiumServer < RuntimeError; end

    # Server side error
    class ServerError; end
  end
end
