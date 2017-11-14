#!/bin/bash

# ~/.dotfiles/osx/.install/brew-updates.sh -- update brew, install it if necessary
# http://brew.sh, search for brew formulae at http://braumeister.org

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0

# Can be executed remotely on a new machine via:

# $ curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/macos/.install/brew-updates.sh | bash

# Script Debugger

#SCRIPT_DEBUG=true
#SCRIPT_DEBUG=false

# kill on error
set -e

clrstandout=$(tput smso) # Inverse - marks beginning end of this script
clrcommand=$(tput bold) # bold - marks calling other functions or scripts
clrunder=$(tput smul) # underline - marks comments
clrwarning=$(tput setaf 3) # yellow - marks warnings
clrerror=$(tput setaf 1) # red - marks errors
clrreset=$(tput sgr0) #normal - resets all

brew_updates() {

if $SCRIPT_DEBUG; then echo "${clrstandout}brew-updates.sh sourced.${clrreset}"; fi

# Check for Homebrew. Install Homebrew http://brew.sh if doesn't exist, force via curl if necessary
if test ! $(which brew); then
  if $SCRIPT_DEBUG; then echo "${clrcommand}Installing Homebrew.${clrreset}"; fi

  if $SCRIPT_DEBUG
    then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
  fi

  # Check Homebrew installation

  if $SCRIPT_DEBUG; then echo "${clrcomment}Checking installation.${clrreset}"; fi

  if $SCRIPT_DEBUG
    then
      brew doctor
    else
      brew doctor > /dev/null
  fi

  if $SCRIPT_DEBUG; then echo "${clrcommand}Homebrew installed.${clrreset}"; fi

fi

# Update the latest version of Homebrew

if $SCRIPT_DEBUG; then echo "${clrcommand}Updating Homebrew.${clrreset}"; fi

if $SCRIPT_DEBUG
  then
    brew update
  else
    brew update > /dev/null
fi

# Upgrade any outdated, unpinned brews

if $SCRIPT_DEBUG; then echo "${clrcommand}Upgrade any outdated, unpinned brews.${clrreset}"; fi

if $SCRIPT_DEBUG
  then
    brew upgrade
  else
    brew upgrade > /dev/null
fi

# install all brews listed in ~/.dotfiles/install/Brewfile

if [ -f ~/.install/Brewfile ];
then
  if $SCRIPT_DEBUG
  then
    echo "${clrcomment}Brewfile for \`brew bundle\` found in ~/.install/Brewfile.${clrreset}"
    cd ~/.install
    brew bundle
    cd - > /dev/null
  else
    cd ~/.install
    brew bundle > /dev/null
    cd - > /dev/null
  fi
elif [ -f ~/.dotfiles/5-macos/.install/Brewfile ]
then
  if $SCRIPT_DEBUG
  then
    echo "${clrcomment}Brewfile for \`brew bundle\` found in ~/.dotfiles/5-macos/.install/Brewfile.${clrreset}"
    cd ~/.dotfiles/5-macos/.install/
    brew bundle
    cd - > /dev/null
  else
    cd ~/.dotfiles/5-macos/.install/
    brew bundle > /dev/null
    cd - > /dev/null
  fi
else
  if $SCRIPT_DEBUG; then echo "${clrerror}No Brewfile for \`brew bundle\` found.${clrreset}"; fi
fi

# Cleanup old Homebrew formula

if $SCRIPT_DEBUG; then echo "${clrcommand}Cleanup old brew formula.${clrreset}"; fi

if $SCRIPT_DEBUG
  then
    brew cleanup
  else
    brew cleanup > /dev/null
fi

# Prune dead Homebrew symlinks

if $SCRIPT_DEBUG; then echo "${clrcommand}Prune dead symlinks.${clrreset}"; fi

if $SCRIPT_DEBUG
  then
    brew prune
  else
    brew prune > /dev/null
fi

if $SCRIPT_DEBUG; then echo "${clrstandout}brew-updates.sh completed.${clrreset}"; fi


} # end function brew_updates()

brew_updates
unset brew_updates
