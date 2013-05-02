# encoding: utf-8
module Appium::Ios
  # UIATextField & UIASecureTextField methods
  #
  # Find textfield and then secure elements in one server call
  # to match Android.

  # Get an array of textfield texts.
  # @return [Array<String>]
  def textfields
    find_2_eles_attr :textfield, :secure, :text
  end

  # Get an array of textfield elements.
  # @return [Array<Textfield>]
  def e_textfields
    execute_script textfield_js
  end

  # Get the first textfield element.
  # @return [Textfield]
  def first_textfield
    js = textfield_js 'r = r.length > 0 ? $(r[0]) : r;'
    execute_script(js).first
  end

  # Get the last textfield element.
  # @return [Textfield]
  def last_textfield
    js = textfield_js 'r = r.length > 0 ? $(r[r.length - 1]) : r;'
    execute_script(js).first
  end

  # Get the first textfield that matches text.
  # @param text [String, Integer] the text to match exactly. If int then the textfield at that index is returned.
  # @return [Textfield]
  def textfield text
    # Don't use ele_index because that only works on one element type.
    # iOS needs to combine textfield and secure to match Android.
    if text.is_a? Numeric
      js = textfield_js "r = r.length > 0 ? $(r[#{text}]) : r;"
      return execute_script(js).first
    end

    textfield_include text
  end

  # Get the first textfield that includes text.
  # @param text [String] the text the textfield must include
  # @return [Textfield]
  def textfield_include text
    js = %Q(
      var t = au.getElementsByXpath('textfield[contains(@text, "#{text}")]').value;
      var s = au.getElementsByXpath('secure[contains(@text, "#{text}")]').value;
      t.concat(s)[0];
    )

    execute_script js
  end

  # Get the first textfield that exactly matches text.
  # @param text [String] the text the textfield must exactly match
  # @return [Textfield]
  def textfield_exact text
    # find_ele_by_text :textfield, text
    js = %Q(
      var t = au.getElementsByXpath('textfield[@text="#{text}"]').value;
      var s = au.getElementsByXpath('secure[@text="#{text}"]').value;
      t.concat(s)[0];
    )

    execute_script js
  end

  # Return combined lookup of textfield and secure
  # with an optional filter. $() wrap is required for .each
  def textfield_js filter=''
  %Q(
    var t = au.lookup('textfield');
    var s = au.lookup('secure');
    var r = $(t.concat(s));
    #{filter}
    au._returnElems(r);
  )
  end
end # module Appium::Ios