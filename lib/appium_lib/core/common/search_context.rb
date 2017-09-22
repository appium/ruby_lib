module Appium
  module Core
    module SearchContext
      # include Selenium::WebDriver::SearchContext

      FINDERS = ::Selenium::WebDriver::SearchContext::FINDERS.merge(accessibility_id: 'accessibility id')

      def self.add_finders(finders)
        FINDERS.merge!(finders)
      end

      # TODO: Move find_element from core/device to here
      def find_element(*args)
        how, what = extract_args(args)
        by = _set_by_from_finders(how)
        begin
          bridge.find_element_by by, what.to_s, ref
        rescue Selenium::WebDriver::Error::TimeOutError
          raise Selenium::WebDriver::Error::NoSuchElementError
        end
      end

      def find_elements(*args)
        how, what = extract_args(args)
        by = _set_by_from_finders(how)
        begin
          bridge.find_elements_by by, what.to_s, ref
        rescue Selenium::WebDriver::Error::TimeOutError
          raise Selenium::WebDriver::Error::NoSuchElementError
        end
      end

      def _set_by_from_finders(how)
        finders = FINDERS
        by = finders[how.to_sym]
        raise ArgumentError, "cannot find element by #{how.inspect}" unless by
        by
      end
    end
  end
end
