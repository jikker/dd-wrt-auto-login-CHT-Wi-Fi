#!/bin/sh
# default script path: /opt/script/login-cht-wifi.sh
# default curl path: /opt/usr/bin/curl
# original author: JustinTWD <justintwd@gmail.com>
# author: jikker <github@jikker.net>
# date: 2017/07/17
# note: phone number account format: number@emome.net
#       HN account format: HN@hinet.net

USERNAME=你的帳號
PASSWD=你的密碼
LOGFILE=/opt/log/cht-wifi.log
TMPSESSION=/tmp/cht_session.tmp

login_v2(){
rm -f $TMPSESSION
R1=$(/opt/usr/bin/curl -c $TMPSESSION -k \
$(/opt/usr/bin/curl -Ls -o /dev/null -w %{url_effective} http://google.com) 2>&1 \
| grep redirect_url= \
| awk -F"'" '{print $2}')

R2=$(/opt/usr/bin/curl -b $TMPSESSION -c $TMPSESSION -k -i $R1 2>&1 \
| grep Location \
| awk '{print $2}')

/opt/usr/bin/curl -b $TMPSESSION -c $TMPSESSION -k \
-H "Referer: $R2" \
-d cht_user=$USERNAME -d passwd=$PASSWD -d username=$USERNAME%40emome.net -d password=$PASSWD -d custom=cht \
https://wlangw.hinet.net/v2_0/cht_auth/auth_page.php
}

main(){
testing=$(/opt/usr/bin/curl -I www.google.com.tw | grep "200 OK")
#echo "============================================="
if [ "$testing" != "" ]; then
echo "`date` wifi logined."
elif [ "$1" == "" ]; then
echo "`date` You need login CHT Wi-Fi PWLAN."
echo "`date` You need login CHT Wi-Fi PWLAN." >> $LOGFILE
login_v2;
fi
}

main;

