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

# rake "android[common/element/window]"
class AndroidTest
  class Common
    class Element
      class Window < Minitest::Test
        def test_window_size
          wait do
            size = window_size
            assert_equal size.width.class, Integer
            assert_equal size.height.class, Integer
          end
        end
      end
    end
  end
end
