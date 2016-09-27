#!/bin/bash

# ~/.bash_profile.d/bash-colors.sh: colors for bash
# from dyvers hands

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=auto"
fi

if [ $(uname) = "Darwin" ]
then
  # Define Mac bash command line colors, compatible with Solarized color
  # themes from http://ethanschoonover.com/solarized
  export CLICOLOR=1
fi

### Solarized-dark 'ls' colors if we are using Mac OSX `ls`
### as per https://github.com/seebi/dircolors-solarized/issues/10
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

### Colors for Light Terminal Themes
### as per http://antesarkkinen.com/blog/add-colors-to-os-x-terminal-including-ls-and-nano/
# export LSCOLORS=ExFxBxDxCxegedabagacad

## grep colors to highlight matches
export GREP_OPTIONS='--color=auto'

## Git Colors
git config --global color.ui true
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
