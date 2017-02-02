# Dotfiles, managed by Stow

This project is a refactor of my old dotfiles, updated for macOS Sierra 10.12.0, using gnu `stow` and a `conf.d` like approach to `.bash_profile`, `.profile` and similar files.

* 2016-09-27 - Confirmed working with macOS Sierra 10.12.0

This is still work in progress — use with caution.

## Installation

* [ ] go to your home directory
~~~
cd ~/
~~~
* [ ] run remote script to update to latest mac os update and command line tools
~~~
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/5-macos/.install/macos-allupdates.sh | bash
~~~
* [ ] run remote script to install brew and update it
~~~
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/5-macos/.install/brew-updates.sh | bash
~~~
* [ ] clone the git repository to ~/.dotfiles
~~~
git clone git@github.com:ChristopherA/dotfiles-stow.git ~/.dotfiles
~~~
* [ ] run local version of brew updater to install Brewfile bundle
~~~
~/.dotfiles/5-macos/.install/brew-updates.sh
~~~
* [ ] enter to your new .dotfiles directory
~~~
cd ~/.dotfiles
~~~
* [ ] Use stow to symlink (at minimum do `stow 0-shell`)
~~~
stow 0-shell # Minimum set of shell configuration
stow 1-shell-git # Adds git & gpg commit integration to shell
stow 2-shell-git-bash-git-prompt # Adds 'brew install bash-git-prompt' prompt and colors
stow 2-shell-git-hub # Adds github-specific 'brew install hub'
stow 2-shell-nano # optionally install nano editor (on mac allows use of mouse in Terminal)
stow 5-macos # optionally install some additional macOS Sierra specific scripts
stow 5-macos-harden # optionally install any macOS Sierra hardening scripts
stow 6-macos-git-atom # optionally use atom for git commit
stow 6-macos-hardest # even more paranoid macOS Sierra hardening scripts (requires 'stow-harden' first)
~~~
* [ ] Or you can install them all at once with:
~~~
./stowall
~~~
* [ ] If you have done `stow macos-*` you can optionally setup macOS with various useful additional settings
~~~
source ~/.install/macos-setup.sh
~~~
- [ ] Close and reopen your Terminal

# Uninstall

```
cd ~/.dotfiles ; stow -Dv 0-shell 1-shell-git 2-shell-git-bash-git-prompt 2-shell-git-hub 2-shell-nano 5-macos 5-macos-harden 6-macos-git-atom 6-macos-hardest ; cd -
```

# After Changes

If you add or delete files in your .dotfiles stows, you can update them with (same as `-D` followed by `-S`):

```
cd ~/.dotfiles ; stow -R 0-shell 1-shell-git 2-shell-git-bash-git-prompt 2-shell-git-hub 2-shell-nano 5-macos 5-macos-harden 6-macos-git-atom 6-macos-hardest ; cd -
```
