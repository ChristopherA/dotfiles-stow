#!/bin/bash

# ~/.bash_profile: executed by the `bash` command interpreter for login shells.

# DETAILS:

# When `bash` is invoked for an login shell (such as a new Terminal window)
# this ~/.bash_profile will be the first local file executed by `bash` after
# the system-wide files /etc/profile and /etc/bashrc.

# Bcause of this file's existence, neither ~/.bash_login nor  ~/.profile will
# be automatically sourced unless they are sourced by manually the other
# shell code.

# ~/.bash_profile is not executed by non-login shells, so don't put anything
# here that bash other scripts may need--they should be placed in ~/.bashrc
# instead.

# Put all `bash` interface specific functionality as seperate files in
# ~/.bash_profile.d, such as theme, colors & prompt. Any non-bash specific
# items such as enviroment settings and paths should be put in ~/.profile where
# they will be executed by all other kinds of shells (in particular .sh & .zsh).

# Script Debugger

SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

if $SCRIPT_DEBUG; then echo "~/.bash_profile sourced."; fi

# Because of the existence of ~/.bash_profile, neither ~/.bash_login
# nor ~/.profile will be automatically sourced unless they are sourced
# by the shell code. Here we source ~/.profile first to set all environment
# and path settings, as later scripts may need them. Note that ~/.profile
# will also source ~/.profile.local for local and private settings that should
# not be under version control (for instance user credentials) yet should
# be available to all shells (e.g. git credentials).

if [ -f ~/.profile ]; then source ~/.profile; fi

# Source all bash interface specific files in ~/.bash_profile.d
# Keep this directory tidy!

if $SCRIPT_DEBUG; then echo "   ~/.bash_profile.d sourced."; fi

if [ -d ~/.bash_profile.d ]; then
  for file in ~/.bash_profile.d/*.sh; do
    source $file
    if $SCRIPT_DEBUG; then echo "         ${file##*/} completed."; fi
  done
fi

if $SCRIPT_DEBUG; then echo "   ~/.bash_profile.d completed."; fi

# All bash interface specific functionality has been executed

if $SCRIPT_DEBUG; then echo "~/.bash_profile completed."; fi

# Source any local and private settings that bash interatictive specific
# that should not be under version control. ~/.bash_profile.local should be
# added to ~/.gitignore

if [ -f ~/.bash_profile.local ]; then source ~/.bash_profile.local; fi
