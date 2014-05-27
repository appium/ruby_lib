module Appium
  class Driver
    # http://developer.android.com/tools/help/uiautomator/UiSelector.html
    @@map = {
      1   => ['text(String text)', 'SELECTOR_TEXT', 1],
      2   => ['textStartsWith(String text)', 'SELECTOR_START_TEXT', 2],
      3   => ['textContains(String text)', 'SELECTOR_CONTAINS_TEXT', 3],
      4   => ['className(String className)', 'SELECTOR_CLASS', 4],
      5   => ['description(String desc)', 'SELECTOR_DESCRIPTION', 5],
      6   => ['descriptionStartsWith(String desc)', 'SELECTOR_START_DESCRIPTION', 6],
      7   => ['descriptionContains(String desc)', 'SELECTOR_CONTAINS_DESCRIPTION', 7],
      8   => ['index(final int index)', 'SELECTOR_INDEX', 8],
      9   => ['instance(final int instance)', 'SELECTOR_INSTANCE', 9],
      10  => ['enabled(boolean val)', 'SELECTOR_ENABLED', 10],
      11  => ['focused(boolean val)', 'SELECTOR_FOCUSED', 11],
      12  => ['focusable(boolean val)', 'SELECTOR_FOCUSABLE', 12],
      13  => ['scrollable(boolean val)', 'SELECTOR_SCROLLABLE', 13],
      14  => ['clickable(boolean val)', 'SELECTOR_CLICKABLE', 14],
      15  => ['checked(boolean val)', 'SELECTOR_CHECKED', 15],
      16  => ['selected(boolean val)', 'SELECTOR_SELECTED', 16],
      # // SELECTOR_ID = 17; // nothing.
      18  => ['packageName(String name)', 'SELECTOR_PACKAGE_NAME', 18],
      # // SELECTOR_CHILD              = 19; // childSelector(UiSelector selector)
      # // SELECTOR_CONTAINER          = 20; // containerSelector(UiSelector selector)
      # // SELECTOR_PATTERN            = 21; // ! private ! patternSelector(UiSelector selector)
      # // SELECTOR_PARENT             = 22; // fromParent(UiSelector selector)
      # // SELECTOR_COUNT              = 23; // nothing.
      24  => ['longClickable(boolean val)', 'SELECTOR_LONG_CLICKABLE', 24],
      25  => ['textMatches(String regex)', 'SELECTOR_TEXT_REGEX', 25],
      26  => ['classNameMatches(String regex)', 'SELECTOR_CLASS_REGEX', 26],
      27  => ['descriptionMatches(String regex)', 'SELECTOR_DESCRIPTION_REGEX', 27],
      28  => ['packageNameMatches(String regex)', 'SELECTOR_PACKAGE_NAME_REGEX', 28],
      29  => ['resourceId(String id)', 'SELECTOR_RESOURCE_ID', 29],
      30  => ['checkable(boolean val)', 'SELECTOR_CHECKABLE', 30],
      31  => ['resourceIdMatches(String regex)', 'SELECTOR_RESOURCE_ID_REGEX', 31],
      # // start internal methods at 100
      100 => ['getStringAttribute("name")', 'GET_NAME', 100]
    }

    # @private
    def dynamic_code_to_string code, value=false
      result = @@map[code].first
      return result unless value
      result.split('(').first + "( \"#{value}\" )"
    end
  end # class Driver
end # module Appium