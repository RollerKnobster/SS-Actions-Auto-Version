# Auto-Version with SemVer

This is a sample repository to demonstrate a basic example of automating the process
of build versioning and release creation.

## Case 1: Pre-release
- On each push to the main branch, a Github Action is triggered to derive the next
semantic version based on the conventional commits' history. This generate PRERELEASE version.

- This version is then applied to the docker image as a tag, which is pushed to the repo
described in the Action.

## Case 2: Release
- On each manual release with prefix "v"  like v1.1.1, a Github Action is triggered to derive the next
semantic version based on previous PRERELEASE version.

- This version is then applied to the docker image as a tag, which is pushed to the repo
described in the Action.
