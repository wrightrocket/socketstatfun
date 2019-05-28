# socket statistic function to quickly filter for a source or destination port
# Enabled for use within the Bourne family of shells by executing "source ss.fun"
# Usage: ss <sport|dport>
# To filter for all source and destination ports 22
# Examples: 
#   
#   ss 22
#   ss 80 -t
#   ss 53 -ulpn
#   ss 22 state established
# By: wrightrocket <wright.keith@gmail.com>
#
ss () {
	if test -z "$1"
	then
		env ss
		# execute naked ss command
		return 0
		# return from function if there is no arguments
	fi

	#        [ -z "$1" ] && env ss && return 0  # if nothing passed run ss

	A1=$(echo "$1" | tr -d '-') # delete any - characters in $1 and store in $A1
	if test "$1" != "$A1" # if $1 is not the same as $1 with '-' removed then
	then
		env ss "$@" 
		# run normal ss command if "-" begins first argument or
		return 0
		# [ "$1" != "$A1" ] && env ss "$@" && return 0
	elif test "$1" == "state"
	then
		env ss "$@"
		# run normal ss command if begins with "state"
		return 0
	else
		shift
		# shift command arguments to the left dropping off $1
		env ss "$@" "( sport = :$A1 or dport = :$A1 )"
		# [ "$1" == "$A1" ] && shift && env ss "$@" "( sport = :$A1 or dport = :$A1 )" && return 0 
		# if the first argument is not an option or the work "state" 
		# then run ss command to show tcp/udp listening source or destination ports
		# to match the first argument to ss 
	fi
}
