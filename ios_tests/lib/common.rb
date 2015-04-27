
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
    text('textfield').click
    screen == 'TextFields' # wait for screen transition
  end

  screen.must_equal 'TextFields'
end

def screen
  $driver.find_element(:class, 'UIANavigationBar').name
end

def catalog
  'UICatalog'
end
