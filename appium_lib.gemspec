require_relative 'lib/appium_lib/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 3.0'

  s.name          = 'appium_lib'
  s.version       = Appium::VERSION
  s.license       = 'Apache-2.0'
  s.description   = 'Ruby library for Appium.'
  s.summary       = 'Ruby library for Appium'
  s.authors       = ['code@bootstraponline.com', 'Kazuaki Matsuo']
  s.email         = %w(code@bootstraponline.com fly.49.89.over@gmail.com)
  s.homepage      = 'https://github.com/appium/ruby_lib' # published as appium_lib
  s.require_paths = ['lib']

  s.add_runtime_dependency 'appium_lib_core', '~> 9.0.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
  s.add_runtime_dependency 'tomlrb', '>= 1.1', '< 3.0'

  s.add_development_dependency 'appium_thor', '~> 2.0'
  s.add_development_dependency 'fakefs', '~> 2.5.0'
  s.add_development_dependency 'hashdiff', '~> 1.1.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'minitest-reporters', '~> 1.1'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rubocop', '1.63.3'
  s.add_development_dependency 'yard', '~> 0.9.11'

  s.files = `git ls-files`.split("\n").reject { |v| v.match(/\A^(ios_tests|android_tests|grid|test_apps)\/.+/) }
  s.metadata['rubygems_mfa_required'] = 'true'
end
