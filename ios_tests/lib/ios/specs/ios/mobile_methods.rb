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

# rake ios[ios/mobile_methods]
describe 'ios/mobile_methods' do
  def before_first
    screen.must_equal catalog
  end

  it 'an element with class chain' do
    element = find_element :class_chain, '**/XCUIElementTypeStaticText'

    element.name.must_equal catalog
  end

  it 'elements with class chain' do
    elements = find_elements :class_chain, 'XCUIElementTypeWindow/*/*'

    elements.size.must_equal 4
    elements[0].name.must_equal catalog
    elements[1].name.must_be_nil
  end
end
