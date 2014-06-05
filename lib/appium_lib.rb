# Enforce UTF-8 Encoding
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'forwardable' unless defined? Forwardable
require_relative 'appium_lib/rails/duplicable'

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

require_relative 'appium_lib/logger'
require_relative 'appium_lib/driver'
