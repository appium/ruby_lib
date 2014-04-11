# encoding: utf-8
require 'rubygems'
require 'test_runner'
require 'spec'
require 'fakefs/safe'
=begin
node server.js -V --fast-reset --without-delay

Run all Android tests:
  ruby run.rb android

Run only the view album test:
  ruby run.rb android view_album
=end

# Sanity check
a = OpenStruct.new x: 'ok'
raise 'x issue' unless a.x == 'ok'

load_appium_txt file: ENV['APPIUM_TXT'], verbose: true

dir = File.expand_path '..', __FILE__
device = ARGV[0].downcase.strip
devices = %w[ android selendroid ios ]
raise 'Expected android, selendroid or ios as first argument' unless devices.include? device

one_test = ARGV[1]
test_dir = "/#{device}/"

puts 'Start driver'
use_selendroid = device == 'selendroid'
puts "Use selendroid? #{use_selendroid}"

ENV['APP_PATH'] = ENV['SAUCE_PATH'] if ENV['SAUCE_USERNAME'] && ENV['SAUCE_ACCESS_KEY']

Appium::Driver.new(fast_clear: true, debug: true, wait: 1).start_driver

=begin
# Android doesn't like to be reset before booting up
case device
  when 'android'
    button 'start button'
    mobile :reset
end
=end

trace_files = []

if one_test
  # ensure ext is .rb
  one_test = File.join(File.dirname(one_test),
                       File.basename(one_test, '.*') + '.rb')
  one_test = File.join(dir, test_dir + 'specs/', one_test)
  one_test = File.expand_path one_test
  raise "\nTest #{one_test} does not exist.\n" unless File.exists?(one_test)
  # require support (common.rb)
  Dir.glob(File.join dir, test_dir + '/*.rb') do |test|
    require test
    trace_files << test
  end
  puts "Loading one test: #{one_test}"
  require one_test
  trace_files << one_test
else
  # require all
  Dir.glob(File.join dir, test_dir + '**/*.rb') do |test|
    # load all tests
    trace_files << test
    puts "  #{File.basename(test, '.*')}"
    require test
  end
end

trace_files.map! do |f|
  f = File.expand_path f
  # ensure all traced files end in .rb
  f = File.join(File.dirname(f), File.basename(f, '.*') + '.rb')
  f
end

# Exit after tests.
Minitest.after_run { $driver.x if $driver }
# Run Minitest. Provide test file array for tracing.
Minitest.run_specs({ :trace => trace_files })