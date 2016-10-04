#!/bin/bash

# ~/.dotfiles/macos-hardest/.install/macos-setup.d/6-time.sh
# ~/.install/macos-setup.d/6-time.sh after `stow macos-hardest`

# sourced by ~/.install/macos-setup.sh after `stow macos`

# From Christopher Allen's https://github.com/christophera/dotfiles-stow/

###############################################################################
# Hardest settings for Time Machine
###############################################################################

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0 - CA

# ----------------------------------
# Disable local Time Machine backups
# ----------------------------------

# Originally from Mathias Bynens' famous dotfiles
# at https://mths.be/osx or https://github.com/mathiasbynens/dotfiles
# found in https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# TODO: How do we reverse this?
hash tmutil &> /dev/null && sudo tmutil disablelocal

# TODO: It is possible that any cached local Time Machine backups need to
# be manually deleted. I believe it may be cleared by…
sudo periodic daily weekly monthly

# Reboot not required
#if ! $REBOOT_REQUIRED; then export $REBOOT_REQUIRED=true; fi
