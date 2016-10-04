#!/bin/bash

# ~/.profile.d/5-bash-functions.sh: Various path related functions for both
# interactive and non-interactive bash

# from dyvers hands

# Recursively delete files that match a certain pattern
# (by default delete all `.DS_Store` files)
cleanup() {
    local q="${1:-*.DS_Store}"
    find . -type f -name "$q" -ls -delete
}
