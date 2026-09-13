# Releasing appium_lib

Release Please prepares the release PR, version, changelog, tag, and GitHub Release.
GitHub Actions builds and tests the tagged code, then publishes that exact gem to
RubyGems.org using Trusted Publishing. `appium_thor` is no longer required.

After the one-time setup, the maintainer's normal release action is to review and
merge the release PR. There is no local version bump, tag push, or gem push.

## One-time setup

1. In repository **Settings → Actions → General → Workflow permissions**, enable
   **Allow GitHub Actions to create and approve pull requests** (the organization
   policy must permit it). Workflows declare their own permissions. Release Please
   uses the built-in `GITHUB_TOKEN`; no GitHub App, PAT, or new GitHub secret is needed.
2. Keep the normal branch protection/rulesets on `master`. Require the existing
   unit/lint checks and the `package` job from **Release validation** before merging
   a release PR. Do not exempt the release bot from those merge checks. Its direct
   writes are to the generated release PR branch and release tags, not master.
3. Create the GitHub Actions environment `rubygems`. Permit release tags (`v*`) and
   the `master` branch (for automated publishing and retries). Add a required reviewer only if a
   separate approval for each publication is wanted; otherwise merging the release
   PR is the normal human decision.
4. As an owner of `appium_lib` on RubyGems.org, configure a Trusted Publisher:
   - Repository owner: `appium`
   - Repository name: `ruby_lib`
   - Workflow filename: `publish-gem.yml`
   - Environment: `rubygems`
5. Merge the migration after its CI passes. A push to master or a manual run of
   **Release Please** updates the pending release PR. Configure the RubyGems
   publisher before merging that first release PR.

This follows the standard `GITHUB_TOKEN` and OIDC authentication used by Appium's
Python client and XCUITest driver release workflows. Release Please explicitly
uses `workflow_dispatch` to run the existing lint/unit and package
workflows on the release PR branch, and **Publish gem** on master with the new tag.
These events run with `GITHUB_TOKEN` without a separate bot credential. All workflow
files must first be on master for dispatch to work.

GitHub may also show approval-required `pull_request` runs for bot-created PRs.
The dispatched checks do not require that approval. The shared PR-title workflow
is event-only; if repository rules require its check, that run still needs approval
(or a separate adaptation of the shared workflow). Do not make an approval-only
check required if the intended release process is review and merge only.

No credentials, remote settings, tags, or releases are created by installing these
files. Configure the RubyGems publisher before merging the first release PR.

## Normal release

1. Merge ordinary changes using Conventional Commit titles/messages. A `fix:`
   produces a patch bump, `feat:` a minor bump, and a breaking-change marker such as
   `feat!:` a major bump. Chore-only changes do not normally create a release PR.
2. Release Please maintains a PR updating `lib/appium_lib/version.rb`,
   `.release-please-manifest.json`, and `CHANGELOG.md`. Its standard `x-release-please-date` annotation also updates
   `Appium::DATE` in the same PR. Wait for checks on the final PR commit.
3. Review the version and release notes, then merge the PR when ready. If master
   has advanced, require current checks before merging through the repository rules.
4. Release Please creates `v<version>` and a GitHub Release, then dispatches
   **Publish gem** with that tag. **Publish gem** verifies
   that the tag is on master's history, builds the gem before test tools can modify local files, runs checks, and verifies
   the tag, source version, manifest, changelog date, and packaged gem identity.
5. Only a successful verification job uploads a gem for the separate publishing
   job. That job has the OIDC permission, downloads the verified artifact, and uses
   `gem push`. It does not rebuild the package or create another tag.

A GitHub Release can exist before RubyGems publication succeeds. The **Publish gem**
workflow result is the publication status; creating a GitHub Release alone does
not mean the gem has been published.

