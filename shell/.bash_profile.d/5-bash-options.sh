#!/bin/bash

# ~/.bash_profile.d/5-bash-options.sh: useful options for interactive bash

# from dyvers hands

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# History verification, so that commands matched by ! !! and !? are not auto
shopt -s histverify
