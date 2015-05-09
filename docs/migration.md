### Breaking Changes in 7.0

Requires appium 1.4.0-beta or newer for iOS helper methods. appium_lib no longer automatically promotes methods on minispec. To restore the old behavior use: `Appium.promote_appium_methods ::Minitest::Spec`

The implicit wait now defaults to zero. To restore the old behavior, use `set_wait 30`.

           Old | New
            :--|:--
`installed?`   | `app_installed?`

### Breaking Changes in 5.0

           Old | New
            :--|:--
`launch`       | `launch_app`
`install`      | `install_app`
`remove`       | `remove_app`

method_missing has been removed from the Ruby bindings. If you want to invoke methods on the top level object,
you can use the following:

`Appium.promote_appium_methods Object`

Also make sure to update to Appium Ruby Console v1.0.3 or better. Old consoles will not work with the 5.0 release due to the removal of method_missing.

### Breaking Changes in 4.0

           Old | New
            :--|:--
`key_event`    | `press_keycode`

### Breaking Changes in 2.0

In 2.0, the e_* methods have been renamed.

           Old | New
            :--|:--
`e_buttons`    | `buttons`
`e_s_texts`    | `texts`
`e_textfields` | `textfields`

All s_texts methods have been renamed.

            Old | New
             :--|:--
`s_text`        | `text`
`s_texts`       | `texts`
`first_s_text`  | `first_text`
`last_s_text`   | `last_text`
`s_text_exact`  | `text_exact`
`s_texts_exact` | `texts_exact`

Other changes:

                 Old | New
                  :--|:--
`press_for_duration` | `long_press`
`current_context=`   | `set_context`
`name`               | `find`
