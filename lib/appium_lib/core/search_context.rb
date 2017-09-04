module Appium
  module Core
    module SearchContext
      FINDERS = ::Selenium::WebDriver::SearchContext::FINDERS.merge(accessibility_id: 'accessibility id').freeze
    end
  end
end
