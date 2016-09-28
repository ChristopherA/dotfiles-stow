#!/bin/bash

# ~/.bash_profile.d/5-bash-aliases.sh: useful aliases for bash

# from dyvers hands

# fast directory navigation
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias ~="cd ~"           # Go home
alias -- -='cd -'        # Go back

# List dir contents aliases
# ref: http://ss64.com/osx/ls.html
# Long form no user group, color
alias ll="ls -oG"
# Order by last modified, long form no user group, color
alias lt="ls -toG"
# List all except . and ..., color, mark file types, long form no user group, file size
alias la="ls -AGFoh"
# List all except . and ..., color, mark file types, long form no use group, order by last modified, file size
alias lat="ls -AGFoth"
# List one entry per line
alias l1='ls -1'

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"
