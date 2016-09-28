#!/bin/bash

# ~/.profile.d/5-alias-hub: A command-line wrapper for git that makes you better at GitHub.
# from https://hub.github.com

# If hub is installed (`brew install hub`)

if [ -f $(brew --prefix)/bin/hub ]; then
    alias git=hub
fi
