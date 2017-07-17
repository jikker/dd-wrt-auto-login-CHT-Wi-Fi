#!/bin/sh
# default script path: /opt/script/login-cht-wifi.sh
# default curl path: /opt/usr/bin/curl
# author: jikker <github@jikker.net>
# date: 2017/07/17

check_login(){
    testing=$(/opt/usr/bin/curl -I www.google.com.tw | grep "200 OK")
    #echo "============================================="
    if [ "$testing" != "" ]; then
        return 1
    elif [ "$1" == "" ]; then
        return 0
    fi
}


$COUNT=0
while :
 do
     check_login
     chk=$?
     if [ "$chk" == "1" ]; then
         COUNT=0
     else
         if [ "$COUNT" == "5" ]; then
             echo "`date` disconnection 5 mins, time to reboot. REBOOT NOW!!"
             reboot
             COUNT=0
         else
             COUNT=$(($COUNT+1))
             echo $COUNT
         fi
     fi
   /opt/script/login-cht-wifi.sh
   sleep 60
done
