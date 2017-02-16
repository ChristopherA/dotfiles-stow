#!/bin/bash
# Originally from https://github.com/bitseed-org/bitcoin-box/blob/master/.hdd/blockstatus.sh
# TODO: Don't use temp files, or use proper temp file directoriest

#get current block height from blockchain.info
echo $(date)
wget -4 https://blockchain.info/q/getblockcount &> /dev/null
netblk=$(<getblockcount)
echo "Current Block: $netblk"

#get current block from local bitcoin-cli
~/.bin/bitcoin-cli -testnet getblockcount > locblock
nodeblk=$(<locblock)
echo "Local Block: $nodeblk"

#if bitcoin-cli responds, compare local with network blocks
if [ "$nodeblk" == "" ]; then
 echo "checking recent blocks.  please wait"
 else
 diff=$((netblk-nodeblk))
 echo "$diff" "blocks behind"
 rm getblockcount
 rm locblock
fi
