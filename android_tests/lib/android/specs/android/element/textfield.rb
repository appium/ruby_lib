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

# rake "android[android/element/textfield]"
describe 'android/element/textfield' do
  def must_raise_no_element
    proc { yield }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  def left
    'Left is best'
  end

  def right
    'Right is always right'
  end

  def before_first
    # nav to activity
    wait { find('app').click }
    wait { find('activity').click }
    wait { find('custom title').click }
  end

  def after_last
    # back to start
    3.times { back }
  end

  t { before_first }

  t 'textfield' do
    wait { textfield(1).text.must_equal left }
    wait { textfield('right').text.must_equal right }
  end

  t 'textfields' do
    wait { textfields('right').first.text.must_equal right }
    wait { textfields.length.must_equal 2 }
  end

  t 'first_textfield' do
    wait { first_textfield.text.must_equal left }
  end

  t 'last_textfield' do
    wait { last_textfield.text.must_equal right }
  end

  t 'textfield_exact' do
    must_raise_no_element { textfield_exact 'zz' }
    wait { textfield_exact(left).text.must_equal left }
  end

  t 'textfields_exact' do
    wait { textfields_exact('zz').must_equal [] }
    wait { textfields_exact(left).first.text.must_equal left }
  end

  t 'hide_keyboard' do
    first_textfield.click
    hide_keyboard
  end

  t { after_last }
end
