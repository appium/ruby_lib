# frozen_string_literal: true

require 'minitest/autorun'
require 'appium_lib'

class Core14Test < Minitest::Test
  class Session
    attr_reader :waits, :screenshots

    def initialize
      @waits = []
      @screenshots = []
    end

    def manage = self
    def timeouts = self

    def implicit_wait=(value)
      @waits << value
    end

    def save_element_screenshot(element, path)
      @screenshots << [element, path]
      :saved
    end

    def quit; end
  end

  def build(options = {})
    Appium::Driver.new({ caps: { platformName: 'Android', automationName: 'UiAutomator2' },
                        appium_lib: { debug: false }.merge(options) })
  end

  def attach_session(wrapper, session)
    wrapper.core.define_singleton_method(:start_driver) { |**_options| session }
    wrapper.define_singleton_method(:appium_server_version) { {} }
    wrapper.start_driver
  end

  def test_string_options_without_converting_capabilities_or_mutating_input
    caps = { 'platformName' => 'Android', 'appium:automationName' => 'UiAutomator2',
             'appium:settings' => { 'ignoreUnimportantViews' => true }.freeze }.freeze
    options = { 'caps' => caps, 'appium_lib' => { 'debug' => false, 'wait' => 2 }.freeze }.freeze
    wrapper = Appium::Driver.new(options)

    assert_equal 2, wrapper.default_wait
    assert_equal :android, wrapper.appium_device
    assert_equal caps, wrapper.caps.as_json
    assert_equal %w[caps appium_lib], options.keys
    assert_equal %w[debug wait], options['appium_lib'].keys
  end

  def test_configured_implicit_wait_is_applied_to_each_new_session
    wrapper = build(wait: 2)
    first = Session.new
    replacement = Session.new
    assert_same first, attach_session(wrapper, first)
    assert_same replacement, attach_session(wrapper, replacement)
    assert_equal [2], first.waits
    assert_equal [2], replacement.waits
    assert_equal 2, wrapper.default_wait
    wrapper.no_wait
    wrapper.set_wait
    assert_equal [2, 0, 2], replacement.waits
  end

  def test_explicit_zero_wait_is_applied
    wrapper = build(wait: 0)
    session = Session.new
    attach_session(wrapper, session)
    assert_equal [0], session.waits
  end

  def test_session_start_tolerates_unimplemented_implicit_wait
    ['The operation requested is not yet implemented',
     'The operation requested is not yet implemented by Espresso driver'].each do |message|
      wrapper = build(wait: 2)
      session = Session.new
      session.define_singleton_method(:implicit_wait=) do |_value|
        raise Selenium::WebDriver::Error::UnknownError, message
      end

      assert_same session, attach_session(wrapper, session)
      assert_same session, wrapper.driver
    end
  end

  def test_session_start_preserves_other_implicit_wait_errors
    wrapper = build(wait: 2)
    session = Session.new
    original = Selenium::WebDriver::Error::UnknownError.new('Timeout configuration failed')
    session.define_singleton_method(:implicit_wait=) { |_value| raise original }

    error = assert_raises(Appium::Core::Error::ServerError) { attach_session(wrapper, session) }
    assert_equal original.message, error.message
    assert_same original, error.cause
  end

  def test_absent_or_nil_wait_does_not_send_a_timeout_command
    [{}, { wait: nil }].each do |options|
      wrapper = build(options)
      session = Session.new
      attach_session(wrapper, session)
      assert_empty session.waits
      assert_equal 0, wrapper.default_wait
    end
  end

  def test_screenshot_helpers_use_supported_core_method
    wrapper = build
    session = Session.new
    attach_session(wrapper, session)
    element = Object.new
    assert_nil wrapper.element_screenshot(element, 'element.png')
    assert_equal :saved, wrapper.take_element_screenshot(element, 'legacy.png')
    assert_equal :saved, wrapper.save_element_screenshot(element, 'saved.png')
    assert_equal [[element, 'element.png'], [element, 'legacy.png'], [element, 'saved.png']], session.screenshots
  end

  def test_wait_helpers_retry_missing_elements
    wrapper = build
    %i[wait wait_true].each do |method|
      attempts = 0
      result = wrapper.public_send(method, timeout: 1, interval: 0) do
        attempts += 1
        raise Selenium::WebDriver::Error::NoSuchElementError if attempts == 1

        :found
      end
      assert_equal :found, result
      assert_equal 2, attempts
    end
  end

  def test_wait_helpers_propagate_programming_errors_and_interruptions
    wrapper = build
    %i[wait wait_true].each do |method|
      [NoMethodError, Interrupt, SystemExit].each do |error|
        assert_raises(error) { wrapper.public_send(method, timeout: 1, interval: 0) { raise error } }
      end
    end
  end

  def test_wait_helpers_accept_explicit_retry_exceptions
    wrapper = build
    %i[wait wait_true].each do |method|
      attempts = 0
      result = wrapper.public_send(method, timeout: 1, interval: 0, ignored: [RuntimeError]) do
        attempts += 1
        raise 'transient failure' if attempts == 1

        :ready
      end
      assert_equal :ready, result
      assert_equal 2, attempts
      assert_raises(Selenium::WebDriver::Error::NoSuchElementError) do
        wrapper.public_send(method, timeout: 1, ignored: []) { raise Selenium::WebDriver::Error::NoSuchElementError }
      end
    end
  end

  def test_numeric_timeout_and_wait_success_semantics
    wrapper = build
    assert_equal false, wrapper.wait(1) { false }
    assert_nil wrapper.wait(1) { nil }
    assert_equal :ready, wrapper.wait_true(1) { :ready }
    assert_raises(Appium::Core::Wait::TimeoutError) { wrapper.wait_true(timeout: 0.001, interval: 0) { false } }
  end

  def test_promoted_wait_helpers_propagate_explicit_errors_and_retry_assertions
    target = Class.new(Minitest::Test)
    Appium.promote_appium_methods(target, build)
    page = target.new('promoted_wait')

    %i[wait wait_true].each do |method|
      error = assert_raises(RuntimeError) do
        page.public_send(method, timeout: 1) { raise 'wait condition failed' }
      end
      assert_equal 'wait condition failed', error.message

      attempts = 0
      result = page.public_send(method, timeout: 1, interval: 0, ignored: [Minitest::Assertion]) do
        attempts += 1
        raise Minitest::Assertion, 'not ready' if attempts == 1

        true
      end
      assert result
      assert_equal 2, attempts
    end
  end
end
