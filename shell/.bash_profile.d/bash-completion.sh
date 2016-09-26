#!/bin/bash

# ~/.bash_profile.d/bash-completion.sh: completion scripts for bash

# If bash-completion is installed (`brew install bash-completion`)
# http://bash-completion.alioth.debian.org

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
