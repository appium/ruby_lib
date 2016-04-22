# rake ios[wait]
describe 'wait' do
  class WaitTest
    def self.throw_error
      wait_true(timeout: 0.1) { nil }
    end
  end

  Appium.promote_appium_methods(WaitTest)

  t 'has a correct error cause' do
    error = nil
    begin
      WaitTest.throw_error
    rescue => e
      error = e
    end
    error.cause.must_equal nil
  end
end
