require_relative '../core/search_context'
require_relative '../android/search_context'
require_relative '../ios/search_context'

module Appium
  class Driver
    module SearchContext
      FINDERS = {}.merge(::Appium::Core::SearchContext::FINDERS)
    end
  end
end
