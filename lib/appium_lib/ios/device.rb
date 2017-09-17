module Appium
  module Ios
    module Device
      extend Forwardable

      # @!method touch_id
      #   iOS only;  Simulate Touch ID with either valid (match == true) or invalid (match == false) fingerprint.
      #   @param [Boolean] match fingerprint validity
      #     Defaults to true.
      #   ```ruby
      #   touch_id true #=> Simulate valid fingerprint
      #   touch_id false #=> Simulate invalid fingerprint
      #   ```

      # @!method toggle_touch_id_enrollment
      #   iOS Simulator only:  Toggle touch id enrollment on an iOS Simulator.
      #   @param [Boolean] enabled Enable toggle touch id enrollment. Set true by default.
      #   ```ruby
      #   toggle_touch_id_enrollment       #=> Enable toggle enrolled
      #   toggle_touch_id_enrollment true  #=> Enable toggle enrolled
      #   toggle_touch_id_enrollment false #=> Disable toggle enrolled
      #   ```
      # toggle_touch_id_enrollment
      class << self
        def extended(_mod)
          ::Appium::Core::Device.extend_webdriver_with_forwardable

          ::Appium::Ios::Commands::COMMAND_NO_ARG.each_key do |method|
            ::Appium::Core::Device.add_endpoint_method method
          end

          # TODO: TEST ME
          ::Appium::Core::Device.add_endpoint_method(:touch_id) do
            def touch_id(match = true)
              execute :touch_id, {}, match: match
            end
          end

          # TODO: TEST ME
          ::Appium::Core::Device.add_endpoint_method(:toggle_touch_id_enrollment) do
            def toggle_touch_id_enrollment(enabled = true)
              execute :toggle_touch_id_enrollment, {}, enabled: enabled
            end
          end
        end
      end
    end # module Device
  end # module iOS
end # module Appium
