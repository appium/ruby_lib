Perform touch actions for W3C module. Generate `touch` pointer action here and users can use this via `driver.action`

[Documentation](http://www.rubydoc.info/github/appium/ruby_lib_core/Appium%2FCore%2FBase%2FCoreBridgeW3C:action)

# Example

```ruby
dialect #=> :w3c

# then
el = find_element(:name, 'Pickers')
driver.action.click(el).perform #=> work

driver.action
      .move_to_location(500, 500).pointer_down(:left)
      .move_to_location(0, 700)
      .release.perform

# multiple action chains
f1 = driver.action.add_pointer_input(:touch, 'finger1')
f1.create_pointer_move(duration: 1, x: 200, y: 500,
                   origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
f1.create_pointer_down(:left)
f1.create_pause(0.5)
f1.create_pointer_move(duration: 1, x: 200, y: 200,
                   origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
f1.create_pointer_up(:left)

f2 = driver.action.add_pointer_input(:touch, 'finger2')
f2.create_pointer_move(duration: 1, x: 200, y: 500,
                   origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
f2.create_pointer_down(:left)
f2.create_pause(0.5)
f2.create_pointer_move(duration: 1, x: 200, y: 800,
                   origin: ::Selenium::WebDriver::Interactions::PointerMove::VIEWPORT)
f2.create_pointer_up(:left)

driver.perform_actions [f1, f2]
```

# Note
## Coordinate points
- jsonwp
    - Relative action coordinates are counted relatively to the **top left point** of element's rectangle
- W3C
    - Relative action coordinates are counted relatively to the **center** of element's rectangle

## Limitations
- WebDriverAgent support only `touch` as a `pointer type`.
    - By default, [ruby_lib_core](https://github.com/appium/ruby_lib_core/blob/ab5d7c5ed31f318a9395e5aeafe1d0d655d3cff4/lib/appium_lib_core/common/base/w3c_bridge.rb#L26) generate `touch` based actions.
    - About `pointer type` => [W3C](https://www.w3.org/TR/webdriver/#perform-actions) and [Simple WD Spec](https://github.com/jlipps/simple-wd-spec#perform-actions) 
