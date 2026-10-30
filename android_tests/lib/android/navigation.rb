# frozen_string_literal: true

# Helpers for functional tests that need a fresh native ApiDemos screen.
module AndroidTestNavigation
  def start_test_activity(component)
    AppiumTestSession.driver.execute_script 'mobile: startActivity',
                                            component: component,
                                            action: 'android.intent.action.MAIN',
                                            flags: '0x10200000',
                                            wait: true,
                                            stop: true
  end

  def reset_test_app
    start_test_activity('io.appium.android.apis/.ApiDemos')
  end
end
