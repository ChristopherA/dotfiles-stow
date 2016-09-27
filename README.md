# Dotfiles, managed by Stow

This project is a refactor of my old dotfiles, updated for macOS Sierra 10.12.0, using gnu `stow` and a `conf.d`like approach to `.bash_profile` an similar files.

This is a work in progress — use with caution.

## Installation

~~~
cd ~/
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/install/allosxupdates.sh | bash
curl -L https://raw.githubusercontent.com/ChristopherA/dotfiles-stow/master/install/brew-updates.sh | bash
git clone https://github.com/ChristopherA/dotfiles-stow.git .dotfiles
~/.dotfiles/install/brew-updates.sh
brew bundle
cd ~/.dotfiles
stow shell
stow osx
stow nano # optional
~~~
