require 'rubygems'
require 'rake'
require 'date'

# Defines gem name.
def repo_name; 'appium_lib'; end # ruby_lib published as appium_lib
def version_file; "lib/#{repo_name}/version.rb"; end
def version_rgx; /VERSION = '([^']+)'/m; end

def version
  @version = @version || File.read(version_file).match(version_rgx)[1]
end

def bump
  data = File.read version_file

  v_line = data.match version_rgx
  d_line = data.match /DATE = '([^']+)'/m

  old_v = v_line[0]
  old_d = d_line[0]

  old_num = v_line[1]
  new_num = old_num.split('.')
  new_num[-1] = new_num[-1].to_i + 1
  new_num = new_num.join '.'

  new_v = old_v.sub old_num, new_num
  puts "#{old_num} -> #{new_num}"

  old_date = d_line[1]
  new_date = Date.today.to_s
  new_d = old_d.sub old_date, new_date
  puts "#{old_date} -> #{new_date}" unless old_date == new_date

  data.sub! old_v, new_v
  data.sub! old_d, new_d

  File.write version_file, data
end

desc 'Bump the version number and update the date.'
task :bump do
  bump
end

# Inspired by Gollum's Rakefile
desc 'Build and release a new gem to rubygems.org'
task :release => :gem do
  unless `git branch`.include? '* master'
    puts 'Master branch required to release.'
    exit!
  end

  # Commit then pull before pushing.
  sh "git commit --allow-empty -am 'Release #{version}'"
  sh 'git pull'
  sh "git tag v#{version}"
  sh 'git push origin master'
  sh "git push origin v#{version}"
  sh "gem push #{repo_name}-#{version}.gem"
end

desc 'Build and release a new gem to rubygems.org (same as release)'
task :publish => :release do
end

desc 'Build a new gem'
task :gem do
  `chmod 0600 ~/.gem/credentials`
  sh "gem build #{repo_name}.gemspec"
end

desc 'Build a new gem (same as gem task)'
task :build => :gem do
end

desc 'Install gem'
task :install => :gem do
 `gem uninstall -aIx #{repo_name}`
 sh "gem install --no-rdoc --no-ri #{repo_name}-#{version}.gem"
end
