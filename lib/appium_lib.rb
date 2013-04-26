# encoding: utf-8

$last_driver = nil

# Invoke top level methods on last created Appium driver.
def self.method_missing method, *args, &block
  raise "driver is nil. called #{method}" if $last_driver == nil

  $last_driver.respond_to?(method) ?
    $last_driver.send( method, *args, &block ) :
    super
end

module Appium
  def self.add_to_path file, path=false
   path = path ? "../#{path}/" : '..'
   path = File.expand_path path, file

   $:.unshift path unless $:.include? path
  end

  add_to_path __FILE__

  require 'appium_lib/driver'
end
