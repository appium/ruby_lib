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

# rake android[common/command/command]
describe 'common/command/command' do
  t 'command' do
    File.delete 'logcat.log' if File.exist? 'logcat.log'

    start_logs_broadcast
    sleep 5
    stop_logs_broadcast

    assert File.exist?('logcat.log')
    assert File.size?('logcat.log')
  end
end
