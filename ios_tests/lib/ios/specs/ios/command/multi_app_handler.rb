# rake ios[ios/command/multi_app_handler]
describe 'ios/command/source' do
  # Only for Xcode 9+
  t 'multip app handler' do
    test_app_bundle = 'com.example.apple-samplecode.UICatalog'

    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground

    xcuitest_terminate_app(bundle_id: test_app_bundle).must_equal true
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :not_running

    xcuitest_activate_app(bundle_id: test_app_bundle).must_be_empty
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground

    xcuitest_activate_app(bundle_id: 'com.apple.Preferences').must_be_empty
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground

    xcuitest_activate_app(bundle_id: test_app_bundle).must_be_empty
    wait(timeout: 5) do
      xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal :running_in_foreground
    end
  end
end
