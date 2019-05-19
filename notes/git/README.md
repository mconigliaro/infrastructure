# git

## List 10 largest files

    git rev-list --objects --all | grep "$(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print$1}')"

## Purge a file from the repository

    bfg -D '<glob>'
