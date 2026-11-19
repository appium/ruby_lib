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

# FIXME: The order is broken in Ruby 3.
# rake "ios[ios/element/button]"

class IosTest
  class Ios
    class Element
      class Button < Minitest::Test
        def before_first
          assert_equal screen, catalog
          # nav to buttons activity
          wait { find_element(:name, 'Buttons').click }
          wait_true(ignored: [Selenium::WebDriver::Error::NoSuchElementError,
                              Selenium::WebDriver::Error::StaleElementReferenceError]) do
            screen == 'Buttons' && button_exact('UIAccessoryButtonPlus').displayed?
          end
        end

        def after_last
          # nav back to start
          back_click
        end

        def test_01_before_first
          driver.terminate_app target_bundle_id
          driver.activate_app target_bundle_id

          before_first
        end

        def test_02_button
          wait(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError,
                         Selenium::WebDriver::Error::StaleElementReferenceError]) do
            # Reacquire the elements on every attempt while the view settles.
            # by index
            assert_equal 'UIAccessoryButtonPlus', button(3).name

            # by name contains
            assert_equal 'UIAccessoryButtonPlus', button('Plus').name
          end
        end

        def test_03_buttons
          exp = %w(UICatalog UIAccessoryButtonPlus)

          wait(ignored: [Minitest::Assertion, Selenium::WebDriver::Error::NoSuchElementError,
                         Selenium::WebDriver::Error::StaleElementReferenceError]) do
            target_buttons = buttons('a')
            assert_equal exp, target_buttons.map(&:name)
            assert_equal exp.length, target_buttons.length
          end
        end

        def test_04_first_button
          assert_equal first_button.name, 'UICatalog'
        end

        def test_05_last_button
          expected = 'Button'
          assert_equal last_button.name, expected
        end

        def test_06_button_exact
          assert_equal button_exact('UIAccessoryButtonPlus').name, 'UIAccessoryButtonPlus'
        end

        def test_07_buttons_exact
          assert_equal buttons_exact('UIAccessoryButtonPlus').first.name, 'UIAccessoryButtonPlus'
        end

        def test_08_after_last
          after_last
        end
      end
    end
  end
end
