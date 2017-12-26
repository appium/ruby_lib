# rake ios[ios/command/multi_app_handler]
describe 'ios/command/source' do
  # Only for Xcode 9+
  t 'multip app handler' do
    test_app_bundle = 'com.example.apple-samplecode.UICatalog'

    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal 4

    xcuitest_terminate_app(bundle_id: test_app_bundle).must_equal true
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal 1

    xcuitest_activate_app(bundle_id: test_app_bundle).must_equal {}
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal 4

    xcuitest_activate_app(bundle_id: 'com.apple.Preferences').must_equal {}
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal 2

    xcuitest_activate_app(bundle_id: test_app_bundle).must_equal {}
    xcuitest_query_app_status(bundle_id: test_app_bundle).must_equal 4
  end
end
