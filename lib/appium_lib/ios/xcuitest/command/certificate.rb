# frozen_string_literal: true

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'base64'

module Appium
  module Ios
    module Xcuitest
      module Certificate
        # Generates Apple's over-the-air configuration profile for certificate deployment
        # based on the given PEM certificate content.
        # https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/iPhoneOTAConfiguration/Introduction/Introduction.html
        # https://github.com/appium/appium-xcuitest-driver/pull/652
        #
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
