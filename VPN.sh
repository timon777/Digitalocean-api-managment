#!/bin/bash

########################## Auth Digitalocean #########################
key=" "
droplet=" "
######################################################################

start () { 
echo " " 
echo "VPS id:"$droplet
echo "-------------------------------------------" 
echo "1 Start VPS"
echo "2 Stop VPS"
echo "3 Reboot VPS"
echo "4 Info"
echo "5 Exit"
echo "###########################################" 
read doing 


case $doing in
1)
clear
curl -X POST -H 'Content-Type: application/json' -H 'Authorization: Bearer '$key'' -d '{"type":"power_on"}' "https://api.digitalocean.com/v2/droplets/"$droplet"/actions"
echo -en "\x0c"
start
;;
2)
clear
curl -X POST -H 'Content-Type: application/json' -H 'Authorization: Bearer '$key'' -d '{"type":"power_off"}' "https://api.digitalocean.com/v2/droplets/"$droplet"/actions"
echo -en "\x0c"
start
;;
3)
clear
curl -X POST -H 'Content-Type: application/json' -H 'Authorization: Bearer '$key'' -d '{"type":"reboot"}' "https://api.digitalocean.com/v2/droplets/"$droplet"/actions"
echo -en "\x0c"
start
;;
4)
clear
curl -X GET -H 'Content-Type: application/json' -H 'Authorization: Bearer '$key'' "https://api.digitalocean.com/v2/droplets?page=1&per_page=1"
echo -en "\x0c"
start
;;
5)
exit 0
;;
*) 
echo "Not correct"

esac 

}
start

