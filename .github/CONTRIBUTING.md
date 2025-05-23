Contributing
============

We'd love your help making `connect-dart` better!

If you'd like to add new exported APIs, please [open an issue][open-issue]
describing your proposal &mdash; discussing API changes ahead of time makes
pull request review much smoother. In your issue, pull request, and any other
communications, please remember to treat your fellow contributors with
respect!

Note that for a contribution to be accepted, you must sign off on all commits
in order to affirm that they comply with the [Developer Certificate of Origin][dco].

## Setup

[Fork][fork], then clone the repository:

```
git clone git@github.com:your_github_username/connect-dart.git
cd connect-dart
git remote add upstream https://github.com/connectrpc/connect-dart.git
git fetch upstream
```

Make sure that the tests and the linters pass (you'll need `bash` and the
latest stable dart release installed):

```
dart pub get # download deps
dart pub global activate mono_repo # one time action to setup mono_repo cli
mono_repo presubmit
```

## Making Changes

Start by creating a new branch for your changes:

```
git checkout main
git fetch upstream
git rebase upstream/main
git checkout -b cool_new_feature
```

Make your changes, then ensure that `mono_repo presubmit` still passes. When you're satisfied with your changes,
push them to your fork.

Ensure to update [CHANGELOG.md](/packages/connect/CHANGELOG.md). Only changes that impact users should be listed. 
No need to list things like doc changes (unless it’s something major), dependency version bumps, or similar. 
Remove them from the generated release notes.

```
git commit -a
git push origin cool_new_feature
```

Then use the GitHub UI to open a pull request.

At this point, you're waiting on us to review your changes. We *try* to respond
to issues and pull requests within a few business days, and we may suggest some
improvements or alternatives. Once your changes are approved, one of the
project maintainers will merge them.

We're much more likely to approve your changes if you:

* Add tests for new functionality.
* Write a [good commit message][commit-message].
* Maintain backward compatibility.

[fork]: https://github.com/connectrpc/connect-dart/fork
[open-issue]: https://github.com/connectrpc/connect-dart/issues/new
[dco]: https://developercertificate.org
[commit-message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
