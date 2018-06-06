require 'base64'

module Appium
  module Ios
    module Xcuitest
      module Certificate
        # @param [string] cer_file The content of the certificate file.
        #
        # @example
        #
        #     install_certificate cer_file: "path/to/cert.cer"
        #
        def install_certificate(cer_file:)
          args = { content: Base64.encode64(cer_file) }

          @driver.execute_script 'mobile: installCertificate', args
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
