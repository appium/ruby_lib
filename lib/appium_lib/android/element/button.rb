# UIAButton methods
module Appium
  module Android
    Button      = 'android.widget.Button'
    ImageButton = 'android.widget.ImageButton'

    private

    # @private
    def _button_visible_string opts={}
      index = opts.fetch :index, false
      if index
        %Q(//#{Button}[#{index}] | //#{ImageButton}[#{index}])
      else
        %Q(//#{Button} | //#{ImageButton})
      end
    end

    # @private
    def _button_exact_string value
      button       = string_visible_exact Button, value
      image_button = string_visible_exact ImageButton, value
      "#{button} | #{image_button}"
    end

    # @private
    def _button_contains_string value
      button       = string_visible_contains Button, value
      image_button = string_visible_contains ImageButton, value
      "#{button} | #{image_button}"
    end
    
    public

    # Find a button by text and optionally number.
    # @param value [String, Integer] the value to exactly match. If int then the button at that index is returned.
    # @return [Button] the button found with text and matching number
    def button value
      # Don't use ele_index because that only works on one element type.
      # Android needs to combine button and image button to match iOS.
      if value.is_a? Numeric
        index = value
        raise "#{index} is not a valid xpath index. Must be >= 1" if index <= 0

        return xpath _button_visible_string index: index
      end

      xpath _button_contains_string value
    end

    def buttons value
     xpaths _button_contains_string value
    end

    # Get the first button element.
    # @return [Button]
    def first_button
      xpath _button_visible_string
    end

    # Get the last button element.
    # @return [Button]
    def last_button
       xpath _button_visible_string index: 'last()'
    end

    # Get the first button element that exactly matches text.
    # @param value [String] the value to match exactly
    # @return [Button]
    def button_exact value
      xpath _button_exact_string value
    end

    # Get all button elements that exactly match text.
    # @param value [String] the value to match exactly
    # @return [Array<Button>]
    def buttons_exact value
      xpaths _button_exact_string value
    end

    # Get an array of button elements.
    # @return [Array<Button>]
    def e_buttons
      xpaths _button_visible_string
    end
  end # module Android
end # module Appium