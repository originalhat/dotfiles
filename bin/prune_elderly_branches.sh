#!/bin/bash

# Check if a repository path was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/your/repo"
    exit 1
fi

REPO_PATH="$1"

# Check if the provided path is a valid Git repository
if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Error: The provided path does not seem to be a valid Git repository."
    exit 1
fi

# Navigate to the Git repository
cd "$REPO_PATH"

# Fetch updates from the remote and prune
git fetch --prune

# Delete local branches not touched in the last month
git branch --sort=-committerdate | while read branch; do
    if [ "$(git log -1 --since='1 month ago' -s $branch)" == "" ]; then
        git branch -D $branch;
    fi;
done

