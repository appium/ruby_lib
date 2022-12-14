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

# rake "ios[ios/element/textfield]"
describe 'ios/element/textfield' do
  def enter_text
    'Placeholder text'
  end

  def enter_password
    'Placeholder text'
  end

  def before_first
    go_to_textfields
  end

  def after_last
    set_wait 30
  end

  t 'before_first' do
    before_first
  end

  t 'textfield' do
    textfield(1).text.must_equal(enter_text)
    textfield(enter_text).text.must_equal(enter_text)
    textfield('holder').value.must_equal enter_password
  end

  t 'textfields' do
    values = textfields('text').map(&:value)
    values.include?(enter_text).must_equal true
    values.include?(enter_password).must_equal true # secure as well
    textfields.length.must_equal 5
  end

  t 'predicate textfields' do
    textfields = find_elements(:predicate, "type contains[c] 'textfield'")
    textfields.length.must_equal 5
  end

  t 'first_textfield' do
    first_textfield.text.must_equal enter_text
  end

  t 'last_textfield' do
    last_textfield.text.must_equal enter_text
  end

  t 'textfield_exact' do
    textfield_exact(enter_password).value.must_equal enter_password
  end

  t 'textfields_exact' do
    textfields_exact(enter_password).first.value.must_equal enter_password
  end

  t 'textfield type' do
    textfield(1).send_keys "o'k"

    find_exact("o'k").text.must_equal "o'k"
  end

  def must_raise_no_element
    proc { yield }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'hide_keyboard' do
    first_textfield.click
    hide_keyboard
  end

  # test textfield methods with no textfields

  t 'leave textfields' do
    set_wait 1
    leave_textfields
  end

  t 'no textfield' do
    must_raise_no_element { textfield(1) }
    must_raise_no_element { textfield('does not exist') }
  end

  t 'no textfields' do
    textfields('does not exist').length.must_equal 0
  end

  t 'no first_textfield' do
    must_raise_no_element { first_textfield }
  end

  t 'no last_textfield' do
    must_raise_no_element { last_textfield }
  end

  t 'no textfield_exact' do
    must_raise_no_element { textfield_exact('does not exist') }
  end

  t 'no textfields_exact' do
    textfields_exact('does not exist').length.must_equal 0
  end

  t 'after_last' do
    after_last
  end
end
