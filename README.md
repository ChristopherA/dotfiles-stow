# Dotfiles, managed by Stow

This project is a refactor of my old dotfiles, updated for macOS Sierra 10.12.0, using gnu `stow` and a `conf.d`like approach to `.bash_profile`, `.profile` and similar files.

* 2016-09-27 - Confirmed working with macOS Sierra 10.12.0

This is still work in progress — use with caution.

## Installation

* [ ] go to your home directory
~~~
cd ~/
~~~
* [ ] run remote script to update to latest mac os update and command line tools
~~~
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/macos/.install/macos-allupdates.sh | bash
~~~
* [ ] run remote script to install brew and update it
~~~
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/macos/.install/brew-updates.sh | bash
~~~
* [ ] clone the git repository to ~/.dotfiles
~~~
git clone https://github.com/ChristopherA/dotfiles-stow.git ~/.dotfiles
~~~
* [ ] run local version of brew updater to install Brewfile bundle
~~~
~/.dotfiles/osx/.install/brew-updates.sh
~~~
* [ ] enter to your new .dotfiles directory
~~~
cd ~/.dotfiles
~~~
* [ ] Use stow to symlink (at minimum do `stow shell`)
~~~
stow shell # Minimum set of shell configuration
stow shell-git # Adds git & gpg commit integration to shell
stow shell-git-hub # Adds github-specific `brew install hub`
stow shell-nano # optionally install nano editor (on mac allows use of mouse in Terminal)
stow macos # optionally install some additional macOS Sierra specific scripts
stow macos-git-atom # optionally use atom for git commit
stow macos-harden # optionally install any macOS Sierra hardening scripts
stow macos-hardest # even more paranoid macOS Sierra hardening scripts (requires `stow-harden` first)
~~~
* [ ] If you have done `stow macos-*` you can optionally setup macOS with various useful additional settings
~~~
source ~/.install/macos-setup.sh
~~~
- [ ] Close and reopen your Terminal

# Uninstall
