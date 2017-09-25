module Appium
  module Core
    module SearchContext
      # referenced: ::Selenium::WebDriver::SearchContext

      FINDERS = ::Selenium::WebDriver::SearchContext::FINDERS.merge(accessibility_id: 'accessibility id')

      def self.add_finders(finders)
        FINDERS.merge!(finders)
      end

      #
      # Find the first element matching the given arguments
      #
      # @overload find_element(how, what)
      #   @param [Symbol, String] how The method to find the element by
      #   @param [String] what The locator to use
      # @overload find_element(opts)
      #   @param [Hash] opts Find options
      #   @option opts [Symbol] :how Key named after the method to find the element by, containing the locator
      # @return [Element]
      #
      # @raise [Error::NoSuchElementError] if the element doesn't exist
      #
      # @example Find element with accessibility id
      #    find_elements :accessibility_id, 'Animation'
      #    find_elements :accessibility_id, 'Animation'
      #
      def find_element(*args)
        how, what = extract_args(args)
        by = _set_by_from_finders(how)
        begin
          bridge.find_element_by by, what.to_s, ref
        rescue Selenium::WebDriver::Error::TimeOutError
          raise Selenium::WebDriver::Error::NoSuchElementError
        end
      end

      #
      # Find all elements matching the given arguments
      #
      # @see SearchContext#find_element
      #
      def find_elements(*args)
        how, what = extract_args(args)
        by = _set_by_from_finders(how)
        begin
          bridge.find_elements_by by, what.to_s, ref
        rescue Selenium::WebDriver::Error::TimeOutError
          raise Selenium::WebDriver::Error::NoSuchElementError
        end
      end

      private

      def _set_by_from_finders(how)
        finders = FINDERS
        by = finders[how.to_sym]
        raise ArgumentError, "cannot find element by #{how.inspect}" unless by
        by
      end

      def extract_args(args)
        case args.size
        when 2
          args
        when 1
          arg = args.first

          unless arg.respond_to?(:shift)
            raise ArgumentError, "expected #{arg.inspect}:#{arg.class} to respond to #shift"
          end

          # this will be a single-entry hash, so use #shift over #first or #[]
          arr = arg.dup.shift
          unless arr.size == 2
            raise ArgumentError, "expected #{arr.inspect} to have 2 elements"
          end

          arr
        else
          raise ArgumentError, "wrong number of arguments (#{args.size} for 2)"
        end
      end
    end
  end
end
