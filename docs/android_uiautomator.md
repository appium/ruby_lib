# Help debugging

- `adb shell uiautomator events` 
    - Prints out accessibility events to the console until the connection to the device is terminated
    - [URL](https://stuff.mit.edu/afs/sipb/project/android/docs/tools/help/uiautomator/index.html)
    - **notice**
        - If Appium is started then it terminates the other `uiautomator` processes

# uiautomator2
## difference between uiautomator1 and uiautomator2
- `find_element/s :id, "ids"`
    - uiautomator1
        - Find elements with `resource_id`
        - Find elements with string id resource(string.xml based)
    - uiautomator2
        - Find elements with `resource_id`
    - from: Does not appium-uiautomator2-server support finding string ids with "id" strategy? [issue](https://github.com/appium/appium/issues/8349)
