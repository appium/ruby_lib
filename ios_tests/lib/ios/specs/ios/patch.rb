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

# rake "ios[ios/patch]"
describe 'ios/patch' do
  def before_first
    screen.must_equal catalog
    go_to_textfields
  end

  def after_last
    leave_textfields
  end

  t 'before_first' do
    before_first
  end

  t 'label' do
    textfields[0].label.must_equal ''
  end

  t 'type' do
    text('text fields').click

    ele = first_textfield

    ele.clear
    ele.type 'ok'
    ele.text.must_equal 'ok'
  end

  t 'after_last' do
    after_last
  end
end
