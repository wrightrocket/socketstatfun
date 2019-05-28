# socket statistic function to quickly filter for a source or destination port
# By: wrightrocket <wright.keith@gmail.com>
#
# Enabled for use within the Bourne family of shells by executing "source ss.fun"
# Usage: ss <sport|dport>
# To filter for all source and destination ports 22
# Examples: 
#   Not overriding:
#   	ss -tln
#   	ss state all
#   Overriding: 
#   	ss 22
#   	ss ssh
#   	ss http -ae
#   	ss 80 -t
#   	ss 53 -ulpn
#   	ss 22 state established
#
ss () {
	if test -z "$1"
	then
		env ss
		# execute naked ss command
		return 0
		# return from function if there is no arguments
	fi

	A1=$(echo "$1" | tr -d '-') # delete any - characters in $1 and store in $A1

	if test "$1" != "$A1" # if $1 is not the same as $1 with '-' removed then
	then
		env ss "$@" 
		# run normal ss command if "-" is first argument or
		return 0
	elif test "$1" == "state"
	then
		env ss "$@"
		# run normal ss command if begins with "state"
		return 0
	else
		shift
		# drop off $1 the first argument by shifting arguments to the left 
		echo 'Executing: env ss' "$@" '\"(' sport = :$A1 or dport = :$A1 ')\"'
		env ss "$@" "( sport = :$A1 or dport = :$A1 )" # execute override
		# if the first argument is not an option or the word "state" 
		# then run ss command with the arguments or options following the 
		# first argument using the first argument as the source or destination port
		# to match with "( sport = :$A1 or dport = :$A1 )"
	fi
}
