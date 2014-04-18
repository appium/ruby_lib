# encoding: utf-8
module Appium
  module Ios
    # UIATextField & UIASecureTextField methods
    #
    # Find textfield and then secure elements in one server call
    # to match Android.

    def locate_single_textfield js
      ele = execute_script(js)
      ele = ele.first if ele.kind_of? Array
      raise_no_element_error unless ele.kind_of? Selenium::WebDriver::Element
      ele
    end

    # Get an array of textfield texts.
    # Does not respect implicit wait because we're using execute_script.
    # @return [Array<String>]
    def textfields
      find_2_eles_attr :textfield, :secure, :text
    end

    # Get an array of textfield elements.
    # @return [Array<Textfield>]
    def e_textfields
      xpaths 'textfield'
    end

    # Get the first textfield element.
    # @return [Textfield]
    def first_textfield
      xpath 'textfield'
    end

    # Get the last textfield element.
    # @return [Textfield]
    def last_textfield
      xpath 'textfield[last()]'
    end

    # Get the first textfield that matches text.
    # @param text [String, Integer] the text to match exactly. If int then the textfield at that index is returned.
    # @return [Textfield]
    def textfield text
      # Don't use ele_index because that only works on one element type.
      # iOS needs to combine textfield and secure to match Android.
      if text.is_a? Numeric
        raise "#{text} is not a valid xpath index. Must be >= 1" if text <= 0
        return xpath("textfield[#{text}]")
      end

      textfield_include text
    end

    # Get the first textfield that includes text.
    # @param text [String] the text the textfield must include
    # @return [Textfield]
    def textfield_include text
      xpath "textfield[contains(@text,'#{text}')]"
    end

    # Get the first textfield that exactly matches text.
    # @param text [String] the text the textfield must exactly match
    # @return [Textfield]
    def textfield_exact text
      xpath "textfield[@text='#{text}']"
    end

    # Get the first textfield that exactly matches name
    # @return [Element]
    def textfield_named target_name
      wait do
        target = e_textfields.detect { |e| e.name == target_name }
        raise "Textfield named #{target_name} not found" unless target
        target
      end
    end
  end # module Ios
end # module Appium