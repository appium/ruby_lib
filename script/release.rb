# frozen_string_literal: true

require 'date'
require 'json'
require 'rubygems/package'

# Deterministic release checks shared by release PRs and the publishing workflow.
# This script never commits, tags, or publishes anything.
module ReleaseTools
  VERSION_FILE = 'lib/appium_lib/version.rb'
  TAG_PATTERN = /\Av\d+\.\d+\.\d+(?:-[0-9A-Za-z]+(?:[.-][0-9A-Za-z]+)*)?\z/

  module_function

  def metadata(root)
    source = File.read(File.join(root, VERSION_FILE))
    version = source.match(/VERSION\s*=\s*'([^']+)'/)&.[](1)
    date = source.match(/DATE\s*=\s*'([^']+)'/)&.[](1)
    raise 'Missing VERSION or DATE' unless version && date

    manifest = JSON.parse(File.read(File.join(root, '.release-please-manifest.json'))).fetch('.')
    raise 'Manifest and VERSION differ' unless manifest == version

    # Accept both historical headers and Release Please's linked headers.
    header = File.read(File.join(root, 'CHANGELOG.md')).lines.find { |line| line.start_with?('## ') }
    match = header&.match(/^## \[([^\]]+)\](?:\([^)]*\))? (?:- |\()(\d{4}-\d{2}-\d{2})\)?\s*$/)
    raise 'Latest changelog entry does not match VERSION' unless match && match[1] == version

    release_date = match[2]
    Date.iso8601(release_date)
    [version, date, release_date]
  end

  def prepare_date(root)
    _version, current_date, release_date = metadata(root)
    return if current_date == release_date

    path = File.join(root, VERSION_FILE)
    source = File.read(path)
    File.write(path, source.sub(/(DATE\s*=\s*)'[^']+'/, "\\1'#{release_date}'"))
  end

  def verify(root, tag = nil)
    version, date, release_date = metadata(root)
    raise 'DATE does not match the changelog; run prepare-date' unless date == release_date

    if tag
      raise 'Invalid release tag' unless TAG_PATTERN.match?(tag)
      raise 'Tag and VERSION differ' unless tag == "v#{version}"
    end

    gem_version = Gem::Version.new(version)
    gem_path = "pkg/appium_lib-#{gem_version}.gem"
    package = Gem::Package.new(File.join(root, gem_path))
    package.verify
    spec = package.spec
    raise 'Gem name or version differs from release metadata' unless spec.name == 'appium_lib' && spec.version == gem_version

    packaged_source = package.contents.include?(VERSION_FILE)
    raise 'Gem is missing version.rb' unless packaged_source

    gem_path
  end
end

if $PROGRAM_NAME == __FILE__
  root = File.expand_path('..', __dir__)
  case ARGV.shift
  when 'prepare-date'
    ReleaseTools.prepare_date(root)
  when 'verify'
    puts "gem_path=#{ReleaseTools.verify(root, ARGV.shift)}"
  else
    abort 'Usage: ruby script/release.rb prepare-date|verify [tag]'
  end
end
