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

# rake "android[common/helper]"
class AndroidTest
  class Common
    class Helper < Minitest::Test
      def wait_opts
        { timeout: 0.2, interval: 0.2 } # max_wait, interval
      end

      # There's no `must_not_raise` as the opposite of must_raise

      # By default code is expected to not raise exceptions.
      # must_not_raise is a no-op.

      # wait is a success unless an error is raised
      # max_wait=0 is infinity to use 0.1
      def test_01_wait
        # successful wait should not raise error
        wait(wait_opts) { true }
        wait(wait_opts) { false }
        wait(wait_opts) { nil }

        # failed wait should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(wait_opts) { raise }
        end

        # regular rescue will not handle exceptions outside of StandardError hierarchy
        # must rescue Exception explicitly to rescue everything
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(wait_opts) { raise NoMemoryError }
        end

        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait(timeout: 0.2, interval: 0.0) { raise NoMemoryError }
        end

        e = assert_raises ArgumentError do
          wait_true(invalidkey: 2) { true }
        end
        assert_equal 'unknown keyword: :invalidkey', e.message
      end

      def test_02_ignore
        # ignore should rescue all exceptions
        ignore { true }
        ignore { false }
        ignore { nil }
        ignore { raise }
        ignore { raise NoMemoryError }
      end

      # wait_true is a success unless the value is not true
      def test_03_wait_true
        # successful wait should not error
        wait_true(wait_opts) { true }

        # failed wait should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(wait_opts) { false }
        end

        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(wait_opts) { nil }
        end

        # raise should error
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(wait_opts) { raise }
        end

        # regular rescue will not handle exceptions outside of StandardError hierarchy
        # must rescue Exception explicitly to rescue everything
        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(wait_opts) { raise NoMemoryError }
        end

        assert_raises ::Appium::Core::Wait::TimeoutError do
          wait_true(timeout: 0.2, interval: 0.0) { raise NoMemoryError }
        end

        e = assert_raises ArgumentError do
          wait_true(invalidkey: 2) { true }
        end
        assert_equal 'unknown keyword: :invalidkey', e.message
      end

      def test_04_back
        # start page
        wait { assert_equal texts.length, 13 }
        # nav to new page.
        # ele 0 is the title and can't be clicked.
        wait { text(2).click }
        wait { assert_equal texts.length, 5 }
        # go back
        back
        # start page
        wait { find 'NFC' }
      end

      def test_05_session_id
        wait { assert_match(/\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/, session_id) }
      end

      def test_06_xpath
        #  Access'ibility is for Espresso
        wait { assert ['API Demos', "Access'ibility"].include? xpath('//android.widget.TextView').text }
      end

      def test_07_xpaths
        wait { assert_equal xpaths('//android.widget.TextView').length, 13 }
      end

      def test_08_ele_index
        # Animation is for Espresso
        wait { assert %w(Accessibility Animation).include? ele_index('android.widget.TextView', 3).text }
      end

      def test_09_tags
        wait { assert_equal tags('android.widget.TextView').length, 13 }
      end

      def test_10_first_ele
        wait do
          # Access'ibility is for Espresso
          assert ['API Demos', "Access'ibility"].include? first_ele('android.widget.TextView').text
        end
      end

      def test_11_last_ele
        wait do
          # "API Demos" is for Espresso
          assert ['API Demos', 'Views'].include? last_ele('android.widget.TextView').text
        end
      end

      # def test_01_source' do # tested by get_so

      def test_12_get_source
        wait do
          assert_equal get_source.class, String
        end
      end
    end
  end
end
