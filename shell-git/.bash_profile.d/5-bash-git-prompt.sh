#!/bin/bash

# ~/.bash_profile.d/5-bash-git-prompt.sh: An informative and fancy bash prompt for Git users
# from https://github.com/magicmonty/bash-git-prompt

# If bash-git-prompt is installed (`brew install bash-git-prompt`)

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi
