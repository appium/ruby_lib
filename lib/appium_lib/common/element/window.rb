# UIAWindow methods
module Appium
  module Common
    # Get the window's size
    def window_size
      return nil if @driver.nil?
      @driver.manage.window.size
    end
  end # module Common
end # module Appium
