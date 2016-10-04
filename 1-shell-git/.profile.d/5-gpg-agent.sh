#!/bin/bash

# ~/.profile.d/5-gpg-agent.sh: Starts up gpg-agent, sets
# environmental variable so that multiple copies are not started

if [ -f $(brew --prefix)/bin/gpg-agent ]; then
  gpg-agent --daemon --enable-ssh-support \
          --write-env-file "${HOME}/.gpg-agent-info" &> /dev/null
  if [ -f "${HOME}/.gpg-agent-info" ]; then
     . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
  fi

  GPG_TTY=$(tty)
  export GPG_TTY
fi
