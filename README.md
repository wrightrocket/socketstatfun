# socketstatfun

* Using a ss function to override the ss command to filter by ports easily

This function can be used with a Linux shell in the Bourne family to override what is typically /bin/ss for port filtering.

If the first argument after ss is an option or a state filter, then the ss function will not override the "env ss" command.

If the first argument to a ss command is a number, then this ss function will filter for that port number and display the
information for both source and destination. Normal ss options and state filters can follow the port number.

## To use this function, clone the repository:

* git clone https://github.com/wrightrocket/socketstatfun

## Change to the socketstatfun directory:

* cd socketstatfun

## Source the function named ss.fun using either the . or source command:

* . ss.fun
 
* or 

* source ss.fun

If you have sourced the ss function before, then it is recommended to unset the ss function and SS_* variables before sourcing the ss function again:

* unset SS_OPT
* unset SS_STATE
* unset SS_PORT

* unset ss

* source ss.fun <br>
or <br>
* . ss.fun


## Examples using the ss function :
<pre>[keithwright@ryzen5 socketstatfun]$ ./ssq
Executing:  unset SS_OPT
Executing:  unset SS_STATE
Executing:  unset SS_PORT
Executing:  unset ss
Executing:  . ss.fun
Executing:  ss -tl
State         Recv-Q        Send-Q               Local Address:Port                       Peer Address:Port       
LISTEN        0             5                        127.0.0.1:ipp                             0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:44261                           0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:10248                           0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:10249                           0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:10251                           0.0.0.0:*          
LISTEN        0             128                   192.168.0.29:etcd-client                     0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:etcd-client                     0.0.0.0:*          
LISTEN        0             128                        0.0.0.0:hostmon                         0.0.0.0:*          
LISTEN        0             128                      127.0.0.1:apollo-relay                    0.0.0.0:*          
LISTEN        0             128                   192.168.0.29:etcd-server                     0.0.0.0:*          
LISTEN        0             32                   192.168.122.1:domain                          0.0.0.0:*          
LISTEN        0             128                  127.0.0.53%lo:domain                          0.0.0.0:*          
LISTEN        0             128                        0.0.0.0:ssh                             0.0.0.0:*          
LISTEN        0             5                            [::1]:ipp                                [::]:*          
LISTEN        0             128                              *:10250                                 *:*          
LISTEN        0             128                              *:sun-sr-https                          *:*          
LISTEN        0             128                           [::]:hostmon                            [::]:*          
LISTEN        0             128                              *:10255                                 *:*          
LISTEN        0             128                              *:10256                                 *:*          
LISTEN        0             128                              *:http                                  *:*          
LISTEN        0             128                              *:10257                                 *:*          
LISTEN        0             128                              *:10259                                 *:*          
LISTEN        0             128                           [::]:ssh                                [::]:*          
Executing:  ss -u state closed
Recv-Q      Send-Q                                 Local Address:Port                      Peer Address:Port      
0           0                                            0.0.0.0:39873                          0.0.0.0:*         
0           0                                            0.0.0.0:48111                          0.0.0.0:*         
0           0                                      192.168.122.1:domain                         0.0.0.0:*         
0           0                                      127.0.0.53%lo:domain                         0.0.0.0:*         
0           0                                     0.0.0.0%virbr0:bootps                         0.0.0.0:*         
0           0                                            0.0.0.0:bootpc                         0.0.0.0:*         
0           0                                          127.0.0.1:323                            0.0.0.0:*         
0           0                                        224.0.0.251:mdns                           0.0.0.0:*         
0           0                                        224.0.0.251:mdns                           0.0.0.0:*         
0           0                                        224.0.0.251:mdns                           0.0.0.0:*         
0           0                                            0.0.0.0:mdns                           0.0.0.0:*         
0           0                                            0.0.0.0:hostmon                        0.0.0.0:*         
0           0                                               [::]:48494                             [::]:*         
0           0                                              [::1]:323                               [::]:*         
0           0                [fe80::65bb:19d1:dc1b:337e]%enp24s0:dhcpv6-client                     [::]:*         
0           0                                               [::]:mdns                              [::]:*         
0           0                                               [::]:hostmon                           [::]:*         
0           0                                                  *:54961                                *:*         
Executing:  ss ssh
ss() function: Using SS_OPT=&quot;-ap&quot; SS_STATE=&quot;state all&quot; and SS_PORT=&quot;ssh&quot; and executing:
env ss -ap state all \( sport = :ssh or dport = :ssh \)
Netid       State        Recv-Q       Send-Q             Local Address:Port               Peer Address:Port       
tcp         LISTEN       0            128                      0.0.0.0:ssh                     0.0.0.0:*          
tcp         LISTEN       0            128                         [::]:ssh                        [::]:*          

Executing:  ss 22 state established
ss() function executing:
env ss state established \( sport = :22 or dport = :22 \)
Netid         Recv-Q         Send-Q                 Local Address:Port                  Peer Address:Port         

Executing:  ss domain -ulpne
ss() function executing:
env ss -ulpne \( sport = :domain or dport = :domain \)
State      Recv-Q     Send-Q         Local Address:Port           Peer Address:Port                               
UNCONN     0          0              192.168.122.1:53                  0.0.0.0:*         ino:45888 sk:52d &lt;-&gt;     
UNCONN     0          0              127.0.0.53%lo:53                  0.0.0.0:*         uid:193 ino:37407 sk:52e &lt;-&gt;

Executing:  ss 53 -ul state all
ss() function executing:
env ss -ul state all \( sport = :53 or dport = :53 \)
State         Recv-Q         Send-Q                 Local Address:Port                   Peer Address:Port        
UNCONN        0              0                      192.168.122.1:domain                      0.0.0.0:*           
UNCONN        0              0                      127.0.0.53%lo:domain                      0.0.0.0:*           

</pre>

## Disabling the Function
If you have sourced the ss function into your environment, it should be visible by running set, and paging through the output. You can see if the function is active with:

* type ss

To disable the function you can unset the name of the function:

* unset ss

## unset SS_* Variables
If you unset SS_OPT, SS_STATE, and SS_PORT, they will not override the default value of the ss function to be loaded in the future.

* unset SS_OPT 
* unset SS_STATE
* unset SS_PORT





