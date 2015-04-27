# rubocop:disable Lint/RescueException
# rubocop:disable Metrics/LineLength

#
#  Skip:
#    status # status patches are already tested in driver.rb
#    raw_execute # debug output for Pry
#

# rake ios[common/patch]
describe 'common/patch.rb' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  # Attributes are busted in Android.
  # Blocked on https://github.com/appium/appium/issues/628
  describe 'Selenium::WebDriver::Element methods' do
    # TODO: t 'value' do; end

    t 'name' do
      first_text.name.must_equal 'UICatalog'
    end

    # t 'tag_name' do; end # Doesn't work on Android

    t 'location_rel' do
      loc = first_text.location_rel
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
      rescue Exception => e
        value = e.message
      ensure
        set_wait
      end
      value.must_equal 'Invalid locator strategy: css selector'
    end
  end
end
