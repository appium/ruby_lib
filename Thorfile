require 'appium_thor'

Appium::Thor::Config.set do
  gem_name     'appium_lib'
  github_name  'ruby_lib'
  version_file 'lib/appium_lib/version.rb'
  docs_block do
    common_globs  = %w(/lib/appium_lib/*.rb /lib/appium_lib/device/*.rb /lib/appium_lib/common/**/*.rb)
    android_globs = common_globs + %w(/lib/appium_lib/android/**/*.rb)
    ios_globs     = common_globs + %w(/lib/appium_lib/ios/**/*.rb)

    run 'docs/android_docs.md', globs(android_globs)
    run 'docs/ios_docs.md', globs(ios_globs)
  end
end
