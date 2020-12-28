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

# rake "ios[ios/command/pasteboard]"
describe 'ios/command/pasteboard' do
  t 'pasteboard' do
    # set blank before testing because pasteboard is remaining during launching simulators
    set_pasteboard content: 'before'
    get_pasteboard.must_equal 'before'

    set_pasteboard content: 'sample content'

    get_pasteboard.must_equal 'sample content'
  end
end
