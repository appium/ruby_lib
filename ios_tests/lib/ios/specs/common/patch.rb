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

#  Skip:
#    status # status patches are already tested in driver.rb
#    execute # debug output for Pry
#

# bundle exec rake "ios[common/patch]"
describe 'common/patch.rb' do
  def before_first
    screen.must_equal catalog
  end

  it 'before_first' do
    before_first
  end

  # Attributes are busted in Android.
  # Blocked on https://github.com/appium/appium/issues/628
  describe 'Appium::Core::Element methods' do
    # TODO: t 'value' do; end

    it 'name' do
      first_text.name.must_equal 'UICatalog'
    end

    # t 'tag_name' do; end # Doesn't work on Android

    it 'location_rel' do
      loc = first_text.location_rel($driver)
      loc.x.class.must_equal String
      loc.y.class.must_equal String
    end
  end
end
