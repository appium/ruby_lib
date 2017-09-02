module Appium
  module Common
    def get_log(type)
      Appium::Core::Logs.new(@driver.manage.logs).get type
    end

    def get_available_log_types
      Appium::Core::Logs.new(@driver.manage.logs).available_types
    end
  end # module Common
end # module Appium
