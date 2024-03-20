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

# rake ios[ios/command/source]
class IosTest
  class Ios
    class Command
      class Source < Minitest::Test
        def test_source
          assert_equal xcuitest_source(format: :json).is_a?(Hash), true
          assert_equal xcuitest_source(format: :xml).is_a?(String), true
        end
      end
    end
  end
end
