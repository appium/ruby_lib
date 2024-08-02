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

# common methods
def back_click
  back
end

def leave_textfields
  back_click
  assert screen == catalog
end

def go_to_textfields
  assert screen == catalog
  wait_true do
    find_element(:name, 'Text Fields').click
    screen == 'Text Fields' # wait for screen transition
  end
end

def screen
  $driver.find_element(:class, ui_ios.navbar).name
end

def catalog
  'UICatalog'
end

def target_bundle_id
  'com.example.apple-samplecode.UICatalog'
end

def ui_ios
  UI.new($driver)
end

class UI
  def initialize(driver)
    @driver = driver
  end

  def navbar
    'XCUIElementTypeNavigationBar'
  end

  def button
    'XCUIElementTypeButton'
  end

  def static_text
    'XCUIElementTypeStaticText'
  end

  def text_field
    'XCUIElementTypeTextField'
  end

  def secure_text_field
    'XCUIElementTypeSecureTextField'
  end

  def picker
    'XCUIElementTypePicker'
  end

  def picker_wheel
    'XCUIElementTypePickerWheel'
  end

  def action_sheet
    'XCUIElementTypeActionSheet'
  end

  def table
    'XCUIElementTypeTable'
  end

  def table_cell
    'XCUIElementTypeCell'
  end

  def other
    'XCUIElementTypeOther'
  end

  def status_bar
    'XCUIElementTypeStatusBar'
  end
end
