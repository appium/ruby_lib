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

# rake "android[android/element/button]"
describe 'android/element/button' do
  def before_first
    # nav to buttons activity
    wait { find('App').click }
    wait { find('Activity').click }
    wait { find('Animation').click }
  end

  def after_last
    # nav back to home activity
    3.times { back }
  end

  def fade_in
    'Fade in'
  end

  t { before_first }

  t 'button' do
    # by index
    2.times { wait { button(1).text.upcase.must_equal fade_in.upcase } }

    # by name contains
    wait { button('ade').text.upcase.must_equal fade_in.upcase }
  end

  t 'buttons' do
    exp = ['ZOOM IN', 'MODERN ZOOM IN', 'THUMBNAIL ZOOM']
    wait { buttons('zoom').map(&:text).map(&:upcase).must_equal exp }
    wait { buttons.length.must_equal 6 }
  end

  t 'first_button' do
    wait { first_button.text.upcase.must_equal fade_in.upcase }
  end

  t 'last_button' do
    wait { last_button.text.upcase.must_equal 'THUMBNAIL ZOOM' }
  end

  t 'button_exact' do
    wait { button_exact(fade_in).text.upcase.must_equal fade_in.upcase }
  end

  t 'buttons_exact' do
    2.times { wait { buttons_exact(fade_in).first.text.upcase.must_equal fade_in.upcase } }
  end

  t { after_last }
end
