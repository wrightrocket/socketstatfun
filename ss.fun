ss () {
# socket statistic function to quickly filter for a source or destination port
# Enabled for use within the Bourne family of shells by executing "source ss.fun"
# Usage: ss <sport|dport>
# To filter for all source and destination ports 22
# Examples: 
#   ss 22
#   ss 80 -t
#   ss 53 -ulpn
# by wrightrocket <wright.keith@gmail.com>
        [ -z "$1" ] && env ss && return 0  # if nothing passed run ss
	# return from function if there is no arguments

	A1=$(echo "$1" | tr -d '-') # delete any - characters in $1 and store in A1
	[ "$1" != "$A1" ] && env ss "$@" && return 0
	# run normal ss command if "-" begins first argument or
	[ "$1" == "state" ] && env ss "$@" && return 0 
	# run normal ss command if it starts with "state"

	[ "$1" == "$A1" ] && shift && env ss "$@" "( sport = :$A1 or dport = :$A1 )" && return 0 
	# [ "$1" == "$A1" ] && env ss -tulpn "( sport = :$1 or dport = :$1 )" && return 0 
	# echo run special ss command to show tcp/udp listening source or destination ports
	# when first argument to ss 

}
