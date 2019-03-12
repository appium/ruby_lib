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

# rake ios[ios/helper]
describe 'ios/helper' do
  def before_first
    screen.must_equal catalog
  end

  t 'before_first' do
    before_first
  end

  t 'ios_password' do
    ios_password.must_equal 8226.chr('UTF-8')
    ios_password(2).must_equal 8226.chr('UTF-8') * 2
  end

  t 'page' do
    page # writes to std out
  end

  t 'id' do
    id 'Buttons' # 'Various uses of UIButton'
  end

  t 'platform_version' do
    platform_version.wont_be_empty
  end

  t 'tags_include' do
    elements = tags_include class_names: %w(XCUIElementTypeTextView)
    elements.length.must_equal 0

    elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
    elements.length.must_equal 24

    elements = tags_include class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'u'
    elements.length.must_equal 13
  end

  t 'tags_exact' do
    elements = tags_exact class_names: %w()
    elements.length.must_equal 0

    elements = tags_exact class_names: %w(XCUIElementTypeStaticText)
    elements.length.must_equal 24

    elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText)
    elements.length.must_equal 24

    elements = tags_exact class_names: %w(XCUIElementTypeTextView XCUIElementTypeStaticText), value: 'Buttons'
    elements.length.must_equal 1
    elements.first.value.must_equal 'Buttons'
  end
end
