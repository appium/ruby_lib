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

# helper code useful for writing and verifying tests using Pry
list = <<TXT
alert_click
alert_text
alert_accept
alert_accept_text
alert_dismiss
alert_dismiss_text
TXT

list.split("\n").each do |method|
  puts "t '#{method}' do"
  puts
  puts 'end'
  puts
end

# for Pry
# class Object
#   def must_equal b
#     raise 'not equal' unless self == b
#   end
# end
