#!/bin/bash

# ~/.profile: sourced by ~/.bash_profile or ~/.bashrc or ~/.zshrc

# DETAILS:

# ~/.profile by default is not executed by bash if ~/.bash_profile, ~/.bashrc,
# or ~/.bash_login already exist. However, as a legacy shell file it is executed
# by many other shells, so is a useful place for common exported environmental
# variables and paths used by all shells.

# In this shell files setup, ~/.profile is either sourced by ~/.bash_profile or
# ~/.zshrc interactively (through a Terminal) or by ~/bashrc non-interactively
# (i.e. ssh, cron, etc.). Any non-interactive functions shoud be as
# lightweight (minimal) as possible to reduce the overhead when starting a
# non-login shell.

# Script Debugger

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# Test for a terminal (aka interactive)!

# The -t test option checks whether the stdin, [ -t 0 ], or stdout, [ -t 1 ],
# in a given script is running in a terminal. In addition, if [ -t 0 ] works
# when you're logged in locally but fails when you invoke the command remotely
# via ssh. So for a true test you also have to test for a socket.

if [[ -t 0 || -p /dev/stdin ]]
then #shell is interactive
  if $SCRIPT_DEBUG; then echo "   ~/.profile (interactive-only) sourced."; fi
  # Do any interactive *only* shell functionality here
  if $SCRIPT_DEBUG; then echo "   ~/.profile (interactive-only) executed."; fi
else # shell is non-interactive
  # Do any shell non-interactive *only* shell functionality here
  echo non-interactive
fi

# Do any functionality for both interactive or non-interactive shells here,
# in particular common exported environmental variables and paths used
# by all shells.

# Source all bash interface specific files in ~/.bash_profile.d
# Keep this directory tidy!

if [[ -t 0 || -p /dev/stdin ]]
then # shell is interactive
  if $SCRIPT_DEBUG; then echo "   ~/.profile.d sourced."; fi
fi

if [ -d ~/.profile.d ]; then
  for file in ~/.profile.d/*.sh; do
    source $file
    if [[ -t 0 || -p /dev/stdin ]]
    then # shell is interactive
      if $SCRIPT_DEBUG; then echo "         ${file##*/} completed."; fi
    fi
  done
fi

if [[ -t 0 || -p /dev/stdin ]]
then # shell is interactive
  if $SCRIPT_DEBUG; then echo "   ~/.profile completed."; fi
fi

# Now we will source ~/.profile.local for local and private settings that should
# not be under version control (for instance user credentials) yet should
# be available to all shells (e.g. git credentials).

if [ -f ~/.profile.local ]; then source ~/.profile.local; fi
