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

# rake "android[android/element/text]"
describe 'android/element/text' do
  def must_raise_no_element
    proc { yield }.must_raise Selenium::WebDriver::Error::NoSuchElementError
  end

  t 'text' do
    wait { ['API Demos', "Access'ibility"].must_include text(1).text }
    wait { text('mos').text.must_equal 'API Demos' }
  end

  t 'texts' do
    wait { texts('i').length.must_equal 7 }
    wait { texts.length.must_equal 13 }
  end

  t 'first_text' do
    wait { ['API Demos', "Access'ibility"].must_include first_text.text }
  end

  t 'last_text' do
    wait { ['API Demos', 'Views'].must_include last_text.text }
  end

  t 'text_exact' do
    must_raise_no_element { text_exact 'mos' }

    # should pass
    wait { text_exact('API Demos').text.must_equal 'API Demos' }
  end

  t 'texts_exact' do
    wait { texts_exact('API Demos').length.must_equal 1 }
  end
end
