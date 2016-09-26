#!/bin/bash

# ~/.profile.d/9-bash-exports.sh: useful exports for both interactive and
# non-interactive bash

# from dyvers hands

if [[ `uname` == 'Darwin' ]]; then
  # Set architecture flags
  export ARCHFLAGS="-arch x86_64"
fi
