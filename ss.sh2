set -e # exit on error
 ss -t -a
# ss -t -a -Z # SeLinux failed
 ss -u -a
 ss -o state established '( dport = :ssh or sport = :ssh )'
# ss -x src /tmp/.X11-unix/* # Failed for ordinary user
 ss -o state fin-wait-1 '( sport = :http or sport = :https )'
