# Dotfiles, managed by Stow

This project is a refactor of my old dotfiles, updated for macOS Sierra 10.12.0, using gnu `stow` and a `conf.d`like approach to `.bash_profile` an similar files.

* 2016-09-27 - Confirmed working with macOS Sierra 10.12.0

This is still work in progress — use with caution.

## Installation

~~~
# go to your home directory
cd ~/
# run remote script to update to latest mac os update and command line tools
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/macos/.install/macos-allupdates.sh | bash
# run remote script to install brew and update it
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/macos/.install/brew-updates.sh | bash
# clone the git repository to ~/.dotfiles
git clone https://github.com/ChristopherA/dotfiles-stow.git ~/.dotfiles
# run local version of brew updater to install Brewfile bundle
source ~/.dotfiles/osx/.install/brew-updates.sh
# enter to your new .dotfiles directory
# Use stow to symlink
stow shell # You must minimally do this
stow macOS # optionally install some additional macOS Sierra specific scripts
stow nano # optionally install nano editor (on mac allows use of mouse in terminal)
# If you have done `stow macos` you optionally setup macOS with various useful settings
source ~/.install/macos-setup.sh
# Close and reopen your Terminal
~~~
