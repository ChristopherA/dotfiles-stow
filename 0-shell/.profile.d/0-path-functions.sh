#!/bin/bash

# ~/.profile.d/0-path-functions.sh: Various path related functions

path_append() {
  if [ -d "$1" ]; then
      PATH=${PATH//":$1:"/:} #delete all instances in the middle
      PATH=${PATH/%":$1"/} #delete any instance at the end
      PATH=${PATH/#"$1:"/} #delete any instance at the beginning
      PATH="${PATH:+"$PATH"}:$1" #prepend $1 or if $PATH is empty set to $1
  fi
}

path_prepend() {
    if [ -d "$1" ]; then
        PATH=${PATH//":$1:"/:} #delete all instances in the middle
        PATH=${PATH/%":$1"/} #delete any instance at the end
        PATH=${PATH/#"$1:"/} #delete any instance at the beginning
        PATH="$1${PATH:+":$PATH"}" #prepend $1 or if $PATH is empty set to $1
    fi
}
