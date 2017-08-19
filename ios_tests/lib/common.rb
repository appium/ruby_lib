
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
