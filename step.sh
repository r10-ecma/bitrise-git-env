#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

### GIT ###
# Git Message Subject
envman add --key R_GIT_COMMIT_MESSAGE_SUBJECT --value "`git log $BITRISE_GIT_COMMIT -1 --format=%s`"

# Git Message Body
envman add --key R_GIT_COMMIT_MESSAGE_BODY --value "`git log $BITRISE_GIT_COMMIT -1 --format=%b`"

# Git Author Name
envman add --key R_GIT_COMMIT_AUTHOR_NAME --value "`git log $BITRISE_GIT_COMMIT -1 --format=%an`"

# Git Author Email
envman add --key R_GIT_COMMIT_AUTHOR_EMAIL --value "`git log $BITRISE_GIT_COMMIT -1 --format=%ae`"

# Git Author Name
envman add --key R_GIT_COMMIT_COMMITER_NAME --value "`git log $BITRISE_GIT_COMMIT -1 --format=%cn`"

# Git Author Email
envman add --key R_GIT_COMMIT_COMMITER_EMAIL --value "`git log $BITRISE_GIT_COMMIT -1 --format=%ce`"


