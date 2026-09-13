# frozen_string_literal: true

require 'fileutils'
require 'minitest/autorun'
require 'tmpdir'
require_relative '../../script/release'

class ReleaseTest < Minitest::Test
  def setup
    @root = Dir.mktmpdir('appium-release-test')
    write_metadata
  end

  def teardown
    FileUtils.remove_entry(@root)
  end

  def test_existing_changelog_format
    build_gem
    assert_equal 'pkg/appium_lib-13.1.1.gem', ReleaseTools.verify(@root, 'v13.1.1')
  end

  def test_release_please_date_update_is_idempotent
    write_metadata(date: '2026-07-13', linked: true)
    ReleaseTools.prepare_date(@root)
    path = File.join(@root, ReleaseTools::VERSION_FILE)
    updated = File.read(path)
    assert_includes updated, "DATE = '2026-09-12'"
    assert_includes updated, "VERSION = '13.1.1'"
    ReleaseTools.prepare_date(@root)
    assert_equal updated, File.read(path)
    build_gem
    assert_equal 'pkg/appium_lib-13.1.1.gem', ReleaseTools.verify(@root)
  end

  def test_manifest_mismatch
    File.write(File.join(@root, '.release-please-manifest.json'), JSON.generate('.' => '16.3.0'))
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  def test_changelog_mismatch
    File.write(File.join(@root, 'CHANGELOG.md'), "## [16.3.0] - 2026-09-12\n")
    assert_raises(RuntimeError) { ReleaseTools.prepare_date(@root) }
  end

  def test_missing_changelog_entry
    File.write(File.join(@root, 'CHANGELOG.md'), '# Changelog')
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  def test_invalid_calendar_date
    write_metadata(release_date: '2026-02-30')
    assert_raises(Date::Error) { ReleaseTools.prepare_date(@root) }
  end

  def test_stale_date_blocks_publication
    write_metadata(date: '2026-07-13')
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  def test_wrong_or_malformed_tag
    ['v13.1.2', '13.1.1', 'master', 'v13.1.1/other', "v13.1.1\n", 'v13.1.1;command'].each do |tag|
      assert_raises(RuntimeError, tag.inspect) { ReleaseTools.verify(@root, tag) }
    end
  end

  def test_prerelease_uses_rubygems_normalized_filename
    write_metadata(version: '13.2.0-rc.1', linked: true)
    build_gem(version: '13.2.0-rc.1')
    assert_equal 'pkg/appium_lib-13.2.0.pre.rc.1.gem', ReleaseTools.verify(@root, 'v13.2.0-rc.1')
  end

  def test_wrong_gem_identity
    path = build_gem(name: 'different-gem')
    FileUtils.mv(path, File.join(@root, 'pkg/appium_lib-13.1.1.gem'))
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  def test_wrong_packaged_version
    path = build_gem(version: '16.3.0')
    FileUtils.mv(path, File.join(@root, 'pkg/appium_lib-13.1.1.gem'))
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  def test_missing_packaged_version_file
    build_gem(include_version: false)
    assert_raises(RuntimeError) { ReleaseTools.verify(@root) }
  end

  private

  def write_metadata(version: '13.1.1', date: '2026-09-12', release_date: '2026-09-12', linked: false)
    path = File.join(@root, ReleaseTools::VERSION_FILE)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, "VERSION = '#{version}'\nDATE = '#{date}'\n")
    File.write(File.join(@root, '.release-please-manifest.json'), JSON.generate('.' => version))
    header = linked ? "## [#{version}](https://example.com/compare) (#{release_date})" : "## [#{version}] - #{release_date}"
    File.write(File.join(@root, 'CHANGELOG.md'), "# Changelog\n\n#{header}\n\n- A change\n")
  end

  def build_gem(name: 'appium_lib', version: '13.1.1', include_version: true)
    spec = Gem::Specification.new do |gem|
      gem.name = name
      gem.version = version
      gem.summary = 'Release validation fixture'
      gem.authors = ['Test']
      gem.files = include_version ? [ReleaseTools::VERSION_FILE] : []
      gem.license = 'Apache-2.0'
      gem.homepage = 'https://example.com'
    end
    output = File.join(@root, "pkg/#{spec.file_name}")
    FileUtils.mkdir_p(File.dirname(output))
    capture_io { Dir.chdir(@root) { Gem::Package.build(spec, true, false, output) } }
    output
  end
end
