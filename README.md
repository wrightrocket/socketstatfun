# socketstatfun

* Using a ss function to override /bin/ss to filter by ports easily

This function can be used with a Linux shell in the Bourne family to override /bin/ss for port filtering.

If the first argument to a ss command is a number, then this function will filter for that number as a port number. 
It will display the information for that port number. Options and state filters are allowed to follow the port number.

## To use this function, clone the repository:

* git clone https://github.com/wrightrocket/socketstatfun

## Change to the socketstatfun directory:

* cd socketstatfun

## Source the function named ss.fun using either the . or source command:

* . ss.fun
 
* or 

* source ss.fun

keith@bionic:~/bin/socketstatfun$ ss 80
 : command not found
Netid   State     Recv-Q    Send-Q          Local Address:Port         Peer Address:Port    
tcp     LISTEN    0         128                         *:80                      *:*


