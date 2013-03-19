# encoding: utf-8

def self.add_to_path path
 path = File.expand_path "../#{path}/", __FILE__

 $:.unshift path unless $:.include? path
end

add_to_path 'lib'

require 'app_lib/version'

Gem::Specification.new do |s|
  # 1.8.x is not supported
  s.required_ruby_version = '>= 1.9.3'

  s.name = 'app_lib'
  s.version = AppLib::VERSION
  s.date = AppLib::DATE
  s.license = 'http://www.apache.org/licenses/LICENSE-2.0.txt'
  s.description = s.summary = 'Ruby lib for use with Appium'
  s.description += '.' # avoid identical warning
  s.authors = s.email = [ 'code@bootstraponline.com' ]
  s.homepage = 'https://github.com/bootstraponline/app_lib'
  s.require_paths = [ 'lib' ]

  s.add_dependency 'selenium-webdriver', '~> 2.31.0'
  s.add_dependency 'awesome_print', '~> 1.1.0'

  s.add_development_dependency 'rake', '~> 10.0.3'

  s.files = `git ls-files`.split "\n"
end