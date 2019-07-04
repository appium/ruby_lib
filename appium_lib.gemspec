require_relative 'lib/appium_lib/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.2' # rubocop:disable Gemspec/RequiredRubyVersion

  s.name          = 'appium_lib'
  s.version       = Appium::VERSION
  s.date          = Appium::DATE
  s.license       = 'Apache-2.0'
  s.description   = 'Ruby library for Appium.'
  s.summary       = 'Ruby library for Appium'
  s.authors       = ['code@bootstraponline.com', 'Kazuaki Matsuo']
  s.email         = %w(code@bootstraponline.com fly.49.89.over@gmail.com)
  s.homepage      = 'https://github.com/appium/ruby_lib' # published as appium_lib
  s.require_paths = ['lib']

  s.add_runtime_dependency 'appium_lib_core', '~> 3.2'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency 'tomlrb', '~> 1.1'

  s.add_development_dependency 'appium_thor', '~> 1.1', '>= 1.1.4'
  s.add_development_dependency 'fakefs', '~> 0.13.0'
  s.add_development_dependency 'hashdiff', '~> 0.3.7'
  s.add_development_dependency 'posix-spawn', '~> 0.3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rubocop', '~> 0.61.0'
  s.add_development_dependency 'spec', '~> 5.3', '>= 5.3.4'
  s.add_development_dependency 'yard', '~> 0.9.11'

  s.files = `git ls-files`.split("\n").reject { |v| v.match(/\A^(ios_tests|android_tests|grid|test_apps)\/.+/) }
end
