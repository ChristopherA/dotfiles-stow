#!/bin/bash

# ~/.bash_profile.d/5-grc.sh: more colors for bash

# If Generic Colourizer (GRC) is installed (`brew install grc`)
# adds colors for make, gcc,g++, as, gas, ld, netstat, ping, traceroute, etc.
# http://korpus.juls.savba.sk/~garabik/software/grc.html

if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
  . $(brew --prefix)/etc/grc.bashrc
fi
