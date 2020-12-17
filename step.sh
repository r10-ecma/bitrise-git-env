#!/usr/bin/env bash
# fail if any commands fails
set -e
# debug log
set -x

### Get git commit hash if needed ###
if [ -z "$BITRISE_GIT_COMMIT"]
then 
    echo "\$BITRISE_GIT_COMMIT is empty"
    
    if [ "$USE_LS_REMOTE" = "true" ]
    then
        if [ -z "$BITRISE_GIT_BRANCH" ]
            then
                echo "\$BITRISE_GIT_BRANCH is empty"
                if [ -z "$BITRISE_GIT_TAG" ]
                then
                    echo "\$BITRISE_GIT_TAG is empty"
                else
                    COMMIT_HASH=`git ls-remote $GIT_REPOSITORY_URL refs/tags/$BITRISE_GIT_TAG`
                    envman add --key BITRISE_GIT_COMMIT --value $COMMIT_HASH
                fi
            else
                COMMIT_HASH=`git ls-remote $GIT_REPOSITORY_URL $BITRISE_GIT_BRANCH`
                envman add --key BITRISE_GIT_COMMIT --value $COMMIT_HASH
            fi
        fi
    else
        # If you don't want to use ls-remote, then you need to call this step after the Git Clone step. Otherwise, the script will just exit since there's no other way to get a commit hash.
        if [ -z "$GIT_CLONE_COMMIT_HASH" ]
            echo "Not a git repository"
            exit 1
        then
        else
            COMMIT_HASH=$GIT_CLONE_COMMIT_HASH
            envman add --key BITRISE_GIT_COMMIT --value $COMMIT_HASH
        fi 
    fi
else
    COMMIT_HASH=$BITRISE_GIT_COMMIT
    echo "\$BITRISE_GIT_COMMIT is not empty"
fi

### GIT ###
# Git Message Subject
envman add --key R_GIT_COMMIT_MESSAGE_SUBJECT --value "`git log $COMMIT_HASH -1 --format=%s`"

# Git Message Body
envman add --key R_GIT_COMMIT_MESSAGE_BODY --value "`git log $COMMIT_HASH -1 --format=%b`"

# Git Author Name
envman add --key R_GIT_COMMIT_AUTHOR_NAME --value "`git log $COMMIT_HASH -1 --format=%an`"

# Git Author Email
envman add --key R_GIT_COMMIT_AUTHOR_EMAIL --value "`git log $COMMIT_HASH -1 --format=%ae`"

# Git Author Name
envman add --key R_GIT_COMMIT_COMMITER_NAME --value "`git log $COMMIT_HASH -1 --format=%cn`"

# Git Author Email
envman add --key R_GIT_COMMIT_COMMITER_EMAIL --value "`git log $COMMIT_HASH -1 --format=%ce`"