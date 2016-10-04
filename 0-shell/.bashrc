#!/bin/bash

# ~/.bashrc: executed by `bash` for non-login shells.

# DETAILS:

# ~/.bashrc is normally executed by bash only for non-login scripts such as ssh,
# cron, etc. Thus any non-interactive functions in ~/.bashrc shoud be as
# lightweight (minimal) as possible to reduce the overhead when starting
# a non-login shell.

# The $SCRIPT_DEBUG flag is not functional here as this script should not be
# executed interactively.

#if $SCRIPT_DEBUG; then echo "   ~/.bashrc sourced."; fi

# We source ~/.profile first to set all common environment and path settings,
# as later non-interactive scripts or functions may need them. Note that
# ~/.profile may also source ~/.profile.local for local and private settings
# that should not be under version control (for instance user credentials) yet
# should be available to all shells (e.g. git credentials).

if [ -f ~/.profile ]; then source ~/.profile; fi

# Next we source any bash non-interactive specific scripts in ~/.bash_profile.d
# Keep this directory tidy!

#if $SCRIPT_DEBUG; then echo "   ~/.bashrc.d sourced."; fi

if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    source $file
    # if $SCRIPT_DEBUG; then echo "      ${file##*/} completed."; fi
  done
fi

#if $SCRIPT_DEBUG; then echo "   ~/.bashrc completed."; fi
