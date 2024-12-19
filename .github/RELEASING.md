# Releasing

## Prerequisites

- See the setup and tools required in CONTRIBUTING.md
- Login using `dart pub login` with an account that has publish access to `connectrpc` package.
- Make sure that the repository is in a good state, without PRs close to merge
  that would ideally be part of the release.

## Steps

1. Choose a new version (e.g. 1.2.3), making sure to follow semver. Note that all
   packages in this repository use the same version number.
2. Make sure you are on the latest main, and create a new git branch.
3. Set the new version in [pubspec.yaml](/packages/connect/pubspec.yaml)
4. Commit, push, and open a pull request with the title "Release 1.2.3".
5. Edit the PR description with release notes. See the section below for details.
6. Make sure CI passed on your PR and ask a maintainer for review.
7. After approval, run the following command to publish to pub.dev: `dart pub publish`.
8. Merge your PR.
9. Create a new release in the GitHub UI
   - Choose "v1.2.3" as a tag and as the release title.
   - Copy and paste the release notes from the PR description.
   - Check the checkbox “Create a discussion for this release”.

## Release notes

- We generate release notes with the GitHub feature, see
  https://docs.github.com/en/repositories/releasing-projects-on-github/automatically-generated-release-notes
- Only changes that impact users should be listed. No need to list things like
  doc changes (unless it’s something major), dependency version bumps, or similar.
  Remove them from the generated release notes.
- If the release introduces a major new feature or change, add a section at the
  top that explains it for users.
- If the release includes a very long list of changes, consider breaking the
  changelist up with the sections "Enhancements", "Bugfixes", "Breaking changes".  
- If the release includes changes specific to a npm package, group and explain
  the changelist in according separate sections.
