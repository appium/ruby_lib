module Appium
  module Android
    module Espresso
      module Element
        # Scroll to the first element containing target text or description.
        # Scroll happens upto 30 times in centre of device width.
        # @param text [String] the text or resourceId to search for in the text value and content description
        # @return [Element] the element scrolled to
        def scroll_to(text)
          err = nil
          w_s = window_rect

          (1..30).each do |_count|
            begin
              action
                .move_to_location(w_s.width / 2, (w_s.height * 2) / 5) # pointer based magic number
                .pointer_down(:left)
                .move_to_location(0, w_s.height / 5)
                .release
                .perform
              sleep 1 # we must wait finish scrolling

              return text(text)
            rescue StandardError => e
              err = e
            end
          end

          raise err
        end

        # Scroll to the first element with the exact target text or description.
        # Scroll happens upto 30 times in centre of device width.
        # @param text [String] the text or resourceId to search for in the text value and content description
        # @return [Element] the element scrolled to
        def scroll_to_exact(text)
          err = nil
          w_s = window_rect

          (1..30).each do |_count|
            begin
              action
                .move_to_location(w_s.width / 2, (w_s.height * 2) / 5) # pointer based magic number
                .pointer_down(:left)
                .move_to_location(0, w_s.height / 5)
                .release
                .perform
              sleep 1 # we must wait finish scrolling

              return text_exact(text)
            rescue StandardError => e
              err = e
            end
          end

          raise err
        end
      end # module Element
    end # module Espresso
  end # module Android
end # module Appium
