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
	if ! test -n "$SSOPT"
	then # if the SSOPTDEF variable is not set assign the follow value
		SSOPT="-map" # default options when using a naked port filter
	fi

	if ! test -n "$SSSTATE"
	then # if the SSSTATEDEF variable is not set assign the follow value
		SSSTATE="state all" # default state when using a naked port filter
	fi

	if test -z "$1"
	then # If there is no arguments provided then do not override
		env ss
		# execute naked ss command
		return 0
		# return from function if there is no arguments
	fi

	SSPORT=$(echo "$1" | tr -d '-') # delete any - characters in $1 and store in $SSPORT

	if test "$1" != "$SSPORT" # if $1 is not the same as $1 with '-' removed then
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
		
		# test to see if there are any other arguments, the old $2 is now $1
		if test -z "$1" # if $1 is null
		then 
			echo -n "ss() function: Using SSOPT=\"${SSOPT}\"" # Use the ss option default variable set at above
			echo " SSSTATE=\"${SSSTATE}\" and SSPORT=\"${SSPORT}\"" # Use the ss state default variable set above
			echo -e "env ss $SSOPT $SSSTATE \\( sport = :$SSPORT or dport = :$SSPORT \\)"
			env ss $SSOPT $SSSTATE \( sport = :$SSPORT or dport = :$SSPORT \) # execute override
		else
			echo -e "Executing: env ss $@ \\( sport = :$SSPORT or dport = :$SSPORT \\)"
			env ss $@ \( sport = :$SSPORT or dport = :$SSPORT \) # execute override
		fi
		# if the first argument is not an option or the word "state" 
		# then run ss command with the arguments or options following the 
		# first argument using the first argument as the source or destination port
		# to match with "( sport = :$SSPORT or dport = :$SSPORT )"
	fi
}
