# encoding: utf-8
module Appium
  module Ios
    def find value
      xpath xpath_visible_contains '*', value
    end

    def finds value
      xpaths xpath_visible_contains '*', value
    end

    def find_exact value
      xpath xpath_visible_exact '*', value
    end

    def finds_exact value
      xpaths xpath_visible_exact '*', value
    end
  end # module Ios
end # module Appium