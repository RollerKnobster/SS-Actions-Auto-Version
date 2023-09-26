# Auto-Version with SemVer

This is a sample repository to demonstrate a basic example of automating the process
of build versioning and release creation.

## Case 1: Pre-release
- On each push to the "main" branch, a Github Action is triggered to generate the next
semantic version based on the following "Conventional commits' history":
    - fix: a commit of the type fix patches a bug in your codebase (this correlates with PATCH in Semantic Versioning).
    - feat: a commit of the type feat introduces a new feature to the codebase (this correlates with MINOR in Semantic Versioning).
    - BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:, or appends a ! after the type/scope, introduces a breaking API change (correlating with MAJOR in Semantic Versioning). 

- This version is then applied to the docker image as a tag, which is pushed to the repo
described in the Action.

## Case 2: Release
- On each manual release with prefix "v"  like v1.1.1, a Github Action is triggered to derive the next
semantic version based on previous PRERELEASE version.

- This version is then applied to the docker image as a tag, which is pushed to the repo
described in the Action.
