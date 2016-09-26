#!/bin/bash

# ~/.bash_profile.d/bash-aliases.sh: useful aliases for bash

# from dyvers hands

# fast directory navigation
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias ~="cd ~"           # Go home
alias -- -='cd -'        # Go back

# List dir contents aliases
# ref: http://ss64.com/osx/ls.html
# Long form no user group, color
alias ll="ls -oG"
# Order by last modified, long form no user group, color
alias lt="ls -toG"
# List all except . and ..., color, mark file types, long form no user group, file size
alias la="ls -AGFoh"
# List all except . and ..., color, mark file types, long form no use group, order by last modified, file size
alias lat="ls -AGFoth"
# List one entry per line
alias l1='ls -1'

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"

# Open file in existing MacVim window
alias gvim="open -a MacVim"
alias mvim="open -a MacVim"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# cd to the path of the front Finder window
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}

alias f='open -a Finder ./'

# Trim new lines and copy to clipboard
alias clip="tr -d '\n' | pbcopy"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Open simulator
alias ios="open #/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Develope#r/Applications/iPhone\ Simulator.app"
