#!/bin/sh


# This is required for `notify-send` to work from within a cron.
# http://askubuntu.com/questions/298608/notify-send-doesnt-work-from-crontab/346580#346580
#eval "export $(egrep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session)/environ)";

# syncAndWink
#
# Syncs all remotely-tracked branches on a git repo passed as first argument ($1). It also pulls any new branches
# and tags attached to the repo.
#
# $1 - The dir to check
# $2 - Toggle 'git push'. Set to '0' to disable automatically pushing new local commits.
#
syncAndWink() 
{
    # Toggle 'git push'.
    local ENABLE_PUSH="$2"

    # Check if $1 is a git repository
    stat "$1" > /dev/null || return 1;
    cd $1; echo "Checking $PWD (ENABLE_PUSH=$ENABLE_PUSH)";
    git status --porcelain || return 1; # A fatal error if $PWD is not a git repo

    local MESSAGE=""
    local PUSH=0; # If > 0, call `git push`

    # Loop through all local remote-tracking branches and count how many commits differ.
    # If required, merge fast-forward changes into branch
    declare -a LOCAL_BRANCHES=$(git branch -l | cut -c3- | tr "\n" " ")
    for BRANCH in ${LOCAL_BRANCHES[*]}; do 

        echo "BRANCH=$BRANCH"

        # If a local branch does not track a remote, skip it
        local REMOTE_BRANCH=$(git rev-parse --abbrev-ref --symbolic-full-name $BRANCH@{u}) || continue;
        echo "REMOTE_BRANCH=$REMOTE_BRANCH"

        local REMOTE_COMMITS=$(git log $BRANCH..$REMOTE_BRANCH --oneline | wc -l) # Remote commits not in my local
        echo "REMOTE_COMMITS=$REMOTE_COMMITS"
        local LOCAL_COMMITS=$(git log $REMOTE_BRANCH..$BRANCH --oneline | wc -l) # Local commits not pushed to remote
        echo "LOCAL_COMMITS=$LOCAL_COMMITS"

        local CURR_BRANCH=$(git branch | grep '*' | cut -c3-) # Check the current branch at the last minute. 
        echo "CURR_BRANCH=$CURR_BRANCH"

        if [ $REMOTE_COMMITS != "0" ]; then

            # If on a checked-out branch, only pull if all there are no uncomitted local changes. Skip otherwise
            # For other branches, merge remote changes
            if [ "$CURR_BRANCH" = "$BRANCH" ]; then
                if [ "$(git status --porcelain)" = "" ]; then
                    echo "Pulling...."
                    git pull

                    MESSAGE+="$REMOTE_COMMITS new commits from '$REMOTE_BRANCH'.\n"
                fi
            #else
                #git fetch origin $BRANCH:$BRANCH
            fi
        fi

        # If there are any new commits, and push is enabled, log the message and increment PUSH counter
        #if [ $LOCAL_COMMITS != "0" ] && [ $ENABLE_PUSH -gt 0 ]; then
        #    MESSAGE+="$LOCAL_COMMITS local commits on '$BRANCH'.\n"
        #    ((PUSH++))
        #fi
    done

    # Push all updates across all "matching" branches, if the user has 'push' enabled
    #if [ $PUSH -gt 0 ]; then 
    #    git push origin :
    #fi

    # If there were any updates, notify the user. Include the latest commit on the current branch
    if [ "$MESSAGE" != "" ]; then
        MESSAGE+="\nLatest commit on '$(git rev-parse --abbrev-ref HEAD)'\n"$(git log --format=format:"%h by %an, %ar%n'%s'%n" -n 1)
        echo $MESSAGE
        notify-send "$PWD Updated" "$MESSAGE" -i /usr/share/icons/gnome/48x48/emotes/face-wink.png -t 2000 
    fi

}

if [[ $# -lt 1 ]];
then
    echo "Usage: $0 DIR [GIT_PUSH]";
    echo "Synchronizes a git repo at 'DIR'. Pulls and pushes changes to non-working directories.";
    echo "If GIT_PUSH == 0, switches off pushing your commits. (Default : 1)";
    exit 1;
fi

date;

MY_DIR="$1"

MY_GIT_PUSH=1
if [[ $# -gt 1 && $2 -lt 1 ]]; then
    MY_GIT_PUSH=0
fi

syncAndWink $MY_DIR $MY_GIT_PUSH

echo $?

if [ $? == 0 ]; then
    echo "Git done"
fi

