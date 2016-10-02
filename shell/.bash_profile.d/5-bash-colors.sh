#!/bin/bash

# ~/.bash_profile.d/5-bash-colors.sh: colors for bash
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

# Solarized Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
