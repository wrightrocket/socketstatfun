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

## Examples using the ss function :
<pre><font color="#8AE234"><b>keith@bionic</b></font>:<font color="#729FCF"><b>~/bin/socketstatfun</b></font>$ ss 22 -tlpn state all
State     Recv-Q     Send-Q            Local Address:Port            Peer Address:Port      
LISTEN    0          128                     0.0.0.0:22                   0.0.0.0:*         
LISTEN    0          128                        [::]:22                      [::]:*         
ESTAB     0          0                         [::1]:22                     [::1]:59578     
ESTAB     0          0                         [::1]:59578                  [::1]:22         users:((&quot;ssh&quot;,pid=449,fd=3))
<font color="#8AE234"><b>keith@bionic</b></font>:<font color="#729FCF"><b>~/bin/socketstatfun</b></font>$ ss 80 -tl
State      Recv-Q      Send-Q            Local Address:Port           Peer Address:Port     
LISTEN     0           128                           *:http                      *:*        
<font color="#8AE234"><b>keith@bionic</b></font>:<font color="#729FCF"><b>~/bin/socketstatfun</b></font>$ ss 80 -tln
State      Recv-Q      Send-Q            Local Address:Port           Peer Address:Port     
LISTEN     0           128                           *:80                        *:*        
<font color="#8AE234"><b>keith@bionic</b></font>:<font color="#729FCF"><b>~/bin/socketstatfun</b></font>$ ss 53 -ulpen state all
State  Recv-Q  Send-Q      Local Address:Port     Peer Address:Port                         
UNCONN 0       0           192.168.122.1:53            0.0.0.0:*      ino:50413 sk:555 &lt;-&gt;  
UNCONN 0       0           127.0.0.53%lo:53            0.0.0.0:*      uid:101 ino:20773 sk:556 &lt;-&gt;
</pre>

## Disabling the Function
If you have sourced the ss function into your environment, it should be visible by running set, and paging through the output. You can set at least the first 20 lines of the ss function with:

* set | grep -A20 ^ss

To disable the function you can unset the name of the function:

* unset ss

## Example of Enabling and Disabling ss Function
<pre><font color="#EF2929"><b>ss</b></font> () 
{ 
    if test -z &quot;$SSOPT&quot;; then
        SSOPT=&quot;-a&quot;;
    fi;
    if test -z &quot;$1&quot;; then
        env <font color="#EF2929"><b>ss</b></font>;
        return 0;
    fi;
    A1=$(echo &quot;$1&quot; | tr -d &apos;-&apos;);
    if test &quot;$1&quot; != &quot;$A1&quot;; then
        env <font color="#EF2929"><b>ss</b></font> &quot;$@&quot;;
        return 0;
    else
        if test &quot;$1&quot; == &quot;state&quot;; then
            env <font color="#EF2929"><b>ss</b></font> &quot;$@&quot;;
            return 0;
        else
            shift;
            if test -z &quot;$@&quot;; then
                echo -e &quot;Executing: env <font color="#EF2929"><b>ss</b></font> $SSOPT \\( sport = :$A1 or dport = :$A1 \\)&quot;;
                env <font color="#EF2929"><b>ss</b></font> &quot;$SSOPT&quot; &quot;\( sport = :$A1 or dport = :$A1 \)&quot;;
            else
                echo -e &quot;Executing: env <font color="#EF2929"><b>ss</b></font> $@ \\( sport = :$A1 or dport = :$A1 \\)&quot;;
                env <font color="#EF2929"><b>ss</b></font> &quot;$@&quot; &quot;\( sport = :$A1 or dport = :$A1 \)&quot;;
            fi;
        fi;
    fi
}
</pre>

