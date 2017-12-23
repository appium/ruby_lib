Perform touch actions for W3C module. Generate `touch` pointer action here and users can use this via `driver.action`

[Documentation](http://www.rubydoc.info/github/appium/ruby_lib_core/Appium%2FCore%2FBase%2FCoreBridgeW3C:action)

```ruby
dialect #=> :w3c

# then
el = find_element(:name, 'Pickers')
driver.action.click(el).perform #=> work

driver.action
      .move_to_location(500, 500).pointer_down(:left)
      .move_to_location(0, 700)
      .release.perform
```
