module Appium
  module Ios
    module Xcuitest
      module MultiAppHandler
        # TODO: consider xcuitest prefix whether override existing methods or define the other word.
        # https://github.com/appium/ruby_lib_core/blob/82e2526de95b05e8a49872e0b69835e99acc66e5/lib/appium_lib_core/common/command.rb#L39

        def xcuitest_install_app(app:)
          args = { app: app }
          @driver.execute_script 'mobile: installApp', args
        end

        def xcuitest_install_app?(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: isAppInstalled', args
        end

        def xcuitest_remove_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: removeApp', args
        end

        def xcuitest_launch_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: launchApp', args
        end

        def xcuitest_terminate_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: terminateApp', args
        end

        def xcuitest_query_app_status(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: queryAppState', args
        end

        def xcuitest_activate_app(bundle_id:)
          args = { bundleId: bundle_id }
          @driver.execute_script 'mobile: activateApp', args
        end
      end
    end # module Xcuitest
  end # module Ios
end # module Appium
