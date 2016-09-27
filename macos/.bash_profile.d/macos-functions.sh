#!/bin/bash

# ~/.bash_profile.d/macos-functions.sh: useful osx specific functions for interactive bash

#find and list processes matching a case-insensitive partial-match string
## as per http://brettterpstra.com/2014/08/15/shell-tricks-a-time-to-kill/

fp () {
	ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

# build a menu of processes matching (case-insensitive, partial) first parameter
# now automatically tries to use Jon Stovell's `quit` script if process is a Mac app
# http://jon.stovell.info/personal/Software.html
#
# As per http://brettterpstra.com/2014/08/15/shell-tricks-a-time-to-kill/

fk () {
	local cmd OPT
	IFS=$'\n'
	PS3='Kill which process? (q to cancel): '
	select OPT in $(fp $1); do
		if [[ $OPT =~ [0-9]$ ]]; then
			cmd=$(ps -p ${OPT##* } -o command|tail -n 1)
			if [[ "$cmd" =~ "Contents/MacOS" ]] && [[ -f /usr/local/bin/quit ]]; then
				echo "Quitting ${OPT%%:*}"
				cmd=$(echo "$cmd"| sed -E 's/.*\/(.*)\.app\/.*/\1/')
				~/dotfiles/bin/quit -n "$cmd"
			else
				echo "killing ${OPT%%:*}"
				kill ${OPT##* }
			fi
		fi
		break
	done
	unset IFS
}
