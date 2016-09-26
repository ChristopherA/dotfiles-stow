#!/bin/bash

# ~/.bash_profile.d/bash-completion.sh: completion scripts for bash
# from http://bash-completion.alioth.debian.org

# If bash-completion is installed (`brew install bash-completion`)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
