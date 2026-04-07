#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/your/repo"
    exit 1
fi

REPO_PATH="$1"

if [ ! -d "$REPO_PATH/.git" ]; then
    echo "Error: The provided path does not seem to be a valid Git repository."
    exit 1
fi

cd "$REPO_PATH"

git fetch --prune

current_branch=$(git branch --show-current)
main_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "main")

echo "=== Pruning branches with deleted remotes (merged PRs) ==="
merged_branches=$(comm -23 \
    <(git branch | grep -v '^\*' | tr -d ' ' | sort) \
    <(git branch -r | sed 's/.*origin\///' | sort) \
    | grep -v "^${main_branch}$" || true)

for branch in $merged_branches; do
    if [ "$branch" = "$current_branch" ]; then
        echo "Skipping current branch: $branch"
        continue
    fi
    echo "Deleting (remote deleted): $branch"
    git branch -D "$branch"
done

echo ""
echo "=== Pruning branches older than 90 days ==="
cutoff=$(date -v-90d +%s 2>/dev/null || date -d '90 days ago' +%s)

git branch | grep -v '^\*' | tr -d ' ' | while read branch; do
    if [ "$branch" = "$main_branch" ]; then
        continue
    fi

    last_commit=$(git log -1 --format=%ct "$branch" 2>/dev/null || echo "0")

    if [ "$last_commit" -lt "$cutoff" ]; then
        echo "Deleting (older than 90 days): $branch"
        git branch -D "$branch"
    fi
done

echo ""
echo "=== Remaining branches ==="
git branch
