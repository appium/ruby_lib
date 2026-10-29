# frozen_string_literal: true

require 'minitest/autorun'
require 'appium_lib'

class NonGlobalDriverTest < Minitest::Test
  class Session
    attr_reader :quit_count, :calls
    attr_accessor :strings

    def initialize(name, width = 375)
      @name = name
      @width = width
      @quit_count = 0
      @calls = []
      @strings = { 'label' => name }
    end

    def quit
      @quit_count += 1
    end

    def session_id = @name
    def window_size = Struct.new(:width, :height).new(@width, 667)
    def app_strings(*) = @strings
    def page_source = "<hierarchy><android.widget.Button text=\"#{@name}\" /></hierarchy>"

    def find_elements(*args)
      @calls << [:find_elements, args]
      []
    end

    def find_element(*args)
      @calls << [:find_element, args]
      @name
    end

    def update_settings(settings)
      @calls << [:update_settings, settings]
      settings
    end

    def execute_script(*args)
      @calls << [:execute_script, args]
      args
    end
  end

  def setup
    @previous_global = $driver
    $driver = nil
  end

  def teardown
    $driver = @previous_global
  end

  def build(*sessions, global: false, platform: 'Android', automation: 'UiAutomator2')
    wrapper = Appium::Driver.new({ caps: { platformName: platform, automationName: automation } }, global)
    queue = sessions.dup
    wrapper.core.define_singleton_method(:start_driver) do |**options|
      @http_client = options[:http_client_ops][:http_client]
      @driver = queue.shift || raise('No mock session left')
    end
    wrapper.define_singleton_method(:appium_server_version) { {} }
    wrapper
  end

  def test_global_driver_registration_and_replacement
    first_session = Session.new('first')
    first = build(first_session, global: true)
    first.start_driver
    assert_same first, $driver

    second = build(Session.new('second'), global: true)
    assert_equal 1, first_session.quit_count
    assert_same second, $driver
    second.start_driver
    assert_equal 'second', second.session_id
  end

  def test_global_helpers_and_implicit_promotion_remain_supported
    global = build(Session.new('legacy'), global: true)
    global.start_driver
    target = Class.new
    Appium.promote_appium_methods(target)
    assert_equal 'legacy', target.new.session_id
    assert_equal '50.0 / 375.0', target.new.px_to_window_rel(x: 50).x
    assert_includes target.new.get_android_inspect, 'strings.xml: label'
  end

  def test_quit_error_clears_session_and_strings_cache
    old_session = Session.new('old')
    def old_session.quit
      raise Selenium::WebDriver::Error::WebDriverError, 'Session already gone'
    end
    local = build(old_session, Session.new('replacement'))
    local.start_driver
    assert_equal 'old', local.resolve_id('label')
    assert_nil local.driver_quit
    assert_nil local.driver
    local.start_driver
    assert_equal 'replacement', local.resolve_id('label')
  end

  def test_constructor_hash_option_and_explicit_false_precedence
    opts = { caps: { platformName: 'Android', automationName: 'UiAutomator2' }, global_driver: true }.freeze
    global = Appium::Driver.new(opts)
    assert_same global, $driver
    assert_equal true, opts[:global_driver]

    local = Appium::Driver.new(opts, false)
    refute_same local, $driver
    assert_same global, $driver
  end

  def test_constructor_nil_and_string_key_options
    opts = { caps: { platformName: 'Android', automationName: 'UiAutomator2' }, 'global_driver' => true }
    global = Appium::Driver.new(opts, nil)
    assert_same global, $driver
    assert_equal true, opts['global_driver']
  end

  def test_explicit_true_overrides_hash_false
    opts = { caps: { platformName: 'Android', automationName: 'UiAutomator2' }, global_driver: false }
    global = Appium::Driver.new(opts, true)
    assert_same global, $driver
  end

  def test_explicit_coordinate_driver_is_still_supported
    local = build(Session.new('local', 375))
    other = build(Session.new('other', 1000))
    local.start_driver
    other.start_driver
    assert_equal '50.0 / 1000.0', local.px_to_window_rel({ x: 50 }, other).x
    assert_instance_of OpenStruct, local.px_to_window_rel(x: 50)
  end

  def test_singleton_repromotion_preserves_user_replacement
    a = build(Session.new('first'))
    b = build(Session.new('second'))
    target = Module.new
    Appium.promote_singleton_appium_methods([target], a)
    target.define_singleton_method(:find_element) { |*args| [:custom, args] }
    Appium.promote_singleton_appium_methods([target], b)
    assert_equal [:custom, [:id, 'target']], target.find_element(:id, 'target')
  end

  def test_default_and_explicit_false_leave_global_unset
    opts = { caps: { platformName: 'Android', automationName: 'UiAutomator2' } }
    Appium::Driver.new(opts.dup)
    Appium::Driver.new(opts.dup, false)
    Appium::Driver.new(opts.merge(global_driver: false))
    assert_nil $driver
  end

  def test_two_non_global_sessions_are_isolated
    first = Session.new('first')
    second = Session.new('second')
    a = build(first)
    b = build(second)
    a.start_driver
    b.start_driver
    assert_equal 'first', a.find_element(:id, 'target')
    assert_equal 'second', b.find_element(:id, 'target')
    assert_equal [0, 0], [first.quit_count, second.quit_count]
    assert_nil $driver
  end

  def test_restart_only_closes_own_non_global_session
    first = Session.new('first')
    replacement = Session.new('replacement')
    other = Session.new('other')
    a = build(first, replacement)
    b = build(other)
    a.start_driver
    b.start_driver
    a.restart
    assert_equal [1, 0, 0], [first.quit_count, replacement.quit_count, other.quit_count]
    assert_equal 'replacement', a.session_id
    assert_equal 'other', b.session_id
  end

  def test_quit_is_idempotent_and_does_not_close_other_session
    first = Session.new('first')
    second = Session.new('second')
    a = build(first)
    b = build(second)
    a.start_driver
    b.start_driver
    2.times { a.driver_quit }
    assert_equal [1, 0], [first.quit_count, second.quit_count]
    assert_nil a.driver
    assert_equal 'second', b.session_id
  end

  def test_start_non_global_must_not_close_global_session
    global_session = Session.new('global')
    local_session = Session.new('local')
    g = build(global_session, global: true)
    g.start_driver
    local = build(local_session)
    local.start_driver
    assert_equal 0, global_session.quit_count
    assert_equal 'global', g.session_id
  end

  def test_start_non_global_closes_own_previous_session_even_with_global_reference
    first = Session.new('first')
    replacement = Session.new('replacement')
    local = build(first, replacement)
    local.start_driver
    build(global: true)
    local.start_driver
    assert_equal 1, first.quit_count
    assert_equal 'replacement', local.session_id
  end

  def test_local_coordinates_without_global
    d = build(Session.new('local', 375))
    d.start_driver
    assert_equal '50.0 / 375.0', d.px_to_window_rel(x: 50).x
  end

  def test_local_coordinates_ignore_other_global_driver
    local = build(Session.new('local', 375))
    local.start_driver
    g = build(Session.new('global', 1000), global: true)
    g.start_driver
    assert_equal '50.0 / 375.0', local.px_to_window_rel(x: 50).x
  end

  def test_android_inspect_isolated_from_global_and_other_local_driver
    a = build(Session.new('first'))
    b = build(Session.new('second'))
    a.start_driver
    b.start_driver
    g = build(Session.new('global'), global: true)
    g.start_driver
    assert_includes a.get_android_inspect, 'text: first'
    assert_includes a.get_android_inspect, 'strings.xml: label'
    assert_includes b.get_android_inspect, 'text: second'
    assert_includes b.get_android_inspect, 'strings.xml: label'
  end

  def test_android_inspect_without_any_global_driver
    d = build(Session.new('local'))
    d.start_driver
    assert_includes d.get_android_inspect, 'strings.xml: label'
    assert_nil $driver
  end

  def test_strings_cache_is_isolated_between_instances
    a = build(Session.new('first'))
    b = build(Session.new('second'))
    a.start_driver
    b.start_driver
    assert_equal 'first', a.resolve_id('label')
    assert_equal 'second', b.resolve_id('label')
  end

  def test_restart_invalidates_session_strings_cache
    d = build(Session.new('first'), Session.new('replacement'))
    d.start_driver
    assert_equal 'first', d.resolve_id('label')
    d.restart
    assert_equal 'replacement', d.resolve_id('label')
  end

  def test_inspection_before_start_does_not_poison_strings_cache
    d = build(Session.new('started'))
    assert_empty d.lazy_load_strings
    assert_empty d.xml_keys('label')
    assert_empty d.xml_values('started')
    assert_nil d.resolve_id('label')
    d.start_driver
    assert_equal 'started', d.resolve_id('label')
  end

  def test_common_delegation_without_global
    s = Session.new('local')
    d = build(s)
    d.start_driver
    assert_equal 'local', d.xpath('//button')
    assert_equal({ 'setting' => true }, d.update_settings({ 'setting' => true }))
    assert_equal ['mobile: shell', { command: 'echo', args: ['hello'] }], d.shell('echo', ['hello'])
  end

  def test_ios_gesture_without_global
    d = build(Session.new('ios'), platform: 'iOS', automation: 'XCUITest')
    d.start_driver
    assert_equal ['mobile: swipe', { direction: 'down' }], d.swipe(direction: 'down')
    assert_nil $driver
  end

  def test_espresso_helpers_without_global
    s = Session.new('espresso')
    d = build(s, automation: 'Espresso')
    d.start_driver
    assert_equal 'espresso', d.find('target')
    assert_equal :xpath, s.calls.last[1].first
  end

  def test_explicit_promotion_without_global
    d = build(Session.new('local'))
    d.start_driver
    target = Class.new
    Appium.promote_appium_methods(target, d)
    assert_equal 'local', target.new.session_id
    assert_nil $driver
  end

  def test_class_promotion_retains_shared_class_semantics
    a = build(Session.new('first'))
    b = build(Session.new('second'))
    a.start_driver
    b.start_driver
    target = Class.new
    Appium.promote_appium_methods(target, a)
    first_page = target.new
    assert_equal 'first', first_page.session_id
    Appium.promote_appium_methods(target, b)
    assert_equal 'second', first_page.session_id
  end

  def test_singleton_promotion_can_switch_driver
    a = build(Session.new('first'))
    b = build(Session.new('second'))
    a.start_driver
    b.start_driver
    target = Module.new
    Appium.promote_singleton_appium_methods([target], a)
    assert_equal 'first', target.session_id
    Appium.promote_singleton_appium_methods([target], b)
    assert_equal 'second', target.session_id
  end

  def test_singleton_promotion_preserves_inherited_keyword_method
    driver = Object.new
    driver.define_singleton_method(:command) { |**kwargs| [:driver, kwargs] }
    inherited = Module.new do
      def command(**kwargs) = [:inherited, kwargs]
    end
    target = Module.new { extend inherited }
    Appium.promote_singleton_appium_methods([target], driver)
    assert_equal [:inherited, { value: 1 }], target.command(value: 1)
  end

  def test_singleton_repromotion_updates_variadic_methods
    first = Session.new('first')
    second = Session.new('second')
    a = build(first)
    b = build(second)
    a.start_driver
    b.start_driver
    target = Module.new
    Appium.promote_singleton_appium_methods([target], a)
    Appium.promote_singleton_appium_methods([target], b)
    target.find_element(:id, 'target')
    assert_empty first.calls
    assert_equal [[:find_element, [:id, 'target']]], second.calls
  end

  def test_promoted_keyword_method_accepts_previous_hash_call_style
    d = build(Session.new('ios'), platform: 'iOS', automation: 'XCUITest')
    d.start_driver
    target = Class.new
    Appium.promote_appium_methods(target, d)
    assert_equal ['mobile: swipe', { direction: 'down' }], target.new.swipe({ direction: 'down' })
  end
end
