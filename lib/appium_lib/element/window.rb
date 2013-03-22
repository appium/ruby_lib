# encoding: utf-8
# UIAWindow methods

# Get the window's size
#
# window_size.width
#
# window_size.height
def window_size
  return nil if $driver.nil?
  $driver.manage.window.size
end