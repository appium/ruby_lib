# rubocop:disable Lint/RescueException
# rubocop:disable Metrics/LineLength

# Skip:
#   status # status patches are already tested in driver.rb
#   raw_execute # debug output for Pry

describe 'common/patch' do
  # Attributes are busted in Android.
  # Blocked on https://github.com/appium/appium/issues/628
  describe 'Selenium::WebDriver::Element methods' do
    # Android supports exactly two string Attributes
    # .name and .text
    # https://github.com/appium/appium/blob/ea3450e7f78d1794bab42fa396a387e7b86fd3b3/android/bootstrap/src/io/appium/android/bootstrap/handler/GetAttribute.java#L43
    # t 'value' do; end # Doesn't work on Android

    t 'name' do
      wait { first_text.name.must_equal 'API Demos' }
    end

    # t 'tag_name' do; end # Doesn't work on Android

    t 'location_rel' do
      wait do
        loc = first_text.location_rel
        loc.x.class.must_equal String
        loc.y.class.must_equal String
      end
    end
  end

  describe 'common patch' do
    # By default, the webdriver gem will return message instead of origValue
    # {"message":"An unknown server-side error occurred while processing the command.","origValue":"Strategy id is not valid."}
    t 'id error_message' do
      value = ''
      begin
        set_wait 0
        find_element(:id, 'ok')
      rescue Exception => e
        value = e.message
      ensure
        set_wait 30
      end
      value = value.split("\n").first.strip
      exp   = 'No element found'
      value.must_equal exp
    end

    t 'id success' do
      wait do
        el = id 'autocomplete_3_button_7' # <string name="autocomplete_3_button_7">Text</string>
        el.name.must_equal 'Text'
      end
    end

    t 'find many elements by resource id' do
      wait do
        value = find_elements(:id, 'android:id/text1').length
        value.must_equal 12
      end
    end

    t 'find single element by resource id' do
      wait do
        value = id('android:id/text1').text
        value.must_equal "Access'ibility"
      end
    end
  end
end
