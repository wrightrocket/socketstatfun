set -e # exit on error
read -p "Bypass function: ss -t -a" GO
 ss -t -a
read -p "Bypass function: ss -u -a" GO
 ss -u -a
read -p "Bypass function for established state" GO
 ss -o state established '( dport = :ssh or sport = :ssh )'
read -p "Bypass function for fin-wait-1 state" GO
 ss -o state fin-wait-1 '( sport = :http or sport = :https )'
