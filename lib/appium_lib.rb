# Enforce UTF-8 Encoding
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

require 'forwardable' unless defined? Forwardable

# Init global driver
$driver = nil

require_relative 'appium_lib/appium'
