# frozen_string_literal: true

require_relative 'lib/appium_lib/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 3.1'

  s.name          = 'appium_lib'
  s.version       = Appium::VERSION
  s.license       = 'Apache-2.0'
  s.description   = 'Helper methods for writing cross-platform Android and iOS tests in Ruby using Appium. ' \
                    'Extends appium_lib_core with convenient methods for finding elements and interacting with devices.'
  s.summary       = 'Ruby library for Appium'
  s.authors       = ['code@bootstraponline.com', 'Kazuaki Matsuo']
  s.email         = %w(code@bootstraponline.com fly.49.89.over@gmail.com)
  s.homepage      = 'https://github.com/appium/ruby_lib' # published as appium_lib
  s.require_paths = ['lib']

  s.add_dependency 'appium_lib_core', '>= 13.0.0', '< 14.0'
  s.add_dependency 'nokogiri', '~> 1.8', '>= 1.8.1'
  s.add_dependency 'tomlrb', '>= 1.1', '< 3.0'

  s.files = Dir.glob('lib/**/*.rb', base: __dir__) + %w[appium_lib.gemspec readme.md LICENSE-2.0.txt CHANGELOG.md]
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['changelog_uri'] = "#{s.homepage}/blob/master/CHANGELOG.md"
  s.metadata['bug_tracker_uri'] = "#{s.homepage}/issues"
  s.metadata['rubygems_mfa_required'] = 'true'
end
