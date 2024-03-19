# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# rake "ios[common/helper]"
class IosTest
  class Common
    class Helper < Minitest::Test
      def setup
        @wait_opts = { timeout: 0.2, interval: 0.2 } # max_wait, interval
      end

      def test_01_before_first
        assert_equal screen, catalog
      end

      # There's no `must_not_raise` as the opposite of must_raise
      #
      # By default code is expected to not raise exceptions.
      # must_not_raise is a no-op.

      # wait is a success unless an error is raised
      # max_wait=0 is infinity to use 0.1
      def test_02_wait
        # successful wait should not raise error
        wait(@wait_opts) { true }
        wait(@wait_opts) { false }
        wait(@wait_opts) { nil }

        # failed wait should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(@wait_opts) { raise }
        end

        # regular rescue will not handle exceptions outside of StandardError hierarchy
        # must rescue Exception explicitly to rescue everything
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(@wait_opts) { raise NoMemoryError }
        end

        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(timeout: 0.2, interval: 0.0) { raise NoMemoryError }
        end
        e = assert_raises ArgumentError do
          wait(invalidkey: 2) { true }
        end
        assert_equal 'unknown keyword: :invalidkey', e.message
      end

      def test_03_ignore
        # ignore should rescue all exceptions
        ignore { true }
        ignore { false }
        ignore { nil }
        ignore { raise }
        ignore { raise NoMemoryError }
      end

      # wait_true is a success unless the value is not true
      def test_04_wait_true
        # successful wait should not error
        wait_true(@wait_opts) { true }

        # failed wait should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(@wait_opts) { false }
        end
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(@wait_opts) { nil }
        end


        # raise should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(@wait_opts) { raise }
        end


        # regular rescue will not handle exceptions outside of StandardError hierarchy
        # must rescue Exception explicitly to rescue everything
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(@wait_opts) { raise NoMemoryError }
        end
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(timeout: 0.2, interval: 0.0) { raise NoMemoryError }
        end


        e = assert_raises ArgumentError do
          wait_true(invalidkey: 2) { true }
        end
        assert_equal 'unknown keyword: :invalidkey', e.message
      end

      def test_06_back
        # start page
        assert_equal tag(ui_ios.navbar).name, 'UICatalog'
        # nav to new page.
        wait_true do
          text('buttons').click
          tag(ui_ios.navbar).name == 'Buttons'
        end

        assert_equal tag(ui_ios.navbar).name, 'Buttons'
        # go back
        back_click
        # start page
        assert_equal tag(ui_ios.navbar).name, 'UICatalog'
      end

      def test_07_session_id
        # Sauce doesn't return '-' so make them optional.
        assert_match /\h{8}-?\h{4}-?\h{4}-?\h{4}-?\h{12}/, session_id
      end

      def test_08_xpath
        assert_equal xpath("//#{ui_ios.static_text}").name, 'UICatalog'
      end

      def test_09_xpaths
        assert_equal xpaths("//#{ui_ios.static_text}").length, 35
      end

      def uibutton_text
        'Buttons'
      end

      def action_sheets
        'Action Sheets'
      end

      def test_10_ele_index
        assert_equal ele_index(ui_ios.static_text, 2).name, action_sheets
      end

      # TODO: 'string_attr_exact'

      def test_11_find_ele_by_attr
        el_id = find_ele_by_attr(ui_ios.static_text, 'name', uibutton_text).instance_variable_get :@id
        assert_match /\d+/, el_id
      end

      def test_12_find_eles_by_attr
        # '!' clears the input buffer in Pry so make sure there's
        # no space after the !
        set_wait 1
        # empty array returned when no match
        found = !find_eles_by_attr(ui_ios.static_text, 'name', uibutton_text).empty?
        assert_equal found, true

        found = !find_eles_by_attr(ui_ios.static_text, 'name', 'zz').empty?
        assert_equal found, false
        set_wait
      end

      def test_13_find_ele_by_predicate
        el_text = find_ele_by_predicate(value: uibutton_text).text
        assert_equal el_text, uibutton_text

        el_name = find_ele_by_predicate(value: uibutton_text).name
        assert_equal el_name, uibutton_text
      end

      def test_14_find_eles_by_predicate
        ele_count = find_eles_by_predicate(value: uibutton_text).length
        assert_equal ele_count, 1

        ele_count = find_eles_by_predicate(value: 'zz').length
        assert_equal ele_count, 0
      end

      # TODO: 'string_attr_include'

      def test_15_find_ele_by_attr_include
        el_text = find_ele_by_attr_include(ui_ios.static_text, :name, 'button').text
        assert_equal el_text, uibutton_text

        el_name = find_ele_by_attr_include(ui_ios.static_text, :name, 'button').name
        assert_equal el_name, uibutton_text
      end

      def test_16_find_eles_by_attr_include
        ele_count = find_eles_by_attr_include(ui_ios.static_text, :name, 'e').length
        assert_equal ele_count, 31
      end

      def test_17_find_ele_by_predicate_include
        el_text = find_ele_by_predicate_include(value: 'button').text
        assert_equal el_text, uibutton_text

        el_name = find_ele_by_predicate_include(value: 'button').name
        assert_equal el_name, uibutton_text
      end

      def test_18_find_eles_by_predicate_include
        assert_equal find_eles_by_predicate_include(value: 'e').length, 49
      end

      def test_19_first_ele
        assert_equal first_ele(ui_ios.static_text).name, 'UICatalog'
      end

      def test_20_last_ele
        expected = 'Steppers'

        el = last_ele(ui_ios.static_text)
        assert_equal el.text, expected
        assert_equal el.name, expected
      end

      # t 'source' do # tested by get_source

      def test_21_get_source
        assert_equal get_source.class, String
      end

      def test_22_invalid_id_should_error
        assert_raises Selenium::WebDriver::Error::NoSuchElementError do
          id 'does not exist'
        end

        assert_raises Selenium::WebDriver::Error::NoSuchElementError do
          id 'android:id/text1'
        end
      end

      def test_23_tag
        assert_equal tag(ui_ios.navbar).name, 'UICatalog'
      end

      def test_24_tags
        assert_equal tags(ui_ios.table_cell).length, 12
      end

      def test_25_find_eles_by_attr_include_length
        assert_equal find_eles_by_attr_include(ui_ios.static_text, 'name', 'AAPL').length, 16
      end

      def test_26_get_page_class
        act = get_page_class

        assert(act.split("\n").length >= 7)
        assert_includes act, '25x XCUIElementTypeOther'
        assert_includes act, '24x XCUIElementTypeStaticText'
        assert_includes act, '12x XCUIElementTypeCell'
        assert_includes act, '1x XCUIElementTypeTable'
        assert_includes act, '1x XCUIElementTypeNavigationBar'
        assert_includes act, '1x XCUIElementTypeWindow'
        assert_includes act, '1x XCUIElementTypeApplication'
      end

      # TODO: write tests
      # page_class
      # px_to_window_rel
      # lazy_load_strings
      # xml_keys
      # xml_values
      # resolve_id
      # string_visible_contains
      # xpath_visible_contains
      # xpaths_visible_contains
      # string_visible_exact
      # xpath_visible_exact
      # xpaths_visible_exact
      # raise_no_element_error
    end
  end
end
