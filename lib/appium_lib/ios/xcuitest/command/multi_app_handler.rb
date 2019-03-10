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

module Appium
  module Ios
    module Xcuitest
      # **Note** Works only for Xcode 9+.
      # Instance methods have `xcuitest_` prefix to prevent conflicts for core commands.
      # see: https://github.com/appium/ruby_lib_core/blob/82e2526de95b05e8a49872e0b69835e99acc66e5/lib/appium_lib_core/common/command.rb#L39
      module MultiAppHandler
        # Installs given application to the device under test. If the same application is already installed
        # then it's going to be installed over it, which allows to test upgrades.
        # Be careful while reinstalling the main application under test - make sure you called terminateApp
        # for it first, otherwise WebDriverAgent will detect it as a potential application crash.
        #
        # @param [String] app The path to an existing .ipa/.app file on the server file system, zipped .app file
        #                     or an URL pointing to a remote .ipa/.zip file. Mandatory argument.
        # @return {}
        #
        # @example
        #
        #     xcuitest_install_app(app: "path/to/app.app")
        #
        def xcuitest_install_app(app:)
          args = { app: app }
          @driver.execute_script 'mobile: installApp', args
        end

        # Verifies whether the application with given bundle identifier is installed on the device.
        #
        # @param [String] bundle_id The bundle identifier of the application, which is going to be verified.
        # @return [boolean]
        #
        # @example
        #
        #     xcuitest_app_installed?(bundle_id: "io.appium.bundle") #=> true or false
        #
        def xcuitest_app_installed?(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: isAppInstalled', args
        end

        # Uninstalls an existing application from the device under test. This endpoint does not verify
        # whether the application is already installed or not before uninstalling it.
        #
        # @param [String] bundle_id The bundle identifier of the application, which is going to be uninstalled.
        # @return {}
        #
        # @example
        #
        #     xcuitest_remove_app(bundle_id: "io.appium.bundle") #=> 1
        #
        def xcuitest_remove_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: removeApp', args
        end

        # Executes an existing application on the device. If the application is already running then
        # it will be brought to the foreground.
        #
        # @param [String] bundle_id The bundle identifier of the application, which is going to be executed.
        # @return {}
        #
        # @example
        #
        #     xcuitest_launch_app(bundle_id: "io.appium.bundle") #=> 1
        #
        def xcuitest_launch_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: launchApp', args
        end

        # Terminates an existing application on the device. If the application is not running then
        # the returned result will be false, otherwise true.
        #
        # @param [String] bundle_id The bundle identifier of the application, which is going to be terminated.
        # @return {}
        #
        # @example
        #
        #     xcuitest_terminate_app(bundle_id: "io.appium.bundle") #=> 1
        #
        def xcuitest_terminate_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: terminateApp', args
        end

        # Get the status of an existing application on the device.
        # State:
        #   0: The current application state cannot be determined/is unknown
        #   1: The application is not running
        #   2: The application is running in the background and is suspended
        #   3: The application is running in the background and is not suspended
        #   4: The application is running in the foreground
        #
        # For more details: https://developer.apple.com/documentation/xctest/xcuiapplicationstate
        #
        # @param [String] bundle_id A target app's bundle id
        # @return [0|1|2|3|4] A number of the state
        #
        # @example
        #
        #     xcuitest_query_app_status(bundle_id: "io.appium.bundle") #=> 1
        #
        def xcuitest_query_app_status(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: queryAppState', args
        end

        # Activates an existing application on the device under test and moves it to the foreground.
        # The application should be already running in order to activate it.
        # The call is ignored if the application is already in foreground.
        #
        # @param [String] bundle_id The bundle identifier of the application, which is going to be brought to the foreground.
        # @return {}
        #
        # @example
        #
        #     xcuitest_activate_app(bundle_id: "io.appium.bundle") #=> 1
        #
        def xcuitest_activate_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: activateApp', args
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
