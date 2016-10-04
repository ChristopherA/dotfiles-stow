#!/bin/bash

# ~/.dotfiles/macos-hardest/.install/macos-setup.d/6-time.sh
# ~/.install/macos-setup.d/6-time.sh after `stow macos-hardest`

# sourced by ~/.install/macos-setup.sh after `stow macos`

# From Christopher Allen's https://github.com/christophera/dotfiles-stow/

###############################################################################
# Hardest settings for Software Updates
###############################################################################

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0 - CA

# -------------------------------------------
# Misc. Software Update Settings from Mathias
# -------------------------------------------

# Originally from Mathias Bynens' famous dotfiles
# at https://mths.be/osx or https://github.com/mathiasbynens/dotfiles
# found in https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Turn off app auto-update
defaults write com.apple.commerce AutoUpdate -bool false

# It is likely that these require a reboot before they are effective.
# TODO: test if this works without reboot.
if ! $REBOOT_REQUIRED; then export $REBOOT_REQUIRED=true; fi
