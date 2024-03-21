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

# rake "android[android/patch]"
class AndroidTest
  class Patch < Minitest::Test
    def test_type
      # nav to textfield
      wait { find('app').click }
      wait { find('Search').click }
      wait { find('Invoke Search').click }

      wait { first_textfield.type 'ok' }
      wait { assert_equal first_textfield.text, 'ok' }

      # TODO: how to invoke random am start commands?
      # nav to start activity
      # io.appium.android.apis/io.appium.android.apis.ApiDemos

      # keyboard may exist, if it doesn't then an error will raise
      ignore { hide_keyboard }

      # return to app start
      back
      wait { find('Invoke Search') }
      back
      wait { find_exact('Search') }
      back
      wait { find('app') }
    end
  end
end
