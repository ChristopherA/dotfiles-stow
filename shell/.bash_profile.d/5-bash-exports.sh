#!/bin/bash

# ~/.bash_profile.d/5-bash-exports.sh: useful exports for interactive bash

# from dyvers hands

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Make some commands not show up in history
# `&:` prev
export HISTIGNORE="&:ls:ls *:la:la *:lt:lt *:cd:cd -:pwd;exit:date:* --help"

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
