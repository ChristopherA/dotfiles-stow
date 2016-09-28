#!/bin/bash

# ~/.install/macos-setup.sh: setup varous macos settings and defaults

# DETAILS:

# Originally inspired by Mathias Bynens' famous ~/.macos — https://mths.be/macos
# https://github.com/mathiasbynens/dotfiles

# Refactored to use conf.d style loading.

# Script Debugger

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# macos-only stuff. Abort if not macos.
if [ "$(uname -s)" != "Darwin" ]
then
  echo "This is only for macOS!"
  exit 0
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

if $SCRIPT_DEBUG; then echo "~/.install/macos-setup.sh sourced."; fi

# Source all macos specific files in ~/.install/macos-setup.d
# Keep this directory tidy!

if $SCRIPT_DEBUG; then echo "   ~/.install/macos-setup.d sourced."; fi

if [ -d ~/.install/macos-setup.d/ ]; then
  for file in ~/.install/macos-setup.d/*.sh ; do
    source $file
    if $SCRIPT_DEBUG; then echo "         ${file##*/} completed."; fi
  done
fi

if $SCRIPT_DEBUG; then echo "   ~/.install/macos-setup.d completed."; fi

# All bash interface specific functionality has been executed

if $SCRIPT_DEBUG; then echo "~/.install/macos-setup.sh completed."; fi

# Source any local and private settings that bash interatictive specific
# that should not be under version control. ~/.install/macos-setup.local should be
# added to ~/.gitignore

if [ -f ~/.install/macos-setup.local ]; then source ~/.install/macos-setup.local; fi
