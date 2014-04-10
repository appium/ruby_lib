# encoding: utf-8
require 'rubygems'
require 'rake'

# Run sh and ignore exception
def run_sh cmd
  begin; sh cmd; rescue; end
end

# Run cmd. On failure run install and try again.
def bash cmd
  sh cmd do |successful, result|
    # exitstatus 7 means bundle install failed
    # exitstatus 1 means the test failed
    if !successful && result.exitstatus === 7
      Rake::Task['install'].execute
      run_sh cmd
    end
  end
end

# rake android['single_text_name']
# rake android
def run_android test_file=nil
  path = File.expand_path('appium.txt', Rake.application.original_dir)
  ENV['APPIUM_TXT'] = path
  puts "Rake appium.txt path is: #{path}"
  cmd = 'bundle exec ruby ./lib/run.rb android'
  cmd += %Q( "#{test_file}") if test_file
  bash cmd
end

# Run a single test with:
# rake android['android/element/generic']
#
# Run all tests with:
# rake android
desc 'Run the Android tests'
task :android, :args, :test_file do |args, test_file|
  Rake::Task[:adb_uninstall].execute
  run_android test_file[:args]
end

desc 'Run the Android tests without uninstalling'
task :droid, :args, :test_file do |args, test_file|
  run_android test_file[:args]
end

desc 'Run bundle install'
task :install do
  sh 'bundle install'
end

desc 'ADB uninstall apk'
task :adb_uninstall do
  # uninstall old api
  cmd = 'adb uninstall com.example.android.apis'
  run_sh cmd
end