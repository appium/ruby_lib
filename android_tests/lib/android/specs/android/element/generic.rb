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

# rake "android[android/element/generic]"
describe 'android/element/generic' do
  def content
    'Content'
  end

  def partial
    'tent'
  end

  t 'find works before and after get_source' do
    wait { find(partial).text.must_equal content }
    wait { get_source.class.must_equal String }
    wait { find(partial).text.must_equal content }
  end

  t 'find' do
    wait { find(partial).text.must_equal content }
  end

  t 'finds' do
    wait { finds(partial).first.text.must_equal content }
  end

  t 'find_exact' do
    wait { find_exact(content).text.must_equal content }
  end

  t 'finds_exact' do
    wait { finds_exact(content).first.text.must_equal content }
  end

  # scroll_to is broken
  t 'scroll_to' do
    wait { scroll_to('Views').click }
    wait { scroll_to('scrollbars').text.must_equal 'ScrollBars' }

    wait { find('ScrollBars').click }
    wait { text('style').click }
    wait { scroll_to('Developers', 1).text.must_include 'What would it take to build a better mobile phone?' }
    back
    back
    # back to start activity
    back
  end

  t 'scroll_to_exact' do
    wait { scroll_to('Views').click }

    wait { scroll_to_exact('ScrollBars').text.must_equal 'ScrollBars' }
    wait { find('ScrollBars').click }
    wait { text('style').click }
    back
    back
    # back to start activity
    back
  end
end
