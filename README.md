# bitrise-git-env

Export git-related environment variables of the original branch or tag used to trigger the build.

## FAQ
- Why not just use [$BITRISE_GIT_COMMIT](https://devcenter.bitrise.io/builds/available-environment-variables/)  or [$GIT_CLONE_COMMIT_HASH](https://www.bitrise.io/integrations/steps/git-clone)?
  - $BITRISE_GIT_COMMIT is not guaranteed to have a value (e.g., build was triggered using branch or tag)
  - For pull requests, the Git Clone step will perform a merge with the source and target branch. $GIT_CLONE_COMMIT_HASH will then have the commit ID of the resulting commit. This means that $GIT_CLONE_COMMIT_HASH will not always point to the original commit hash of the source branch.