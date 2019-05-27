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

## Examples the ss function 
<pre><font color="#8AE234"><b>keith@bionic</b></font>:<font color="#729FCF"><b>~/bin/socketstatfun</b></font>$ ss 22 -tlpn state all
State     Recv-Q     Send-Q            Local Address:Port            Peer Address:Port      
LISTEN    0          128                     0.0.0.0:22                   0.0.0.0:*         
LISTEN    0          128                        [::]:22                      [::]:*         
ESTAB     0          0                         [::1]:22                     [::1]:59578     
ESTAB     0          0                         [::1]:59578                  [::1]:22         users:((&quot;ssh&quot;,pid=449,fd=3))
</pre>

