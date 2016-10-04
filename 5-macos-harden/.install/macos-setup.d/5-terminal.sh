#!/bin/bash

# ~/.dotfiles/macos-harden/.install/macos-setup.d/5-terminal.sh
# ~/.install/macos-setup.d/5-terminal.sh after `stow macos-harden`

# sourced by ~/.install/macos-setup.sh after `stow macos`

# From Christopher Allen's https://github.com/christophera/dotfiles-stow/

###############################################################################
# Harden settings Software Updates
###############################################################################

# 2016-09-27 Confirmed working with macOS Sierra 10.12.0 - CA

# -------------------------------------------
# Secure Terminal
# -------------------------------------------
# Enable "Secure Keyboard Entry" in Terminal.app
# Protects against some Mac apps (such as TextExpander) from listeng in on
# keyboard entry. See:
# http://apple.stackexchange.com/questions/70609/what-does-the-secure-keyboard-entry-menu-item-in-terminal-app-do
# However, it isn't solid protection against keyloggers. See:
# https://security.stackexchange.com/a/47786/8918
# defaults write com.apple.terminal SecureKeyboardEntry -bool false # default off
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# no reboot required
# if ! $REBOOT_REQUIRED; then export $REBOOT_REQUIRED=true; fi
