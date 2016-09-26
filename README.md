# Dotfiles, managed by Stow

This project is a refactor of my old dotfiles, updated for macOS Sierra 10.12.0, using gnu `stow` and a `conf.d`like approach to `.bash_profile` an similar files.

This is a work in progress — use with caution.

## Installation

You'll need to have brew and git installed, 

~~~
cd ~/
git clone https://github.com/ChristopherA/dotfiles-stow.git .dotfiles
cd ~/.dotfiles/shell/.install/
brew bundle
cd ~/.dotfiles
stow shell
~~~

