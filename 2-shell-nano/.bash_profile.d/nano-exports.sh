#!/bin/bash

# ~/.bash_profile.d/5-nano-git.sh: Use Nano as the git commit editor

# If nano is installed (`brew tap homebrew/dupes` & `brew install cask nano`)

if [ -d $(brew --prefix)/bin/nano ]; then
  git config --global core.editor "nano"
  export EDITOR="/usr/local/bin/nano"
fi
