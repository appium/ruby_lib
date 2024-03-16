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

# rake "ios[ios/element/text]"
describe 'ios/element/text' do
  def ui_catalog
    'UICatalog'
  end

  def uiview_steppers
    'Steppers'
  end

  def before_first
    screen.must_equal catalog
  end

  it 'before_first' do
    before_first
  end

  it 'first_text' do
    first_text.text.must_equal ui_catalog
  end

  it 'last_text' do
    expected = 'Steppers'

    last_text.text.must_equal expected
    last_text.name.must_equal expected
  end

  it 'text' do
    text('epp').text.must_equal uiview_steppers
    text(1).text.must_equal ui_catalog
    text('epp').name.must_equal uiview_steppers
  end

  it 'texts' do
    exp = ['Date Picker', 'AAPLDatePickerController', 'Picker View', 'AAPLPickerViewController']
    texts.length.must_equal 24
    texts('icker').map(&:name).must_equal exp
    texts('AAPL').length.must_equal 11
  end

  it 'text_exact' do
    # should fail
    set_wait 0
    act = begin
      text_exact 'mos'
    rescue StandardError
      # nop
    end
    act.must_be_nil
    set_wait

    # should pass
    text_exact(ui_catalog).text.must_equal ui_catalog
  end

  it 'texts_exact' do
    texts_exact('UICatalog').length.must_equal 1
  end
end
