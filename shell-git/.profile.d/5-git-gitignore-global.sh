#!/bin/bash

# ~/.profile.d/5-git-gitignore_global.sh: Various path related functions

# Set global gitignore

if [ -f ~/.gitignore_global ]; then
  git config --global core.excludesfile ~/.gitignore_global
fi
