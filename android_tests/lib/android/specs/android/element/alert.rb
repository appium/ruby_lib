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

# rake android[android/element/alert]
describe 'android/element/alert' do
  def open_alert
    # trigger the alert
    wait { button('OK Cancel dialog with a message').click }
  end

  t 'alert_click' do
    # nav to alert activity
    wait { find('app').click }
    wait { find('alert').click }

    # test
    wait { open_alert }
    wait { alert_click('OK') }
  end

  t 'alert_accept' do
    wait { open_alert }
    wait { alert_accept }
  end

  t 'alert_accept_text' do
    wait { open_alert }
    wait { alert_accept_text.must_equal 'OK' }
    wait { alert_accept }
  end

  t 'alert_dismiss' do
    wait { open_alert }
    wait { alert_dismiss }
  end

  t 'alert_dismiss_text' do
    wait { open_alert }

    # alert dialog button placement changed:
    # 'OK Cancel dialog with a long message'
    # Android L: 'Something, Cancel, Ok'
    # Android 19: 'Cancel, Something, Ok'

    wait { alert_dismiss_text.downcase.must_equal 'cancel' }
    wait { alert_dismiss }

    # nav to start activity
    2.times { back }
  end
end
