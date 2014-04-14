# encoding: utf-8

$driver = nil

# @private
# Invoke top level methods on last created Appium driver.
def self.method_missing method, *args, &block
  raise "driver is nil. called #{method}" if $driver == nil

  if $driver.respond_to?(method)
    # puts "[method_missing] Calling driver.send for #{method}"
    $driver.send(method, *args, &block)
  elsif self.respond_to?(method)
    # puts "[method_missing] Calling super with args for #{method}"
    super(*args, &block)
  else
    # puts "[method_missing] Calling super (no args) for #{method}"
    super
  end
end

module Appium
  # @private
  def self.add_to_path file, path=false
    path = path ? "../#{path}/" : '..'
    path = File.expand_path path, file

    $:.unshift path unless $:.include? path
  end

  add_to_path __FILE__

  require_relative 'appium_lib/logger'
  require_relative 'appium_lib/driver'
end