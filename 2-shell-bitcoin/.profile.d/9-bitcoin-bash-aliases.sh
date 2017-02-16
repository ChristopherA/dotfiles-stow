# Bitcoin related

#alias btcdir="cd ~/.bitcoin/" #linux default bitcoind path
alias bd="bitcoind"

alias bcdir="cd ~/Library/Application\ Support/Bitcoin/" #mac default bitcoind path
alias btdir="cd ~/Library/Application\ Support/Bitcoin/testnet/" #mac default bitcoind pathr
alias brdir="cd ~/Library/Application\ Support/Bitcoin/regtest/" #mac default bitcoind path

alias bc="bitcoin-cli"
alias bt="bitcoin-cli -testnet"
alias br="bitcoin-cli -regtest"

alias bcinfo='bitcoin-cli getinfo | egrep "\"version\"|balance|blocks|connections|errors"'
alias btinfo='bitcoin-cli -testnet getinfo | egrep "\"version\"|balance|blocks|connections|errors"'
alias brinfo='bitcoin-cli -regtest getinfo | egrep "\"version\"|balance|blocks|connections|errors"'
alias bcblock="echo `bitcoin-cli getblockcount 2>&1`/`wget -O - http://blockchain.info/q/getblockcount 2>/dev/null`"
alias btblock="echo `bitcoin-cli -testnet getblockcount 2>&1`/`wget -O - http://blockexplorer.com/testnet/q/getblockcount 2>/dev/null | cut -d : -f2 | rev | cut -c 2- | rev`"
alias brblock="echo `bitcoin-cli -regtest getblockcount 2>&1`"

alias qtstart="nohup ~/.bin/bitcoin-qt -daemon -server > /dev/null 2>&1 &"
alias bcstart="bitcoind -daemon"
alias btstart="bitcoind -testnet -daemon"
alias brstart="bitcoind -regtest -daemon"

alias bcstop="bitcoin-cli stop"
alias btstop="bitcoin-cli -testnet stop"
alias brstop="bitcoin-clie -regtest -stop"
