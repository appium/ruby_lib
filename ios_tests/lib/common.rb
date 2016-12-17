
# common methods
def back_click(opts = {})
  opts ||= {}
  search_wait = opts.fetch(:wait, 60 * 1.7)
  # iOS may have multiple 'back' buttons
  # select the first displayed? back button.
  wait(search_wait) do
    button_exact('Back').click
  end
end

def leave_textfields
  back_click
  screen.must_equal catalog
end

def go_to_textfields
  screen.must_equal catalog
  wait_true do
    UI::Inventory.xcuitest? ? find_element(:name, 'TextFields').click : text('textfield').click
    screen == 'TextFields' # wait for screen transition
  end
end

def screen
  $driver.find_element(:class, UI::Inventory.navbar).name
end

def catalog
  'UICatalog'
end

module UI
  module Inventory
    def self.xcuitest?
      $driver.automation_name_is_xcuitest?
    end

    def self.navbar
      xcuitest? ? 'XCUIElementTypeNavigationBar' : 'UIANavigationBar'
    end

    def self.button
      xcuitest? ? 'XCUIElementTypeButton' : 'UIAButton'
    end

    def self.static_text
      xcuitest? ? 'XCUIElementTypeStaticText' : 'UIAStaticText'
    end

    def self.text_field
      xcuitest? ? 'XCUIElementTypeTextField' : 'UIATextField'
    end

    def self.secure_text_field
      xcuitest? ? 'XCUIElementTypeSecureTextField' : 'UIASecureTextField'
    end

    def self.picker
      xcuitest? ? 'XCUIElementTypePicker' : 'UIAPicker'
    end

    def self.action_sheet
      xcuitest? ? 'XCUIElementTypeActionSheet' : 'UIActionSheet'
    end

    def self.table
      xcuitest? ? 'XCUIElementTypeTable' : 'UIATable'
    end

    def self.table_cell
      xcuitest? ? 'XCUIElementTypeCell' : 'UIATableCell'
    end

    def self.other
      xcuitest? ? 'XCUIElementTypeOther' : raise('unknown UIA element: other')
    end

    def self.status_bar
      xcuitest? ? 'XCUIElementTypeStatusBar' : 'UIAStatusBar'
    end
  end
end
