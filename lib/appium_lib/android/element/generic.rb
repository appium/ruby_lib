# encoding: utf-8
module Appium::Android
=begin
name, names, text, text should match substring and case insensitive.

In Android //* is used to find partial case insensitive text matches.
//* is not currently implemented in iOS.

find_element :name by default uses a partial case insensitive match.
On iOS the default is an exact name match.
=end

=begin
    // iOS version
    // https://github.com/appium/ruby_lib/blob/37bb4e90b29e5adb4438b287b6387a504c94b5c4/lib/appium_lib/element/ios/generic.rb#L23
    var search = "name contains[c] '#{text}' || label contains[c] '#{text}' || value contains[c] '#{text}'";
    var a = w.secureTextFields().firstWithPredicate(search);
    if ( isNil(a) ) {
      a = w.textFields().firstWithPredicate(search);
      if ( isNil(a) ) {
        a = w.buttons().firstWithPredicate(search);
        if ( isNil(a) ) {
          a = w.elements().firstWithPredicate(search);
        }
      }
    }

Android considers both a textfield and a secure textfield to be "EditText".
Name (the content desc) is searched first and then we search for value (text).
There's no label in Android.

Android buttons have different class names (android.widget.Button, android.widget.ImageButton)
so we consider the element a button if the class name contains the word button.

After looking for textfields and buttons, then we search all elements. Find will return
the first element that matches.
=end
  def find val
    # s.className('android.widget.EditText').descriptionContains(value);
    args = [ [4, 'android.widget.EditText'], [7, val] ],
    # s.className('android.widget.EditText').textContains(value);
           [ [4, 'android.widget.EditText'], [3, val] ],

           # s.className('android.widget.Button').descriptionContains(value);
           [ [4, 'android.widget.Button'], [7, val] ],
           # s.className('android.widget.Button').textContains(value);
           [ [4, 'android.widget.Button'], [3, val] ],

           # s.className('android.widget.ImageButton').descriptionContains(value);
           [ [4, 'android.widget.ImageButton'], [7, val] ],
           # s.className('android.widget.ImageButton').textContains(value);
           [ [4, 'android.widget.ImageButton'], [3, val] ],

           # s.descriptionContains(value);
           [ [7, val] ],
           # s.textContains(value);
           [ [3, val] ]
    mobile :find, args
  end

  # Return the first element matching text.
  # @param text [String] the text to search for
  # @return [Element] the first matching element
  def text text
    # Return the first element matching selector.
    # s.textContains(value)
    mobile :find, [ [ [3, text] ] ]
  end

  # Return all elements matching text.
  # @param text [String] the text to search for
  # @return [Array<Element>] all matching elements
  def texts text
    @driver.find_elements :xpath, "//*[contains(@text, '#{text}')]"
  end

  # Return the first element matching name.
  # on Android name is content description
  # on iOS name is the accessibility label or the text.
  # @param name [String] the name to search for
  # @return [Element] the first matching element
  def name name
    @driver.find_element :name, name
  end

  # Return all elements matching name.
  # on Android name is content description
  # on iOS name is the accessibility label or the text.
  # @param name [String] the name to search for
  # @return [Array<Element>] all matching elements
  def names name
    @driver.find_elements :name, name
  end
end # module Appium::Android