# SS-Actions-Auto-Version

This is a sample repository to demonstrate a basic example of automating the process
of build versioning and release creation.

On each push to the main branch, a Github Action is triggered to derive the next
semantic version based on the conventional commits' history.

This version is then applied to the docker image as a tag, which is pushed to the repo
described in the Action.