#!/bin/bash

# ~/.bash_profile.d/atom-git-integration.sh: Use Atom as the Git commit editor
# from http://blog.atom.io/2014/03/13/git-integration.html

# If atom is installed (`brew install cask atom`)

if [ -d $(brew --prefix)/Caskroom/atom/ ]; then
  git config --global core.editor "atom --wait"
fi