`release_notes.md` is retained as historical commit-level notes through 16.3.0.
New release notes are generated in `CHANGELOG.md` and GitHub Releases. `DATE` is the
release-preparation date recorded in that changelog, not the later RubyGems upload
timestamp. No public version/date constant is removed.

## Choosing a version or publishing an RC

For a one-off explicit version, use Release Please's `Release-As: 13.2.0` footer in
a commit included in the release, or the `release-as` package setting. If using the
setting, remove it after the release so it does not keep forcing the same version.
Review the generated PR instead of changing only VERSION independently of the
manifest and changelog.

For an RC, configure the root package with `"prerelease": true` and an explicit
`"release-as": "13.2.0-rc.1"`. Release Please uses a SemVer tag such as
`v13.2.0-rc.1`; RubyGems normalizes the gem version/filename to `13.2.0.pre.rc.1`.
The release validator accepts that mapping. Use `rc.2`, etc. for further RCs.
Before the stable release, remove the prerelease flag and explicit RC version (or
set the intended stable release version explicitly). The default configuration
is for stable releases from master, not a parallel prerelease branch.

## Recovery

- **Release PR has a date mismatch:** rerun **Release Please**. Alternatively, check
  out its branch, run `ruby script/release.rb prepare-date`, and commit the date
  change. Do not edit the date to the upload day independently of the changelog.
- **PR checks do not start:** inspect the **Run release PR checks** step, Actions
  policy, and workflow permissions. Each dispatched workflow must exist on master.
  Retry the affected workflow from the generated PR branch using **Run workflow**;
  rerunning Release Please may not return an unchanged PR in its outputs.
- **Tag/Release exists but publication failed:** correct external setup if needed
  and rerun the failed workflow jobs. If dispatch itself failed, run
  **Publish gem** from master with the existing tag; rerunning Release Please does
  not necessarily emit an already-created release again. The verified artifact is kept for 14 days.
  If it has expired, run **Publish gem** manually from master with the same existing
  release tag; it rechecks and rebuilds that tag. This retry route is for releases
  containing this workflow and validation script, not older historical tags.
- **RubyGems already has that version:** confirm the existing release before retrying.
  The workflow deliberately does not treat every push failure as success. Published
  versions cannot be overwritten. Do not move the tag or rebuild different source
  under the same version; use a new release when a code fix is needed.
- **A build or validation needs a source-code fix:** fix master and prepare a new
  release. The retry path always checks out the original tag, so it cannot silently
  publish newer master code under that tag.

## Local checks without publication

```sh
bundle install
bundle exec rake rubocop test
bundle exec ruby test/release/release_test.rb
bundle exec rake build
ruby script/release.rb verify
```

To validate a prospective tag, pass `v<version>` to `verify`. This checks metadata;
it does not create the tag. `prepare-date` changes only the local version file.
Neither script command pushes or publishes. `bundle exec rake build` only builds.

The repository bootstrap is pinned to the existing `v16.3.0` commit
`8b80a78e1bf1053e8f9a3f16bec3205a766f7faa`, with manifest version `16.3.0`. This avoids
replaying all historical changes on the first release. Once Release Please has
made its first release, its bootstrap setting is ignored and can be removed.

## References

- [Release Please](https://github.com/googleapis/release-please)
- [GitHub workflow triggering and token behavior](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/trigger-a-workflow)
- [Appium Python client release workflow](https://github.com/appium/python-client/blob/master/.github/workflows/publish.yml)
- [Appium XCUITest driver release workflow](https://github.com/appium/appium-xcuitest-driver/blob/master/.github/workflows/publish.js.yml)
- [Manifest and prerelease configuration](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md)
- [RubyGems Trusted Publishing](https://guides.rubygems.org/trusted-publishing/)
- [RubyGems credentials Action](https://github.com/rubygems/configure-rubygems-credentials)

The credentials Action is used instead of `rubygems/release-gem` because Release
Please already owns the tag. Authentication plus `gem push` avoids invoking a
second tool's tag-creation/release sequence.
