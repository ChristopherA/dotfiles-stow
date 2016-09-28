#!/bin/bash

# ~/.install/macos-harden/macos-setup.d/5-software-updates.sh
###############################################################################
# Software Updates
###############################################################################

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0

# From Christopher Allen's https://github.com/christophera/dotfiles-stow/

###############################################################################
# Check for software updates daily, not just once per week
###############################################################################

# Originally from Mathias Bynens' famous dotfiles
# at https://mths.be/osx or https://github.com/mathiasbynens/dotfiles
# found in https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7 # default is 7 aka weekly
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1 # daily

# It is likely that a reboot may be required before this is effective.
#!! TBD: test if this works without reboot.
if ! $REBOOT_REQUIRED; then export $REBOOT_REQUIRED=true; fi
