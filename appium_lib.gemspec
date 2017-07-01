require_relative 'lib/appium_lib/common/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.2'

  s.name          = 'appium_lib'
  s.version       = Appium::VERSION
  s.date          = Appium::DATE
  s.license       = 'Apache-2.0'
  s.description   = s.summary = 'Ruby library for Appium'
  s.description   += '.' # avoid identical warning
  s.authors       = s.email = ['code@bootstraponline.com']
  s.homepage      = 'https://github.com/appium/ruby_lib' # published as appium_lib
  s.require_paths = ['lib']

  s.add_runtime_dependency 'selenium-webdriver', '>= 3.0.4', '<= 3.4'
  s.add_runtime_dependency 'awesome_print', '~> 1.7'
  s.add_runtime_dependency 'json', '>= 1.8'
  s.add_runtime_dependency 'tomlrb', '~> 1.1'
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.6'

  s.add_development_dependency 'posix-spawn', '~> 0.3'
  s.add_development_dependency 'hashdiff', '~> 0.2.2'
  s.add_development_dependency 'spec', '~> 5.3', '>= 5.3.4'
  s.add_development_dependency 'fakefs', '~> 0.6.7'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'yard', '~> 0.8'

  s.add_development_dependency 'rubocop', '~> 0.46.0'
  s.add_development_dependency 'rainbow', '~> 2.1.0'
  s.add_development_dependency 'pry'

  s.files = `git ls-files`.split("\n").select { |v| !v.match /\A^(ios_tests|android_tests|grid)\/.+/ }
end
