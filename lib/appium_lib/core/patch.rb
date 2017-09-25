require_relative '../version'

module Appium
  module Core
    # Implement useful features for element.
    class Selenium::WebDriver::Element # rubocop:disable Style/ClassAndModuleChildren
      # Note: For testing .text should be used over value, and name.

      # Returns the value attribute
      #
      # Fixes NoMethodError: undefined method `value' for Selenium::WebDriver::Element
      def value
        attribute :value
      end

      # Returns the name attribute
      #
      # Fixes NoMethodError: undefined method `name' for Selenium::WebDriver::Element
      def name
        attribute :name
      end

      # Enable access to iOS accessibility label
      # accessibility identifier is supported as 'name'
      def label
        attribute :label
      end

      # Alias for type
      alias type send_keys

      # For use with mobile tap.
      #
      # ```ruby
      # execute_script 'mobile: tap', :x => 0.0, :y => 0.98
      # ```
      #
      # @return [OpenStruct] the relative x, y in a struct. ex: { x: 0.50, y: 0.20 }
      def location_rel(driver = $driver)
        if ::Appium.selenium_webdriver_version_more?('3.4.0')
          rect   = self.rect
          location_x = rect.x.to_f
          location_y = rect.y.to_f

          size_width  = rect.width.to_f
          size_height = rect.height.to_f
        else
          location   = self.location
          location_x = location.x.to_f
          location_y = location.y.to_f

          size        = self.size
          size_width  = size.width.to_f
          size_height = size.height.to_f
        end

        center_x = location_x + (size_width / 2.0)
        center_y = location_y + (size_height / 2.0)

        w = driver.window_size
        OpenStruct.new(x: "#{center_x} / #{w.width.to_f}",
                       y: "#{center_y} / #{w.height.to_f}")
      end
    end
  end # module Core
end # module Appium
