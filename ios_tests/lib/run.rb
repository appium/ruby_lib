# encoding: utf-8
require 'rubygems'
require 'test_runner'
require 'spec'
=begin
node server.js -V --fast-reset --without-delay

Run all Android tests:
  ruby run.rb android

Run only the view album test:
  ruby run.rb ios view_album
=end

# Sanity check
a = OpenStruct.new x: 'ok'
raise 'x issue' unless a.x == 'ok'

## common methods

# ios 7 makes clicking the back button fun.
def back_button
  result = nil
  names('back').each do |b|
    if b.displayed?
      result = b
      break
    end
  end
  result
end

def back_displayed
  b = back_button
  b ? b.displayed? : false
end

def back_click(opts={})
  opts ||= {}
  search_wait = opts.fetch(:wait, 60 * 1.7)
  # iOS may have multiple 'back' buttons
  # select the first displayed? back button.
  wait(search_wait) do
    back_button.click
  end
end

def leave_textfields
  back_click
  screen.must_equal catalog
end

def go_to_textfields
  screen.must_equal catalog
  wait_true { s_text('textfield').click; screen == 'TextFields' } # wait for screen transition
  screen.must_equal 'TextFields'
end

def screen
  $driver.find_element(:tag_name, 'navigationBar').name
end

def catalog
  'UICatalog'
end
##

caps = Appium.load_appium_txt file: File.expand_path('..',__FILE__), verbose: true
caps = caps.merge({ appium_lib: { debug: true, wait: 30 } })

dir = File.expand_path '..', __FILE__
device = ARGV[0].downcase.strip
devices = %w[ android selendroid ios ]
raise 'Expected android, selendroid or ios as first argument' unless devices.include? device

one_test = ARGV[1]
test_dir = "/#{device}/"

caps[:app] = ENV['SAUCE_PATH'] if ENV['SAUCE_USERNAME'] && ENV['SAUCE_ACCESS_KEY']

Appium::Driver.new(caps).start_driver

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