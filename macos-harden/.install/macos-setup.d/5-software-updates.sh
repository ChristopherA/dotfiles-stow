#!/bin/bash

# ~/.dotfiles/macos-harden/.install/macos-setup.d/6-time.sh
# ~/.install/macos-setup.d/6-time.sh after `stow macos-harden`

# sourced by ~/.install/macos-setup.sh after `stow macos`

# From Christopher Allen's https://github.com/christophera/dotfiles-stow/

###############################################################################
# Harden settings Software Updates
###############################################################################

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0 - CA

# -------------------------------------------
# Misc. Software Update Settings from Mathias
# -------------------------------------------

# Originally from Mathias Bynens' famous dotfiles
# at https://mths.be/osx or https://github.com/mathiasbynens/dotfiles
# found in https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Enable the automatic update check
# defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false # default
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7 # default is 7 aka weekly
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1 # daily

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

# It is likely that these require a reboot before they are effective.
# TODO: test if this works without reboot.
if ! $REBOOT_REQUIRED; then export $REBOOT_REQUIRED=true; fi
