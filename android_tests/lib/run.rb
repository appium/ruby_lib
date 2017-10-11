require 'rubygems'
require 'spec'
require 'fakefs/safe'
require 'hashdiff'
require_relative '../../lib/appium_lib'

# Run all Android tests:
#   ruby run.rb android

# Run only the view album test:
#   ruby run.rb ios view_album

def start_driver(caps)
  driver = Appium::Driver.new(caps, true)
  # Tests expect methods defined on the minispec object
  Appium.promote_appium_methods ::Minitest::Spec, driver
  driver.start_driver
end

# Sanity check
a = OpenStruct.new x: 'ok'
raise 'x issue' unless a.x == 'ok'

dir  = File.expand_path(File.join(Dir.pwd, 'lib'))
appium_txt = File.join(Dir.pwd, 'appium.txt')
device  = ARGV[0].downcase.strip
devices = %w(android selendroid ios)
raise 'Expected android, selendroid or ios as first argument' unless devices.include? device

one_test = ARGV[1]
test_dir = "/#{device}/"

caps       = Appium.load_settings file: appium_txt, verbose: true
caps = if caps[:appium_lib]
         appium_lib = caps[:appium_lib]
         appium_lib = appium_lib.merge(debug: true) unless appium_lib[:debug]
         appium_lib = appium_lib.merge(wait: 1) unless appium_lib[:wait]
         caps.merge(appium_lib: appium_lib)
       else
         caps.merge(appium_lib: { debug: true, wait: 1 })
       end
caps[:app] = ENV['SAUCE_PATH'] if ENV['SAUCE_USERNAME'] && ENV['SAUCE_ACCESS_KEY']

trace_files = []

if one_test
  if File.exist? one_test
    one_test = File.expand_path one_test
  else
    # ensure ext is .rb
    one_test = File.join(File.dirname(one_test),
                         File.basename(one_test, '.*') + '.rb')
    one_test = File.join(dir, test_dir + 'specs/', one_test)
  end

  raise "\nTest #{one_test} does not exist.\n" unless File.exist?(one_test)
  start_driver(caps)

  # require support (common.rb)
  file_name = File.join dir, test_dir + '/*.rb'
  Dir.glob(file_name) do |test|
    require test
    trace_files << test
  end
  puts "Loading one test: #{one_test}"
  require one_test
  trace_files << one_test
else
  # require all
  file_names = File.join(dir, test_dir + '**/*.rb')
  Dir.glob(file_names) do |test|
    # load all tests
    trace_files << test
    puts "  #{File.basename(test, '.*')}"
    require test
  end

  start_driver(caps)
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
Minitest.run_specs(trace: trace_files)
