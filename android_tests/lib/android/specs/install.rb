describe 'install' do
  # To Do: Blocked on https://github.com/appium/appium/issues/3032
  def pkg
    'io.appium.android.apis'
  end

  def installed
    app_installed?(pkg).must_equal true
  end

  def not_installed
    app_installed?(pkg).must_equal false
  end

  t 'install/uninstall' do
    installed
    remove_app 'io.appium.android.apis'
    not_installed
    install_app caps[:app]
    installed
  end

  # no way to launch apk after it's uninstalled/installed
  # blocked on: https://github.com/appium/appium/issues/2969
  # launch_app
end
