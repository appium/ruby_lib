# encoding: utf-8

=begin
  Skip:
    status # status patches are already tested in driver.rb
    raw_execute # debug output for Pry
=end

describe 'common/patch.rb' do
  before_first { screen.must_equal catalog }
# Attributes are busted in Android.
# Blocked on https://github.com/appium/appium/issues/628
  describe 'Selenium::WebDriver::Element methods' do
    # Android supports exactly two string Attributes
    # .name and .text
    # https://github.com/appium/appium/blob/ea3450e7f78d1794bab42fa396a387e7b86fd3b3/android/bootstrap/src/io/appium/android/bootstrap/handler/GetAttribute.java#L43
    # t 'value' do; end # Doesn't work on Android

    t 'name' do
      first_s_text.name.must_equal 'UICatalog'
    end

    # t 'tag_name' do; end # Doesn't work on Android

    t 'location_rel' do
      loc = first_s_text.location_rel
      loc.x.class.must_equal String
      loc.y.class.must_equal String
    end
  end

  describe 'common patch' do
    # By default, the webdriver gem will return message instead of origValue
    # {"message":"An unknown server-side error occurred while processing the command.","origValue":"Strategy id is not valid."}
    t 'error_message' do
      value = ''
      begin
        set_wait 0
        find_element(:css, 'ok')
      rescue Exception => e;
        value = e.message
      ensure
        set_wait
      end
      value.must_equal "Invalid locator strategy: css selector"
    end
  end
end