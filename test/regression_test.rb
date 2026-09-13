# frozen_string_literal: true

require 'minitest/autorun'
require 'appium_lib'
require 'tmpdir'

class RegressionTest < Minitest::Test
  def test_expand_single_required_file
    Dir.mktmpdir do |dir|
      path = File.join(dir, 'helper.rb')
      File.write(path, '')

      assert_equal [path], Appium.expand_required_files(dir, 'helper.rb')
    end
  end

  def test_expand_required_directory_and_skip_missing_files
    Dir.mktmpdir do |dir|
      nested = File.join(dir, 'helpers')
      Dir.mkdir(nested)
      path = File.join(nested, 'helper.rb')
      File.write(path, '')
      File.write(File.join(nested, 'notes.txt'), '')

      assert_equal [path], Appium.expand_required_files(dir, %w(helpers missing.rb))
      assert_empty Appium.expand_required_files(dir, 'missing.rb')
    end
  end

  def test_promote_preserves_inherited_method
    parent = Class.new do
      def back
        :inherited
      end
    end
    child = Class.new(parent)
    driver = Object.new
    def driver.back
      :driver
    end

    Appium.promote_appium_methods(child, driver)

    assert_equal :inherited, child.new.back
  end

  def test_promote_again_uses_new_driver
    target = Class.new
    first = Object.new
    def first.back
      :first
    end
    second = Object.new
    def second.back
      :second
    end

    Appium.promote_appium_methods(target, first)
    assert_equal :first, target.new.back
    Appium.promote_appium_methods(target, second)
    assert_equal :second, target.new.back
  end

  def test_singleton_promotion_forwards_keywords_and_block
    driver = Object.new
    def driver.log_event(vendor:, event:)
      yield [vendor, event]
    end
    target = Module.new
    Appium.promote_singleton_appium_methods([target], driver)

    result = target.log_event(vendor: 'test', event: 'event') { |values| values.join(':') }

    assert_equal 'test:event', result
  end

  def test_singleton_promotion_preserves_positional_hash
    driver = Object.new
    def driver.command(options)
      options
    end
    target = Module.new
    Appium.promote_singleton_appium_methods([target], driver)

    assert_equal({ value: 1 }, target.command({ value: 1 }))
  end

  class RecordingCore
    attr_reader :http_client

    def automation_name
      :uiautomator2
    end

    def start_driver(http_client_ops:, **)
      @http_client = http_client_ops[:http_client]
      nil
    end

    def appium_server_version
      {}
    end
  end

  def test_start_driver_passes_custom_http_client
    client = Object.new
    driver = build_driver

    driver.start_driver(http_client: client)

    assert_same client, driver.http_client
  end

  def test_start_driver_builds_default_http_client
    driver = build_driver

    driver.start_driver

    assert_instance_of Appium::Http::Default, driver.http_client
  end

  private

  def build_driver
    driver = Appium::Driver.allocate
    driver.instance_variable_set(:@core, RecordingCore.new)
    def driver.server_url
      'http://127.0.0.1:4723'
    end
    driver
  end
end
