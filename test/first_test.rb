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

require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest'

begin
  Minitest::Reporters.use! [Minitest::Reporters::ProgressReporter.new]
rescue Errno::ENOENT
  # Ignore since Minitest::Reporters::JUnitReporter.new fails in deleting files, sometimes
end

class SampleTest < Minitest::Test
  def test_test
    assert(true)
  end
end
