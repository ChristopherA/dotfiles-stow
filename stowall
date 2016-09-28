#!/usr/bin/env bash

# ~/.dotfiles/stowall: Stow all packages

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

clrstandout=$(tput smso) # Inverse - marks beginning end of this script
clrcommand=$(tput bold) # bold - marks calling other functions or scripts
clrunder=$(tput smul) # underline - marks comments
clrwarning=$(tput setaf 3) # yellow - marks warnings
clrerror=$(tput setaf 1) # red - marks errors
clrreset=$(tput sgr0) #normal - resets all

if $SCRIPT_DEBUG; then echo "${clrstandout}Stowing files in ${PWD}.${clrreset}"; fi

cd ~/.dotfiles
for files in ~/.dotfiles/*; do
  if [ -d ${files} ]; then
    stow -R $(basename $files)
    if $SCRIPT_DEBUG; then echo "$(basename $files) stowed."; fi
  fi
done
cd - > /dev/null

if $SCRIPT_DEBUG; then echo "${clrstandout}All packages stowed or re-stowed.${clrreset}"; fi
