**Deprecated** Because iOS driver for UIAutomation is deprecated.

# Index Paths on iOS

Elements on iOS have an [index path attribute](https://github.com/appium/appium-uiauto/blob/2cf1e30801263dfc01627ded28a1be5af1083bc5/uiauto/lib/element-patch/tree-patch.js#L9)
that appium calculates when the page source is requested. Note this is not the same as xpath.

> <UIAStaticText name="Alerts" label="Alerts" value="Alerts" dom="" enabled="true" valid="true" visible="true" hint="" path="/0/1/1/10/0" x="17.578125" y="596" width="53.90625" height="25.78125">

The index path can be used by calling [getElementByIndexPath]( https://github.com/appium/appium-uiauto/blob/af1befa8208074686cd38b845ddefabc057106fc/uiauto/lib/mechanic-ext/xpath-ext.js#L239):

```ruby
# ruby example # For Appium(automation name), not XCUITest
execute_script('$.getElementByIndexPath("/0/1/1/10/0")').text # Alerts
```

Internally what happens is `/0/1/1/10/0` is transformed into `1/1/10/0` and executed as follows:

```ruby
# ruby example # For Appium(automation name), not XCUITest
execute_script('$.mainApp().elements()[1].elements()[1].elements()[10].elements()[0]').text # Alerts
```

The initial 0 refers to the context so that's [discarded](https://github.com/appium/appium-uiauto/blob/af1befa8208074686cd38b845ddefabc057106fc/uiauto/lib/mechanic-ext/xpath-ext.js#L218).

In summary, you shouldn't try and convert the index path to an xpath. It's meant to be used via the built in helper method.
