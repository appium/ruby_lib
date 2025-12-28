require_relative 'lib/appium_lib/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 3.1'

  s.name          = 'appium_lib'
  s.version       = Appium::VERSION
  s.license       = 'Apache-2.0'
  s.description   = 'Ruby library for Appium.'
  s.summary       = 'Ruby library for Appium'
  s.authors       = ['code@bootstraponline.com', 'Kazuaki Matsuo']
  s.email         = %w(code@bootstraponline.com fly.49.89.over@gmail.com)
  s.homepage      = 'https://github.com/appium/ruby_lib' # published as appium_lib
  s.require_paths = ['lib']

  # TODO: We must remove start_logs_broadcast/stop_logs_broadcast to bump the appium_lib_core version to v12+.
  s.add_dependency 'appium_lib_core', '>= 9.2.1', '< 12.0'
  s.add_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
  s.add_dependency 'tomlrb', '>= 1.1', '< 3.0'

  s.files = `git ls-files`.split("\n").reject { |v| v.match(/\A^(ios_tests|android_tests|grid|test_apps)\/.+/) }
  s.metadata['rubygems_mfa_required'] = 'true'
end
