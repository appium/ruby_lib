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
def back_click(opts = {})
  opts ||= {}
  search_wait = opts.fetch(:wait, 60 * 1.7)
  # iOS may have multiple 'back' buttons
  # select the first displayed? back button.
  wait(search_wait) { button_exact('Back') }.click
end

def leave_textfields
  back_click
  screen.must_equal catalog
end

def go_to_textfields
  screen.must_equal catalog
  wait_true do
    automation_name_is_xcuitest? ? find_element(:name, 'TextFields').click : text('textfield').click
    screen == 'TextFields' # wait for screen transition
  end
end

def screen
  $driver.find_element(:class, ui_ios.navbar).name
end

def catalog
  'UICatalog'
end

def ui_ios
  UI.new($driver)
end

class UI
  def initialize(driver)
    @driver = driver
  end

  def xcuitest?
    @driver.automation_name_is_xcuitest?
  end

  def navbar
    xcuitest? ? 'XCUIElementTypeNavigationBar' : 'UIANavigationBar'
  end

  def button
    xcuitest? ? 'XCUIElementTypeButton' : 'UIAButton'
  end

  def static_text
    xcuitest? ? 'XCUIElementTypeStaticText' : 'UIAStaticText'
  end

  def text_field
    xcuitest? ? 'XCUIElementTypeTextField' : 'UIATextField'
  end

  def secure_text_field
    xcuitest? ? 'XCUIElementTypeSecureTextField' : 'UIASecureTextField'
  end

  def picker
    xcuitest? ? 'XCUIElementTypePicker' : 'UIAPicker'
  end

  def action_sheet
    xcuitest? ? 'XCUIElementTypeActionSheet' : 'UIActionSheet'
  end

  def table
    xcuitest? ? 'XCUIElementTypeTable' : 'UIATable'
  end

  def table_cell
    xcuitest? ? 'XCUIElementTypeCell' : 'UIATableCell'
  end

  def other
    xcuitest? ? 'XCUIElementTypeOther' : raise('unknown UIA element: other')
  end

  def status_bar
    xcuitest? ? 'XCUIElementTypeStatusBar' : 'UIAStatusBar'
  end
end
