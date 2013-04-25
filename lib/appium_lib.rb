# encoding: utf-8

$last_driver = nil

# Invoke top level methods on last created Appium driver.
def self.method_missing method, *args, &block
  raise "driver is nil. called #{method}" if $last_driver == nil

  has_args = ! args.empty?
  has_block = ! block.nil?

  # method with no params
  if ! has_args && ! has_block
    $last_driver.send method
  # method with only arg params
  elsif has_args && ! has_block
    $last_driver.send method, *args
  # method with only block param
  elsif ! has_args && has_block
    $last_driver.send method, block
  # method with arg + block
  elsif has_args && has_block
    $last_driver.send method, *args, block
  end
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
