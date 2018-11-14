require 'bundler/gem_tasks'
require 'rubocop/rake_task'

desc 'Execute RuboCop static code analysis'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.patterns = %w(lib ios_tests android_tests)
  t.options = %w(-D)
  t.fail_on_error = true
end
